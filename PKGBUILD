# Maintainer: Rupus Reinefjord <rupus@kltrst.se>
# Contributor: Dmytro Bagrii <dimich.dmb@gmail.com>

pkgname=neard
pkgver=0.15
pkgrel=1
pkgdesc="Intel's Near Field Communication manager"
arch=('i686' 'x86_64')
url="https://01.org/linux-nfc/"
license=('GPL2')
depends=('glibc' 'dbus>=1.2' 'libnl' 'glib2>=2.28')
makedepends=('automake' 'autoconf>=2.60' 'libtool')
backup=(etc/neard/main.conf)
source=(http://git.kernel.org/cgit/network/nfc/neard.git/snapshot/$pkgname-$pkgver.tar.gz
        bindir.patch
        config.patch
        neard.service)
md5sums=('13446cb7502b7a97447778f62620bfdf'
         '5ab4e8d3ec2b8dd1d591483b072b07b4'
         '1e3cfed20a3dbdb7ee9d0946e1c8dc81'
         '3968d529bd6d1604f7e2ee3ce18fd3b6')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  patch -p1 -i $srcdir/bindir.patch

  patch -p1 -i $srcdir/config.patch

  ./bootstrap && \
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --disable-debug \
    --enable-tools

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install

  install -D -m644 "${srcdir}/neard.service" \
    "${pkgdir}/usr/lib/systemd/system/neard.service"

  install -D -m644 "${srcdir}/$pkgname-$pkgver/src/main.conf" \
    "${pkgdir}/etc/neard/main.conf"
}
