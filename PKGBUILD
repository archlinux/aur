# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: James Campos <james.r.campos@gmail.com>
# Contributor: BlackEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Dongsheng Cai <dongsheng at moodle dot com>
# Contributor: Masutu Subric <masutu.arch at googlemail dot com>
# Contributor: TIanyi Cui <tianyicui@gmail.com>

pkgname=nodejs-ipv6
pkgver=14.13.0
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
"2efb27db91fa23446449ffd8f22eb0a5f77a7b6e27c7fe23fde30e64f115d6dfac54485e6cc9130b96c6ff4d3d9b4cfafdc935d20821ad29cc7e068dc671a4f4"
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
