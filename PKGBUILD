# Maintainer: Rachel Mant <aur@dragonmux.network>

pkgname=kicad6
pkgver=6.0.0
pkgrel=1
pkgdesc='Electronic schematic and printed circuit board (PCB) design tools'
arch=('x86_64')
url='http://kicad.org/'
license=('GPL')
depends=('wxgtk3' 'python' 'boost-libs' 'glew' 'curl' 'glm' 'ngspice' 'opencascade' 'python-wxpython')
makedepends=('cmake' 'zlib' 'mesa' 'boost' 'swig' 'ninja' 'tar' 'gzip')
optdepends=(
	'kicad-library: for footprints and symbols'
	'kicad-library-3d: for 3d models of components'
)
conflicts=('kicad')
source=(
	"https://gitlab.com/kicad/code/kicad/-/archive/$pkgver/kicad-$pkgver.tar.bz2"
)
sha256sums=(
	'9738daf54bb536d8264f58340c53fbe3df74eeef45d2b20fc3e6fd8786d76dec'
)

build()
{
	cd "$srcdir/kicad-$pkgver"

	rm -rf build
	mkdir build
	cd build
	cmake .. -G Ninja \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DKICAD_USE_OCC=ON \
		-DKICAD_SCRIPTING_WXPYTHON=ON \
		-DKICAD_DATA=/usr/share/kicad-nightly \
		-DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config-gtk3 \
		-Wno-dev
	ninja
}

package()
{
	cd "$srcdir/kicad-$pkgver/build"
	DESTDIR="$pkgdir" ninja install
}
