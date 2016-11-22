# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>
# Contributor: Alex Reznichenko <sa5gap@yandex.ru>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: Giuseppe Lucarelli <luk@rebelsoft.org>
# Contributor: Dan Ziemba <zman0900@gmail.com>

pkgname=network-ups-tools-git
pkgver=v2.7.4.r158.gfc5f808
pkgrel=1
pkgdesc="NUT is a collection of programs for monitoring and administering UPS hardware"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://www.networkupstools.org/"
license=('GPL2')
depends=('openssl' 'libusb-compat' 'libltdl' 'neon' 'net-snmp')
provides=('network-ups-tools')
conflicts=('network-ups-tools')
makedepends=('asciidoc' 'git')
backup=(etc/ups/{ups.conf,upsd.conf,upsd.users,upsmon.conf,upssched.conf})
install=nut.install
source=("git+https://github.com/networkupstools/nut.git")
options=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/nut"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  find "$srcdir/nut" -name '*.py' -exec sed -i 's|^#!/usr/bin/env python|&2|' {} \;
}

build() {
  cd "$srcdir/nut"
  ./autogen.sh
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
    --with-systemdsystemunitdir=/usr/lib/systemd/system \
    --datadir=/usr/share/ups \
    --sbindir=/usr/bin \
    --with-drvpath=/usr/lib/network-ups-tools \
    --sysconfdir=/etc/ups \
    --with-openssl \
    --with-dev
  make
}

package() {
  cd "$srcdir/nut"
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
}
