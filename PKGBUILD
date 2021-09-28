# Maintainer: Rupus Reinefjord <rupus@kltrst.se>
# Contributor: Dmytro Bagrii <dimich.dmb@gmail.com>

pkgname=neard
pkgver=0.17
pkgrel=1
pkgdesc="Intel's Near Field Communication manager"
arch=('i686' 'x86_64')
url="https://github.com/linux-nfc/neard"
license=('GPL2')
depends=('dbus>=1.2' 'libnl' 'glib2>=2.28')
makedepends=('automake' 'autoconf>=2.60' 'libtool' 'chrpath')
backup=(etc/neard/main.conf)
source=(https://git.kernel.org/cgit/network/nfc/neard.git/snapshot/$pkgname-$pkgver.tar.gz
        bindir.patch
        config.patch
        neard.service)
md5sums=('cf64aa4d8c8c9186ead8e7bc5ed454e3'
         '5ab4e8d3ec2b8dd1d591483b072b07b4'
         '1e3cfed20a3dbdb7ee9d0946e1c8dc81'
         '3968d529bd6d1604f7e2ee3ce18fd3b6')

prepare() {
  cd $pkgname-$pkgver
  patch -p1 -i $srcdir/bindir.patch
  patch -p1 -i $srcdir/config.patch
}

build() {
  cd $pkgname-$pkgver
  ./bootstrap &&
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --disable-debug \
    --enable-tools

  make ${MAKEFLAGS}
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make ${MAKEFLAGS} DESTDIR="$pkgdir/" install

  # This is a nodist header, but it still is installed for some reason
  # Having it installed breaks some packages that look for a local version.h
  # include, so remove it
  rm -f "${pkgdir}/usr/include/version.h"

  # libtool automatically adds a "$builddir/usr/lib"
  chrpath -d "${pkgdir}/usr/bin/nciattach"
  chrpath -d "${pkgdir}/usr/bin/neard"
  chrpath -d "${pkgdir}/usr/bin/nfctool"

  install -D -m644 "${srcdir}/neard.service" \
    "${pkgdir}/usr/lib/systemd/system/neard.service"

  install -D -m644 "${srcdir}/$pkgname-$pkgver/src/main.conf" \
    "${pkgdir}/etc/neard/main.conf"
}
