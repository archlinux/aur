# Maintainer: Roland Plüss <roland@dragondreams.ch>
pkgname=('dragengine' 'deigde')
pkgbase=dragengine
pkgver=1.35
pkgrel=1
pkgdesc="Drag[en]gine game engine, launcher and editor"
arch=('x86_64')
url="https://dragondreams.ch/index.php/dragengine"
license=('MIT')
depends=('fftw'
         'fontconfig'
         'freetype2'
         'glibc'
         'gcc-libs'
         'hicolor-icon-theme'
         'hidapi'
         'libavif'
         'libevdev'
         'libglvnd'
         'libjpeg-turbo'
         'libogg'
         'libpng'
         'libtheora'
         'libvorbis'
         'libvpx'
         'libwebp'
         'libx11'
         'libxext'
         'libxfixes'
         'libxft'
         'libxi'
         'libxkbcommon'
         'libxrandr'
         'libxrender'
         'openal'
         'openxr'
         'opus'
         'soundtouch'
         'svt-av1'
         'xdg-utils'
         'zlib')
makedepends=('cmake'
             'gcc'
             'git'
             'glslang'
             'nasm'
             'patchelf'
             'scons')
#_commit='331178e1f330948d5a7b212e6e1551bb61c39033'
#source=("${pkgname}-${pkgver}::git+https://github.com/LordOfDragons/dragengine.git?signed#commit=$_commit"
_tag="v${pkgver}"
source=("${pkgname}-${pkgver}::git+https://github.com/LordOfDragons/dragengine.git#tag=$_tag"
	'custom.py')
sha256sums=('dfadb511973a0469551c3f35d050510e8e35a0707d87221c06563ce436086acb'
            '8e232e334f3fccee81a9e612d87c484043f624da2d9a5223f7efe321031ccd81')
# Roland Plüss (roland@dragondreams.ch)
validpgpkeys=("E0ECD22F5F70777588450034446C9C667CFC1DF3")

build() {
	cd "dragengine-$pkgver"
	cp "$srcdir"/custom.py .
	echo "version = '$pkgver'" >>custom.py
	export CFLAGS="${CFLAGS} -fPIC"
	export CXXFLAGS="${CXXFLAGS} -fPIC"
	scons -j 8 build
}

package_dragengine() {
	pkgdesc="Drag[en]gine game engine and launcher"
	provides=('libdragengine.so'
		'libdelauncher.so')
	
	cd "dragengine-$pkgver"
	scons -j 8 --install-sandbox="$(realpath "$pkgdir")" \
		install_engine_runtime \
		delauncher_runtime \
		launcher_console \
		launcher_gui \
		dragengine_develop \
		delauncher_develop
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/dragengine/LICENSE
	
	# fixing manifest files commented out since striping libraries happens
	# after package_* call nullifying any attempt to fix the manifests.
	# instead with_engine_module_checks='no' is used in "custom.py" to
	# disable module checking altogether
	
	#for f in `find "$pkgdir"/usr/lib/dragengine/modules -type f -name "module.xml"`; do
	#	echo "Fix Manifest: $f"
	#	/usr/bin/python3 "$srcdir"/fixManifests.py "$f"
	#done
}

package_deigde() {
	pkgdesc="Drag[en]gine IGDE (Editor)"
	provides=('libdeigdeshared.so')
	depends=('dragengine'
             'glibc'
             'gcc-libs'
	         'xdg-utils'
	         'zlib')
	
	cd "dragengine-$pkgver"
	scons -j 8 --install-sandbox="$(realpath "$pkgdir")" \
		install_igde_runtime \
		deigde_shared_runtime \
		deigde_data \
		deigde_shared_develop
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/deigde/LICENSE
	rm -rf "$pkgdir"/dragengine-import-export
	
	# fixing manifest files commented out since striping libraries happens
	# after package_* call nullifying any attempt to fix the manifests.
	# instead with_engine_module_checks='no' is used in "custom.py" to
	# disable module checking altogether
	
	#for f in `find "$pkgdir"/usr/lib/deigde/modules -type f -name "module.xml"`; do
	#	echo "Fix Manifest: $f"
	#	/usr/bin/python3 "$srcdir"/fixManifests.py "$f"
	#done
}
