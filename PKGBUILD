# Maintainer: jzbor <zborof at posteo dot de>
# This is an adjusted version of aur/touchegg which is maintained by:
# AwesomeHaircut <jesusbalbastro@gmail.com>
# jbouter <aur@kn0x.org>

_pkgname=touchegg
pkgname=touchegg-nosystemd
pkgver=2.0.12
pkgrel=1
pkgdesc="Multitouch gesture recognizer (with systemd support disabled)"
arch=('i686' 'x86_64')
url="https://github.com/JoseExposito/touchegg/"
license=('GPL3')
depends=('libinput' 'cairo' 'libx11' 'libxi' 'libxrandr' 'libxtst' 'pugixml' 'gtk3' 'glib2')
optdepends=( 'touchegg-openrc: openrc unit files for touchegg (no systemd)' )
#' This somehow fixes syntax highlighting with nvim
makedepends=('cmake')
provides=('touchegg')
conflicts=('touchegg')
# Workaround until 2.0.10
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=(f0ee467522c7c9f1295365324515d861888ed7645ffeccecca507ee87eed3e37)

build() {
	cmake -B build -S "$_pkgname-$pkgver" \
        -DUSE_SYSTEMD=OFF \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-Wno-dev
	make -C build
}

package() {

	make -C build DESTDIR="$pkgdir" install

	[ -d "$pkgdir/lib" ] && mv "$pkgdir/lib" "$pkgdir/usr/lib"

	install -Dm644 "$srcdir/$_pkgname-$pkgver/installation/touchegg.desktop" "$pkgdir/etc/xdg/autostart/touchegg.desktop"
}

