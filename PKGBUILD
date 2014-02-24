# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>
# Contributor: Alex Reznichenko <sa5gap@yandex.ru>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: Giuseppe Lucarelli <luk@rebelsoft.org>
# Contributor: Dan Ziemba <zman0900@gmail.com>

pkgname=network-ups-tools
pkgver=2.7.1
pkgrel=3
pkgdesc="NUT is a collection of programs for monitoring and administering UPS hardware"
arch=('i686' 'x86_64')
url="http://www.networkupstools.org/"
license=('GPL2')
depends=('openssl' 'libusb-compat' 'libltdl' 'neon' 'net-snmp')
makedepends=('asciidoc')
backup=(etc/ups/{ups.conf,upsd.conf,upsd.users,upsmon.conf,upssched.conf})
install=nut.install
source=("http://www.networkupstools.org/source/2.7/nut-${pkgver}.tar.gz"
        "http://www.networkupstools.org/source/2.7/nut-${pkgver}.tar.gz.sig")
options=('!emptydirs' '!libtool')
sha256sums=('71a6d73ad6d910808126ba7f217ec1142a0c6709c63a22a099e7338960b2c798'
            'SKIP')

build() {
  cd "$srcdir/nut-$pkgver"
  ./configure \
	--without-wrap \
    --with-user=ups \
    --with-group=nut \
    --disable-static \
    --with-serial \
    --with-usb \
    --with-doc=html-single \
    --without-avahi \
    --with-snmp \
    --with-neon \
    --without-powerman \
    --without-ipmi \
    --without-freeipmi \
    --with-libltdl \
    --without-cgi \
    --prefix=/usr \
    --with-udev-dir=/usr/lib/udev \
    --with-systemdsystemunitdir=/lib/systemd/system \
    --datadir=/usr/share/ups \
    --sbindir=/usr/bin \
    --with-drvpath=/usr/bin \
    --sysconfdir=/etc/ups \
    --with-openssl
  make
}

package() {
  cd "$srcdir/nut-$pkgver"
  make DESTDIR="$pkgdir" install

  install -D -m644 "conf/ups.conf.sample" "$pkgdir/etc/ups/ups.conf"
  install -D -m640 "conf/upsd.conf.sample" "$pkgdir/etc/ups/upsd.conf"
  install -D -m640 "conf/upsd.users.sample" "$pkgdir/etc/ups/upsd.users"
  install -D -m640 "conf/upsmon.conf.sample" "$pkgdir/etc/ups/upsmon.conf"
  install -D -m644 "conf/upssched.conf.sample" "$pkgdir/etc/ups/upssched.conf"

  install -d -v -m755 "$pkgdir/usr/share/doc/network-ups-tools/images/cables"
  install -v -m 644 docs/*.html "$pkgdir/usr/share/doc/network-ups-tools"
  install -v -m 644 docs/images/*.png "$pkgdir/usr/share/doc/network-ups-tools/images"
  install -v -m 644 docs/images/cables/*.{png,jpg} "$pkgdir/usr/share/doc/network-ups-tools/images/cables"

  # Fix broken systemd unit
  cd "$pkgdir"
  sed -i 's|=/upsdrvctl|=/usr/bin/upsdrvctl|' usr/lib/systemd/system/nut-driver.service
}
