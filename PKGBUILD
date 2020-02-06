# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: James Campos <james.r.campos@gmail.com>
# Contributor: BlackEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Dongsheng Cai <dongsheng at moodle dot com>
# Contributor: Masutu Subric <masutu.arch at googlemail dot com>
# Contributor: TIanyi Cui <tianyicui@gmail.com>

pkgname=nodejs-ipv6
pkgver=13.8.0
pkgrel=1
pkgdesc='NodeJS patched to work in IPv6 only network'
arch=('x86_64')
provides=("${pkgname%-ipv6}")
conflicts=("${pkgname%-ipv6}")
url='https://nodejs.org/'
license=('MIT')
depends=('openssl' 'zlib' 'icu' 'libuv' 'c-ares' 'libnghttp2') # 'http-parser' 'v8')
makedepends=('python' 'procps-ng')
optdepends=('npm: nodejs package manager')
source=("nodejs-$pkgver.tar.gz::https://github.com/nodejs/node/archive/v$pkgver.tar.gz")
sha512sums=('187519194b2b666ad323a50800468e03d13fd52f0b66bef74679d9a40d61263d75060e055ecd63db3d471b2c914a1d6d562054dd65984efa67274320083b0dbf')

build() {
  cd node-$pkgver
  patch lib/dns.js < ../../patch.diff

  ./configure \
    --prefix=/usr \
    --with-intl=system-icu \
    --without-npm \
    --shared-openssl \
    --shared-zlib \
    --shared-libuv \
    --experimental-http-parser \
    --shared-cares \
    --shared-nghttp2
    # --shared-v8
    # --shared-http-parser

  make -j15
}

check() {
  cd node-$pkgver
  # Expected failure: https://github.com/nodejs/node/issues/11627
  make test || warning "Tests failed"
}

package() {
  cd node-$pkgver

  make DESTDIR="$pkgdir" install

  install -D -m644 LICENSE \
    "$pkgdir"/usr/share/licenses/nodejs/LICENSE
}

# vim:set ts=2 sw=2 et:
