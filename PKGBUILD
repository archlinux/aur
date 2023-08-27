# Maintainer: Cody Schafer <archlinux@codyps.com>
# Contributor: Rupus Reinefjord <rupus@kltrst.se>
# Contributor: Dmytro Bagrii <dimich.dmb@gmail.com>

pkgname=neard
pkgver=0.19
pkgrel=1
pkgdesc="Intel's Near Field Communication manager"
arch=('i686' 'x86_64')
url="https://github.com/linux-nfc/neard"
license=('GPL2')
depends=('dbus>=1.2' 'libnl' 'glib2>=2.28' 'glibc')
makedepends=('automake' 'autoconf>=2.60' 'autoconf-archive' 'libtool')
backup=(etc/neard/main.conf)
source=($pkgname-$pkgver.tar.gz::https://github.com/linux-nfc/neard/archive/refs/tags/v$pkgver.tar.gz)
sha384sums=('892ad3b875db9b1b5de1b8ce8c64d1e2efecd35167066501ffbbe864187361073dddd892c0f992b61a1f7aa6acfb1a49')

build() {
  cd $pkgname-$pkgver
  ./bootstrap &&
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/$pkgname \
    --with-systemdsystemunitdir=/usr/lib/systemd/system \
    --with-systemduserunitdir=/usr/lib/systemd/user \
    --enable-systemd \
    --disable-debug \
    --enable-ese \
    --enable-tools

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make ${MAKEFLAGS} DESTDIR="$pkgdir/" install

  # This is a nodist header, but it still is installed for some reason
  # Having it installed breaks some packages that look for a local version.h
  # include, so remove it
  rm -f "${pkgdir}/usr/include/version.h"

  install -D -m644 "${srcdir}/$pkgname-$pkgver/src/main.conf" \
    "${pkgdir}/etc/neard/main.conf"
}
