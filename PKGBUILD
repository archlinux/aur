# Maintainer: Roland Plüss <roland@dragondreams.ch>
pkgname=('dragengine' 'deigde')
pkgbase=dragengine
pkgver=1.28.1
pkgrel=1
pkgdesc="Drag[en]gine game engine, launcher and editor"
arch=('x86_64')
url="https://dragondreams.ch/index.php/dragengine"
license=('MIT')
depends=('libx11'
	'libxrandr'
	'libglvnd'
	'libxi'
	'libxft'
	'libjpeg'
	'openal'
	'libogg'
	'libvorbis'
	'libtheora'
	'hidapi'
	'libevdev'
	'soundtouch'
	'libwebp'
	'libvpx'
	'freetype2'
	'libpng'
	'openxr'
	'xdg-utils')
makedepends=('git'
	'gcc'
	'scons'
	'cmake'
	'nasm'
	'patchelf'
	'glslang')
changelog="Changelog"
# HEAD until arch package is properly set up
_commit='7f796cbbef4747b0e84ebce4ce68ec2adbcef331'
source=("${pkgname}-${pkgver}::git+https://github.com/LordOfDragons/dragengine.git?signed#commit=$_commit"
	'custom.py'
	'fixManifests.py')
# makepkg -g
sha256sums=('cfd2e2cb76bb56790b08105adc245df3cd64b92ebc035eb2e1cea9cb19b38bb4'
	'ee9228918cd07e17e66ac9a4b1eab1d682678df57d3d3de1e2d3abd89004bdd3'
	'c12ee5a56a1e0b24f2157c20bf5d4679920ae5dc612dd81daec3b8cb8f02c6e1')
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
	install="dragengine.install"
	
	cd "dragengine-$pkgver"
	scons -j 8 --install-sandbox="$(realpath "$pkgdir")" \
		install_engine_runtime \
		delauncher_runtime \
		launcher_console \
		launcher_gui \
		dragengine_develop \
		delauncher_develop
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/dragengine/LICENSE
	#for f in `find "$pkgdir"/usr/lib/dragengine/modules -type f -name "module.xml"`; do
	#	echo "Fix Manifest: $f"
	#	/usr/bin/python3 "$srcdir"/fixManifests.py "$f"
	#done
}

package_deigde() {
	pkgdesc="Drag[en]gine IGDE (Editor)"
	provides=('libdeigdeshared.so')
	
	cd "dragengine-$pkgver"
	scons -j 8 --install-sandbox="$(realpath "$pkgdir")" \
		install_igde_runtime \
		deigde_shared_runtime \
		deigde_data \
		deigde_shared_develop
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/deigde/LICENSE
	rm -rf "$pkgdir"/dragengine-import-export
	#for f in `find "$pkgdir"/usr/lib/deigde/modules -type f -name "module.xml"`; do
	#	echo "Fix Manifest: $f"
	#	/usr/bin/python3 "$srcdir"/fixManifests.py "$f"
	#done
}
