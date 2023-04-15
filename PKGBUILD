# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
# Contributor: mrxx <mrxx at cyberhome dot at>
# Contributor: Alexander Ulrich <a.ulrich@student.uni-tuebingen.de>
# Contributor: Henning Mueller <henning@orgizm.net>

pkgname=gatling
pkgver=0.16
pkgrel=3
pkgdesc='A high performance http and ftp server'
arch=(i686 x86_64)
url=https://www.fefe.de/gatling
license=(GPL)
conflicts=(gatling-bin)
makedepends=(libowfat dietlibc)
install=gatling.install
source=(
    "$url/$pkgname-$pkgver.tar.xz"
    "${pkgname}.service"
    "${pkgname}-ftp.service")
sha256sums=('5f96438ee201d7f1f6c2e0849ff273b196bdc7493f29a719ce8ed08c8be6365b'
            'c8a2116962ca0bfd18a056c520e2ad4331235edc620fb58dbc8b24beef876eed'
            '49843648501a3b038af512f0cac98b86aed77efb06cc732a1a58bd0118d98b11')

build() {
  cd $srcdir/$pkgname-$pkgver

  sed -i 's|/usr/local/include|/usr/include/libowfat|' GNUmakefile
  make gatling CFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS"
}

package() {
  cd $srcdir/$pkgname-$pkgver

  make BINDIR=${pkgdir}/usr/bin MANDIR=${pkgdir}/usr/share/man install
  rm ${pkgdir}/usr/share/man/man1/bench.1

  install -Dm644 -t "${pkgdir}/usr/lib/systemd/system/" "${srcdir}/${pkgname}.service" "${srcdir}/${pkgname}-ftp.service"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  _docdir=$pkgdir/usr/share/doc/gatling
  mkdir -p $_docdir && cp README* $_docdir
}
