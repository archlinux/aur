# $Id$
# Maintainer: Eduardo Bart <edub4rt@gmail.com>

pkgname=apcctrl
pkgver=0.8.9
pkgrel=1
pkgdesc="Power mangement and controlling for Brazil APC's nobreaks"
arch=(x86_64)
url="http://www.apcctrl.org"
license=('GPL')
depends=('gcc-libs' 'systemd-sysvcompat' 'libusb-compat')
makedepends=('pkgconfig' 'gd' 'gconf' 'gtk2')
backup=(etc/apcctrl/apcctrl.conf
        etc/apcctrl/changeme
        etc/apcctrl/commfailure
        etc/apcctrl/commok
        etc/apcctrl/offbattery
        etc/apcctrl/onbattery
        etc/apcctrl/apccontrol)
source=(http://downloads.sourceforge.net/apcupsd-brazil/$pkgname-$pkgver.tar.gz)
sha256sums=('3362e7ce1db2d668c5ece2334f636072d82388e301900e957443611fada84667')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr  --libexecdir=/usr/lib/$pkgname \
		--sbindir=/usr/bin
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	mkdir -p "$pkgdir/etc/systemd/system/"
    mkdir -p "$pkgdir/usr/bin"
    sed -i '/systemctl enable/d' platforms/archlinux/Makefile 
    sed -i '/systemctl start/d' platforms/archlinux/Makefile
	make DESTDIR="$pkgdir" install

    mv "$pkgdir"/usr/sbin/* "$pkgdir/usr/bin/"
    mkdir "$pkgdir/run"
    mv "$pkgdir/var/lock" "$pkgdir/run/lock/"
    rm -rf "$pkgdir/usr/sbin"
    rm -rf "$pkgdir/var"
	chmod 755 "$pkgdir"/usr/bin/*

	rm -rf "$pkgdir/usr/share/hal"
}
