pkgname=msvc-wine-git
pkgver=18.7.3.514f8ea
pkgrel=1
pkgdesc='MSVC compiler with CMake toolchains. Compiler work in Wine64'
arch=('x86_64')
url='https://github.com/mstorsjo/msvc-wine'
license=(EULA)
depends=(libunwind wine cmake bash) # libunwind need to work wine64
makedepends=(git sed python python-simplejson python-six msitools)
optdepends=(
	'samba: Need to generate debug symbols (Debug and RelWithDebInfo build types)'
	'wine-mono: Required for Wine-hosted .NET tools such as MSBuild.exe/MSBuildTaskHost.exe'
	'lld: Required by MSVC+LLD CMake toolchains/vcpkg triplets (lld-link); workaround for link.exe hangs under Wine'
	'llvm: Required by clang-cl and MSVC+LLD CMake toolchains/vcpkg triplets (llvm-lib, llvm-mt, llvm-rc); supports the link.exe-hang workaround under Wine'
)
provides=(msvc-x86-cmake msvc-x64-cmake msvc-arm64-cmake)
conflicts=(msvc-wine)
source=('git+https://github.com/mstorsjo/msvc-wine.git'
		'msvc-cmake.sh'
		'toolchain-msvc.cmake'
		'toolchain-msvc-lld.cmake'
		'toolchain-clang-cl.cmake'
		'triplet-msvc.cmake'
		'triplet-msvc-lld.cmake'
		'triplet-clang-cl.cmake'
		'msvc-vcpkg.sh')
sha256sums=('SKIP'
			'f6e7660c2ecf32fedd16dbe7a8765ce902bdad21d7329fa57870b979ad682dd7'
			'ea2bda01685600ecf044c5685558cb3fea9f20025deb288ba5270b5bb715d97f'
			'4fdcd74149980bb502a97befac0d5d7dc513b8dcaaf7d899fc1af4e75332da3a'
			'8624137bc158f39245d5e77d0bff7c6b67ac2f3d56f7e39bfaa25cc20192d989'
			'7536e54ce31880cff6029e6414a94361998aaa82e7cafecc7d7e25c981736632'
			'0355c500cf493f4a77c7d3789fc79e701331fd9e9899552da1a0f04e9bf53c7c'
			'35b91ef0a8f5d19b58729f7028652a14b02bb53d55c0a60ac11b92e3eb8ec032'
			'c7a10eda1db4b6ef346d64e5e102b3a62e96b5641b79a19e6e27cd8536f79307')
options=('!strip' 'libtool' 'staticlibs' 'emptydirs')

_architectures="x86 x64 arm64"

pkgver() {
	VS_VERSION=`python msvc-wine/vsdownload.py --print-version | grep "Loaded installer manifest for "`
	echo -n ${VS_VERSION:30} | sed 's/\.\([^.]*\) (.*)$/.r\1/'
	echo ".$(git -C msvc-wine rev-parse --short HEAD)"
}

prepare() {
	declare -A _cmake_architectures
	_cmake_architectures["x86"]="i686"
	_cmake_architectures["x64"]="x86_64"
	_cmake_architectures["arm64"]="aarch64"

	for _arch in ${_architectures}; do
		sed "s|@PROCESSOR@|${_arch}|g" msvc-cmake.sh > msvc-${_arch}-cmake
		sed "s|@PROCESSOR@|${_arch}|g" toolchain-msvc.cmake > toolchain-${_arch}.cmake
		sed "s|@CMAKE_PROCESSOR@|${_cmake_architectures[$_arch]}|g" -i toolchain-${_arch}.cmake
		sed "s|@PROCESSOR@|${_arch}|g" toolchain-msvc-lld.cmake > toolchain-${_arch}-lld.cmake
		sed "s|@CMAKE_PROCESSOR@|${_cmake_architectures[$_arch]}|g" -i toolchain-${_arch}-lld.cmake
		sed "s|@PROCESSOR@|${_arch}|g" toolchain-clang-cl.cmake > toolchain-${_arch}-clang.cmake
		sed "s|@CMAKE_PROCESSOR@|${_cmake_architectures[$_arch]}|g" -i toolchain-${_arch}-clang.cmake
		sed "s|@PROCESSOR@|${_arch}|g" triplet-msvc.cmake > triplet-${_arch}-msvc.cmake
		sed "s|@PROCESSOR@|${_arch}|g" triplet-msvc-lld.cmake > triplet-${_arch}-lld.cmake
		sed "s|@PROCESSOR@|${_arch}|g" triplet-clang-cl.cmake > triplet-${_arch}-clang.cmake
	done
}

build() {
	cd msvc-wine
	mkdir -p "${srcdir}/../cache"
	python vsdownload.py --accept-license --dest "${srcdir}/msvc" --cache "${srcdir}/../cache"
	sh install.sh "${srcdir}/msvc"
	cd -
}

