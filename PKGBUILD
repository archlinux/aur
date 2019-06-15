# $Id$
# Maintainer: Eduardo Bart <edub4rt@gmail.com>

pkgname=apcctrl
pkgver=0.8.21
pkgrel=1
pkgdesc="Power mangement and controlling for Brazil APC's nobreaks"
arch=(x86_64)
url="http://www.apcctrl.com.br"
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
source=(https://ufpr.dl.sourceforge.net/project/apcctrl/$pkgname-$pkgver.tar.gz)
sha256sums=('ad3bc43de922f25e98db6e97390034600d094b257458b25ee8677b1c63b0f1bf')

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
  chmod 644 "$pkgdir/etc/systemd/system/apcctrl.service"

	rm -rf "$pkgdir/usr/share/hal"
}
