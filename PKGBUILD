# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: James Campos <james.r.campos@gmail.com>
# Contributor: BlackEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Dongsheng Cai <dongsheng at moodle dot com>
# Contributor: Masutu Subric <masutu.arch at googlemail dot com>
# Contributor: TIanyi Cui <tianyicui@gmail.com>

pkgname=nodejs-ipv6
pkgver=13.7.0
pkgrel=1
pkgdesc='Evented I/O for V8 javascript'
arch=('x86_64')
provides=("${pkgname%-ipv6}")
conflicts=("${pkgname%-ipv6}")
url='https://nodejs.org/'
license=('MIT')
depends=('openssl' 'zlib' 'icu' 'libuv' 'c-ares' 'libnghttp2') # 'http-parser' 'v8')
makedepends=('python' 'procps-ng')
optdepends=('npm: nodejs package manager')
source=("nodejs-$pkgver.tar.gz::https://github.com/nodejs/node/archive/v$pkgver.tar.gz")
sha512sums=('1f4bec96b207a6650e3a031d9f37d75aa14b10e5540d33421145e770933052927def99c216fc8e12d849afa1bb4966e186c7ddc012e95b50aaaafc854aca85ce')

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
