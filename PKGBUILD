# Maintainer: Florian Bruhin <archlinux.org@the-compiler.org>
# Contributor: Alex Reznichenko <sa5gap@yandex.ru>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: Giuseppe Lucarelli <luk@rebelsoft.org>

pkgname=network-ups-tools-git
pkgver=v2.7.1.signed.r8.gb11d66f
pkgrel=2
pkgdesc="NUT is a collection of programs for monitoring and administering UPS hardware"
arch=('i686' 'x86_64')
url="http://www.networkupstools.org/"
license=('GPL2')
depends=('openssl' 'libusb-compat')
provides=('network-ups-tools')
conflicts=('network-ups-tools')
makedepends=('asciidoc')
backup=(etc/ups/{ups.conf,upsd.conf,upsd.users,upsmon.conf,upssched.conf})
install=nut.install
source=("git+https://github.com/networkupstools/nut.git"
		'upsd.init')
options=()
md5sums=('SKIP'
         '089ea4a56552253328d17603ff5670cc')

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
         --with-usb \
         --prefix=/usr \
         --with-udev-dir=/usr/lib/udev \
         --with-systemdsystemunitdir=/lib/systemd/system \
         --datadir=/usr/share/ups \
         --sbindir=/usr/bin \
         --with-drvpath=/usr/bin \
         --sysconfdir=/etc/ups

    make
}

package() {
    cd "$srcdir/nut"
    make DESTDIR="$pkgdir" install

    install -D -m755 "$srcdir/upsd.init" "$pkgdir/etc/rc.d/upsd"
    install -D -m644 conf/ups.conf.sample "$pkgdir/etc/ups/ups.conf"
    install -D -m640 conf/upsd.conf.sample "$pkgdir/etc/ups/upsd.conf"
    install -D -m640 conf/upsd.users.sample "$pkgdir/etc/ups/upsd.users"
    install -D -m640 conf/upsmon.conf.sample "$pkgdir/etc/ups/upsmon.conf"
    install -D -m644 conf/upssched.conf.sample "$pkgdir/etc/ups/upssched.conf"
}
