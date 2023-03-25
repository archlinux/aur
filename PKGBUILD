# Maintainer: Eric Anderson <ejona86@gmail.com>
pkgname=airsane-git
pkgver=0.3.5.r0.gfef10a4
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
        "airsane-systemd-dir.patch")
sha256sums=('SKIP'
            '0d92b2984b4c2362027aea195e6c2d2bda5961ce568e1b3472e3678525e3dcc2')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
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
