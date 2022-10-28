# Maintainer: Francois Menning <f.menning@pm.me>
# Contributer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: James Campos <james.r.campos@gmail.com>
# Contributor: BlackEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Dongsheng Cai <dongsheng at moodle dot com>
# Contributor: Masutu Subric <masutu.arch at googlemail dot com>
# Contributor: TIanyi Cui <tianyicui@gmail.com>

pkgname=nodejs-lts-hydrogen
pkgver=18.12.0
pkgrel=2
pkgdesc='Evented I/O for V8 javascript'
arch=('x86_64')
url='https://nodejs.org/'
license=('MIT')
options=(!lto)
provides=("nodejs=$pkgver")
conflicts=(nodejs)
depends=('brotli' 'openssl' 'zlib' 'icu' 'libuv' 'libnghttp2' 'c-ares') # 'http-parser' 'v8')
makedepends=('python' 'procps-ng')
optdepends=('npm: nodejs package manager')
source=("https://github.com/nodejs/node/archive/v$pkgver/nodejs-$pkgver.tar.gz")
sha512sums=('1a5f076908ff0fe4e877d4d6085ea7dde38517fe5eba4492c37de7040afd92abc3d55974f203abbb93a49194ce815e2f22c4e9503a99ef3ebcb1bf269c4f3516')

build() {
  cd node-$pkgver

  ./configure \
    --prefix=/usr \
    --with-intl=system-icu \
    --without-npm \
    --shared \
    --shared-openssl \
    --shared-zlib \
    --shared-libuv \
    --experimental-http-parser \
    --shared-nghttp2 \
    --shared-cares \
    --shared-brotli
    # --shared-v8
    # --shared-http-parser

  make
}

check() {
  cd node-$pkgver
  make test || :
}

package() {
  cd node-$pkgver

  make DESTDIR="$pkgdir" install

  install -D -m644 LICENSE \
    "$pkgdir"/usr/share/licenses/nodejs/LICENSE

  cd "$pkgdir"/usr/lib
  ln -s libnode.so.* libnode.so
}

# vim:set ts=2 sw=2 et:
