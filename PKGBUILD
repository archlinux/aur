# Based on community/cjdns

pkgname=cjdns-libsodium
_pkgname=cjdns
pkgver=18
pkgrel=2
pkgdesc='A routing engine designed for security, scalability, speed and ease of use'
url='https://github.com/cjdelisle/cjdns'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('glibc' 'sh' 'libsodium')
makedepends=('nodejs' 'python2')
provides=('cjdns')
conflicts=('cjdns')
install=cjdns.install
source=(https://github.com/cjdelisle/${_pkgname}/archive/cjdns-v${pkgver}.tar.gz
        cjdns.sodium.patch
        cjdns.warnings.patch
        cjdns.sign.patch)
md5sums=('9f6600d9ed0d87d4e17fbc9155ff0368'
         'ba220c6f05f64bf238c47f21cc4be0ac'
         'e9db1f3f1ecd4d298f82186a12a385f3'
         'f4ce2698082965df427fa743041a9c19')

prepare() {
  cd ${_pkgname}-${_pkgname}-v${pkgver}
  patch -p1 -i "$srcdir"/cjdns.sodium.patch
  patch -p1 -i "$srcdir"/cjdns.warnings.patch
  patch -p1 -i "$srcdir"/cjdns.sign.patch
}

build() {
  cd ${_pkgname}-${_pkgname}-v${pkgver}
  CJDNS_RELEASE_VERSION="$pkgver" bash 'do'
}

package() {
  cd ${_pkgname}-${_pkgname}-v${pkgver}
  install -Dm755 cjdroute "$pkgdir/usr/bin/cjdroute"

  install -Dm644 contrib/systemd/cjdns.service \
    "$pkgdir/usr/lib/systemd/system/cjdns.service"
  install -Dm644 contrib/systemd/cjdns-resume.service \
    "$pkgdir/usr/lib/systemd/system/cjdns-resume.service"

  install -Dm644 doc/man/cjdroute.conf.5 \
    "$pkgdir/usr/share/man/man5/cjdroute.conf.5"
}

# vim: ts=2 sw=2 et:
