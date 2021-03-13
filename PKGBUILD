# Maintainer: Eric Anderson <ejona86@gmail.com>
pkgname=airsane-git
pkgver=0.3.2.r0.g53909a5
pkgrel=1
pkgdesc="Publish SANE scanners to MacOS and Android via Apple AirScan"
arch=('i686' 'x86_64')
url="https://github.com/SimulPiscator/AirSane"
license=('GPL3')
depends=('avahi' 'libjpeg' 'libpng' 'libusb' 'sane')
makedepends=('cmake' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=()
source=("${pkgname%-git}::git+https://github.com/SimulPiscator/AirSane.git"
        "airsane-png-h.patch"
        "airsane-systemd-dir.patch")
md5sums=('SKIP'
         'c0adf20be58acc81963cdb83a3c6b75e'
         '3d7c6bc2b6c9993626a5d7e6580ee307')
sha256sums=('SKIP'
            'ef034dcdefbaf6b41873d33256b44756c5752184af6c885944527453d8a87162'
            '806b92de06b404fba23fb7f5c1bcdeecd7cf1d479481d2d61d5587c8a4354f69')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	patch -p1 -i "$srcdir/airsane-png-h.patch"
	patch -p1 -i "$srcdir/airsane-systemd-dir.patch"
}

build() {
	mkdir -p "$srcdir/build"
	cd "$srcdir/build"
	cmake -DCMAKE_INSTALL_PREFIX=/usr "../${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/build"
	make DESTDIR="$pkgdir" install
}
