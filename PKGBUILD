# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: James Campos <james.r.campos@gmail.com>
# Contributor: BlackEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Dongsheng Cai <dongsheng at moodle dot com>
# Contributor: Masutu Subric <masutu.arch at googlemail dot com>
# Contributor: TIanyi Cui <tianyicui@gmail.com>

pkgname=nodejs-ipv6
pkgver=14.7.0
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
source=(
"nodejs-$pkgver.tar.gz::https://github.com/nodejs/node/archive/v$pkgver.tar.gz"
"patch.diff")
sha512sums=(
"aa72d8bdc2c8e12f73f8a7f8207ec9aeae3c0993ec1fc842c0deff653f92f0dfeeca5e5ae81ecd9464e877150332c97e10162c4a4e9a6cdd72aad566f40ba6c6"
"ec70e2c49e8a75114e45f1af71519cf0445773e57579eaa51ddecfc134bdaaffb37bc7e863f3103d1f0ddcf4a26e41aa1be678d34c997916e59aecbfe3dd19e5")

build() {
  cd node-$pkgver
  patch lib/dns.js < "${srcdir}/patch.diff"

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

  make -j"$(($(nproc)-1))"
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
