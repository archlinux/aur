# Maintainer: Eric Anderson <ejona86@gmail.com>
pkgname=airsane-git
pkgver=0.3.4.r2.g0736ea3
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
md5sums=('SKIP'
         '7c14c073eb6fae88baad06c195eb6907')
sha256sums=('SKIP'
            '10f53fb504224e5a814023342933a6143cde6af0f9479ab8ae4b5a84b929a5ea')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	patch -p1 -i "$srcdir/airsane-systemd-dir.patch"
	sed -i 's#/usr/local/#/usr/#g' systemd/airsaned.service
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
