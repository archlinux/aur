# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Dan McGee <dan@archlinux.org>
# Contributor: Michael Irwin <6d6469@gmail.com>

pkgname=memcached-git
pkgver=1.5.0.4.gb5ab581
pkgrel=1
pkgdesc='Distributed memory object caching system'
url='https://memcached.org/'
arch=('i686' 'x86_64')
license=('GPL')
depends=('libevent')
optdepends=('perl: for memcached-tool usage')
makedepends=('git')
provides=('memcached')
conflicts=('memcached')
install=memcached.install
source=(${pkgname}::"git+https://github.com/memcached/memcached#branch=next"
        memcached.service
        memcached.tmpfiles)
sha256sums=('SKIP'
            'fd60fde92b959dc4160facc0d165f04319d2ece4d2c59b68d8ae24824abea7dd'
            'c4d0ae2218b99a276ff6e0084ae81e66add0ca9347e4bde70e9172db6e44002a')
sha512sums=('SKIP'
            '5b006064b3ab31a6982f5c7b1ab4a49d64118a459913bd4be18ca63bf606dcae3550121d05a34ac8932d28b367e18fa76699c46e311b0b6a22f36ab1885ebebe'
            '960705ff74d25afed477e0b2a5872a3a4fb49ed3105a351f0d0224abc947778f9dbda81e80be94ab636da4a8411a9dd56a8fd4513e5b86a3096a14fa67f1548b')

pkgver() {
  cd ${pkgname}
  git describe --always | sed 's/^v//;s/-/./g'
}

prepare() {
  cd ${pkgname}
  ./autogen.sh
}

build() {
  cd ${pkgname}
  ./configure --prefix=/usr
  make
}

check() {
  cd ${pkgname}
  make test
}

package() {
  cd ${pkgname}
  make DESTDIR="${pkgdir}" install
  install -Dm 755 scripts/memcached-tool -t "${pkgdir}/usr/bin"
  install -Dm 644 "${srcdir}/memcached.service" -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm 644 "${srcdir}/memcached.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/memcached.conf"
}

# vim: ts=2 sw=2 et:
