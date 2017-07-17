# Maintainer: Azat Abdullin <abdullin@kspt.icc.spbstu.ru>
pkgname=dialer-phonepi
pkgver=1
pkgrel=11
pkgdesc="Dialer application and call daemon for PhonePi project"
url="https://gitlab.com/PhonePi"
arch=("i686" "x86_64" "armv6h")
license=("GPL2")
makedepends=("git" "cmake")
depends=("qt5-base" "qt5-tools" "qt5-declarative" "qt5-quickcontrols" "qt5-wayland" "glib2" "dbus" "dbus-glib")
source=('git+https://gitlab.com/PhonePi/Phone')
sha256sums=("SKIP")

build() {
	cd "$srcdir/Phone/src/phone"
	cmake . -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$srcdir/Phone/src/phone"
	make DESTDIR=$pkgdir install

	install -Dm600 --owner=$USER "./qt/phone.desktop" "$pkgdir/$HOME/.local/share/applications/phone.desktop"
	install -Dm600 --owner=$USER "./qt/phoneicon.ico" "$pkgdir/$HOME/.local/share/icons/phoneicon.ico"
	for file in ./qt/pics/*; do
		fname=$(basename $file)
		install -Dm644 "$file" "$pkgdir/usr/share/dialer-phonepi/$fname"
	done
	install -Dm755 "./daemon/calls-daemon.service" "$pkgdir/usr/lib/systemd/system/calls-daemon.service"
	sed -i -e "s/User=.*/User=$USER/" "$pkgdir/usr/lib/systemd/system/calls-daemon.service"

	mkdir -p -m 777 "$pkgdir/usr/share/phonepi"
}
