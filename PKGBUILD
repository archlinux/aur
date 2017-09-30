# Maintainer:  Florian Lindner <florian.lindner@xgm.de>
# Contributor: Jon Gjengset <jon@thesquareplanet.com>

pkgname=hotspot-git
pkgver=r289.ec0cf00
pkgrel=1
pkgdesc="The Linux perf GUI for performance analysis"
arch=('any')
url="https://github.com/KDAB/hotspot"
license=('GPL')
depends=('qt5-base>=5.6.0' 'libelf' 'elfutils' 'threadweaver' 'ki18n' 'kconfig' 'kitemviews' 'kcoreaddons' 'kitemmodels' 'kconfigwidgets')
makedepends=('git' 'cmake>=3.1.0' 'extra-cmake-modules')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('hotspot::git+https://github.com/KDAB/hotspot.git')
md5sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir"
	mkdir -p build-hotspot
	cd "${pkgname%-git}"
	git submodule update --init --recursive
}

build() {
	cd "$srcdir/build-hotspot"
	env CC=gcc CXX=g++ cmake "-DCMAKE_INSTALL_PREFIX=$pkgdir/usr" "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/build-hotspot"
	make install
	mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib"
	rm -rf "$pkgdir/usr/share/icons"
}
