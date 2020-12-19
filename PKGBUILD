# Maintainer: Eric Anderson <ejona86@gmail.com>
pkgname=airsane-git
pkgver=r161.37fdbc7
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
         '9f972078a3388a210b86aac77c75cfa4')
sha256sums=('SKIP'
            'ef034dcdefbaf6b41873d33256b44756c5752184af6c885944527453d8a87162'
            '6be21eb5605d5c24f9ec6ca426c54e983a51d30eb2132db43f5e62cfdf6d7918')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
