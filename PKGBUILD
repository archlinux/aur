# Maintainer: Roland Plüss <roland@dragondreams.ch>
pkgname=('dragengine' 'deigde')
pkgbase=dragengine
pkgver=1.28.1
pkgrel=1
pkgdesc="Drag[en]gine game engine, launcher and editor"
arch=('x86_64')
url="https://dragondreams.ch/index.php/dragengine"
license=('MIT')
depends=('fontconfig'
         'freetype2'
         'glibc'
         'gcc-libs'
         'hicolor-icon-theme'
         'hidapi'
         'libevdev'
         'libglvnd'
         'libjpeg'
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
         'libxrandr'
         'libxrender'
         'openal'
         'openxr'
         'soundtouch'
         'xdg-utils'
         'zlib')
makedepends=('cmake'
             'gcc'
             'git'
             'glslang'
             'nasm'
             'patchelf'
             'scons')
# HEAD until arch package is properly set up
_commit='331178e1f330948d5a7b212e6e1551bb61c39033'
source=("${pkgname}-${pkgver}::git+https://github.com/LordOfDragons/dragengine.git?signed#commit=$_commit"
	'custom.py')
# makepkg -g
sha256sums=('d5738c8e8f0c14c410cfc8437c6880c23feab9206ecd914c8e0e70bb20816808'
            'ee9228918cd07e17e66ac9a4b1eab1d682678df57d3d3de1e2d3abd89004bdd3')
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
