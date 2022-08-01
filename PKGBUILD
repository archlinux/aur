# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=assimp
pkgname=mingw-w64-${_pkgname}
pkgver=5.2.4
pkgrel=2
pkgdesc="Portable Open Source library to import various well-known 3D model formats in an uniform manner (mingw-w64)"
arch=('any')
license=('BSD')
depends=('mingw-w64-zlib' 'mingw-w64-boost' 'mingw-w64-minizip')
makedepends=('mingw-w64-cmake')
url='http://www.assimp.org/'
source=(
	"https://github.com/${_pkgname}/${_pkgname}/archive/v${pkgver}.tar.gz"
	'zlib.patch')
options=('!strip' '!buildflags' 'staticlibs' '!lto')
sha256sums=('6a4ff75dc727821f75ef529cea1c4fc0a7b5fc2e0a0b2ff2f6b7993fe6cb54ba'
            '91ce3c534de415c786212416861b7b13964bfb88da1af22553ef23d8b7aa02fc')

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'
_flags=(
	-Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS_RELEASE='-O2 -DNDEBUG' -DCMAKE_C_FLAGS_RELEASE='-O2 -DNDEBUG'
	-DASSIMP_BUILD_SAMPLES=OFF )
_srcdir="${_pkgname}-${pkgver}"

prepare ()
{
	cd "${_srcdir}"
	patch -ulbf 'code/Common/ZipArchiveIOSystem.cpp' < '../zlib.patch'
	sed -i 's/fprintf(pFile, this->szPlainText.c_str());/fprintf(pFile, "%s", this->szPlainText.c_str());/' 'tools/assimp_view/LogWindow.cpp'
	sed -i 's/set(LIBRARY_SUFFIX/#nope/' 'code/CMakeLists.txt'
	#sed -i 's/-static-libgcc -static-libstdc++ -Wl,-Bstatic//' 'code/CMakeLists.txt'
	sed -i 's/TARGET_LINK_LIBRARIES ( assimp_viewer/#nope/' 'code/CMakeLists.txt'
	sed -i 's/LINK_DIRECTORIES/#nope/' 'tools/assimp_cmd/CMakeLists.txt'
	sed -i 's/LINK_DIRECTORIES/#nope/' 'tools/assimp_view/CMakeLists.txt'
	sed -i 's/LINK_DIRECTORIES/#nope/' 'test/CMakeLists.txt'

	# Correct obvious bug
	sed -i 's/vlist.push_back(\*tlist_i.end())/vlist.push_back(tlist_i.back())/' 'code/AssetLib/X3D/X3DImporter_Geometry2D.cpp'
	sed -i 's/vlist.push_back(\*tlist_o.end())/vlist.push_back(tlist_o.back())/' 'code/AssetLib/X3D/X3DImporter_Geometry2D.cpp'	
	sed -i 's/if (sheen.sheenColorFactor == defaultSheenFactor)/if (sheen.sheenColorFactor[0] == defaultSheenFactor[0] \&\& sheen.sheenColorFactor[1] == defaultSheenFactor[1] \&\& sheen.sheenColorFactor[2] == defaultSheenFactor[2])/' 'code/AssetLib/glTF2/glTF2Exporter.cpp'

	# Obviously incorrect code
	sed -i 's|aaiFaces\[(\*iFace).iTexture\].push_back( 0 )|//nope|' 'code/AssetLib/SMD/SMDLoader.cpp'
}

build()
{
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}-static" "${_flags[@]}" -DASSIMP_BUILD_TESTS=OFF -DASSIMP_BUILD_ASSIMP_TOOLS=OFF \
			-DBUILD_SHARED_LIBS=OFF -DCMAKE_INSTALL_PREFIX="/usr/${_arch}/static"
		cmake --build "build-${_arch}-static"
		
		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}" -DASSIMP_BUILD_TESTS=OFF -DASSIMP_BUILD_ASSIMP_TOOLS=ON
		cmake --build "build-${_arch}"
	done
}

#check() {
#	for _arch in ${_architectures}; do
#		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}" -DASSIMP_BUILD_TESTS=ON
#		cmake --build "build-${_arch}"
#		cmake --build "build-${_arch}" --target test
#	done
#}

package () {
	for _arch in ${_architectures}; do
		DESTDIR="${pkgdir}" cmake --install "build-${_arch}-static"
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/static/lib/*.a
		
		DESTDIR="${pkgdir}" cmake --install "build-${_arch}"
		${_arch}-strip "$pkgdir"/usr/${_arch}/bin/*.exe
		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
	done
}
