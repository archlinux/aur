# Maintainer: Azat Abdullin <abdullin@kspt.icc.spbstu.ru>
pkgname=dialer-phonepi
pkgver=1
pkgrel=10
pkgdesc="Dialer application and call daemon for PhonePi project"
url="https://gitlab.com/PhonePi"
arch=("i686" "x86_64" "armv6h")
license=("GPL2")
makedepends=("git" "cmake")
depends=("qt5-base" "qt5-tools" "qt5-declarative" "qt5-quickcontrols" "qt5-wayland" "glib2" "dbus" "dbus-glib")
source=('git+https://gitlab.com/PhonePi/Phone')
sha256sums=("SKIP")

build() {
	cd "$srcdir/Phone/src/phone/daemon"
	cmake . -DCMAKE_INSTALL_PREFIX=/usr
	make

	cd "$srcdir/Phone/src/phone/qt"
	qmake
	make
}

package() {
	cd "$srcdir/Phone/src/phone/daemon"
	make DESTDIR=$pkgdir install

	cd "$srcdir/Phone/src/phone/qt"
	install -Dm755 "./phone" "$pkgdir/usr/bin/phone"
	install -Dm600 --owner=$USER "./phone.desktop" "$pkgdir/$HOME/.local/share/applications/phone.desktop"
	install -Dm600 --owner=$USER "./phoneicon.ico" "$pkgdir/$HOME/.local/share/icons/phoneicon.ico"
}