package() {
	for _arch in ${_architectures}; do
		cat "${srcdir}/msvc/bin/${_arch}/msvcenv.sh" | sed 's/^BASE=.*/BASE='z:\\\\\\\\opt\\\\\\\\msvc/ > "${srcdir}/msvc/bin/${_arch}/msvcenv.sh.patched"
		cat "${srcdir}/msvc/bin/${_arch}/msvcenv.sh.patched" | sed 's/BASE_UNIX=.*/BASE_UNIX='\\/opt\\/msvc/ > "${srcdir}/msvc/bin/${_arch}/msvcenv.sh"
		rm "${srcdir}/msvc/bin/${_arch}/msvcenv.sh.patched"

		MSVCVER=`grep MSVCVER= "${srcdir}/msvc/bin/${_arch}/msvcenv.sh"`
		SDKVER=`grep SDKVER= "${srcdir}/msvc/bin/${_arch}/msvcenv.sh"`
		SDK_UNIX=`grep SDK_UNIX= "${srcdir}/msvc/bin/${_arch}/msvcenv.sh"`
		INCLUDE_DIRS="include_directories (BEFORE SYSTEM /opt/msvc/vc/tools/msvc/${MSVCVER:8}/include /opt/msvc/${SDK_UNIX:9}/include/${SDKVER:7}/shared /opt/msvc/${SDK_UNIX:9}/include/${SDKVER:7}/ucrt /opt/msvc/${SDK_UNIX:9}/include/${SDKVER:7}/um /opt/msvc/${SDK_UNIX:9}/include/${SDKVER:7}/winrt /opt/msvc/${SDK_UNIX:9}/include/${SDKVER:7}/cppwinrt/winrt)"

		# Create toolchains for IDE's to resolve include dirs in VSCode, QtCreator, etc
		# NOTE: For correct clangd works it also required flag `-fms-compatibility-version=19.37` (or newer) in .clangd config or compile_commands.json
		echo "include (/opt/msvc/cmake/toolchain-${_arch}.cmake)" > toolchain-${_arch}-ide.cmake
		echo "$INCLUDE_DIRS" >> toolchain-${_arch}-ide.cmake

		# Create toolchains for clang-cl
		echo "$INCLUDE_DIRS" >> toolchain-${_arch}-clang.cmake
		echo "link_directories (BEFORE /opt/msvc/vc/tools/msvc/${MSVCVER:8}/lib/${_arch} /opt/msvc/${SDK_UNIX:9}/lib/${SDKVER:7}/ucrt/${_arch} /opt/msvc/${SDK_UNIX:9}/lib/${SDKVER:7}/um/${_arch})" >> toolchain-${_arch}-clang.cmake

		# Create toolchains for cl.exe + lld-link
		echo "$INCLUDE_DIRS" >> toolchain-${_arch}-lld.cmake
		echo "link_directories (BEFORE /opt/msvc/vc/tools/msvc/${MSVCVER:8}/lib/${_arch} /opt/msvc/${SDK_UNIX:9}/lib/${SDKVER:7}/ucrt/${_arch} /opt/msvc/${SDK_UNIX:9}/lib/${SDKVER:7}/um/${_arch})" >> toolchain-${_arch}-lld.cmake

		# Create toolchains for IDE's to resolve include dirs in VSCode, QtCreator, etc
		echo "# NOTE: link.exe can get stuck under Wine; this MSVC+LLD mix is a workaround." > toolchain-${_arch}-lld-ide.cmake
		echo "include (/opt/msvc/cmake/toolchain-${_arch}-lld.cmake)" >> toolchain-${_arch}-lld-ide.cmake
	done
	
	mkdir -p "${pkgdir}/opt/msvc"
	mv "${srcdir}/msvc" "${pkgdir}/opt"
	
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/opt/msvc/cmake/ide"
	mkdir -p "${pkgdir}/opt/msvc/cmake/vcpkg_triplets"
	
	for _arch in ${_architectures}; do
		mkdir -p "${pkgdir}/opt/msvc/cmake/find_root/${_arch}"
		mv "${srcdir}/toolchain-${_arch}.cmake" "${pkgdir}/opt/msvc/cmake/toolchain-${_arch}.cmake"
		mv "${srcdir}/toolchain-${_arch}-lld.cmake" "${pkgdir}/opt/msvc/cmake/toolchain-${_arch}-lld.cmake"
		mv "${srcdir}/toolchain-${_arch}-clang.cmake" "${pkgdir}/opt/msvc/cmake/toolchain-${_arch}-clang.cmake"
		mv "${srcdir}/toolchain-${_arch}-ide.cmake" "${pkgdir}/opt/msvc/cmake/ide/toolchain-${_arch}.cmake"
		mv "${srcdir}/toolchain-${_arch}-lld-ide.cmake" "${pkgdir}/opt/msvc/cmake/ide/toolchain-${_arch}-lld.cmake"
		mv "${srcdir}/msvc-${_arch}-cmake" "${pkgdir}/usr/bin/msvc-${_arch}-cmake"
		mv "${srcdir}/triplet-${_arch}-msvc.cmake" "${pkgdir}/opt/msvc/cmake/vcpkg_triplets/${_arch}-windows.cmake"
		mv "${srcdir}/triplet-${_arch}-lld.cmake" "${pkgdir}/opt/msvc/cmake/vcpkg_triplets/${_arch}-windows-lld.cmake"
		mv "${srcdir}/triplet-${_arch}-clang.cmake" "${pkgdir}/opt/msvc/cmake/vcpkg_triplets/${_arch}-windows-clang.cmake"
		chmod 755 "${pkgdir}/usr/bin/msvc-${_arch}-cmake"
	done

	mv "${srcdir}/msvc-vcpkg.sh" "${pkgdir}/usr/bin/msvc-vcpkg"
	chmod 755 "${pkgdir}/usr/bin/msvc-vcpkg"
}
