# Maintainer: Piyush Pangtey <pangteypiyush @ gmail.com>

pkgname=nodejs-lts-carbon
pkgver=8.9.1
pkgrel=1
pkgdesc='Evented I/O for V8 javascript'
arch=('i686' 'x86_64')
url='http://nodejs.org/'
license=('MIT')
depends=('openssl-1.0' 'zlib' 'icu' 'libuv' 'http-parser' 'c-ares') # 'v8')
makedepends=('python2' 'procps-ng')
optdepends=('npm: nodejs package manager')
conflicts=('nodejs')
provides=('nodejs')
source=("nodejs-$pkgver.tar.gz::https://github.com/nodejs/node/archive/v$pkgver.tar.gz")
sha512sums=("01d8b235943568ae37f440d45ae19697fb67505d408b1220c5ed5238a8d5a3ed5646b922800303fd0e1d936e7f83122b97faeb81b11bb8618c550f5be20b4273")

prepare() {
  cd node-$pkgver

  msg 'Fixing for python2 name'
  find -type f -exec sed \
    -e 's_^#!/usr/bin/env python$_&2_' \
    -e 's_^\(#!/usr/bin/python2\).[45]$_\1_' \
    -e 's_^#!/usr/bin/python$_&2_' \
    -e 's_^\( *exec \+\)python\( \+.*\)$_\1python2\2_'\
    -e 's_^\(.*\)python\( \+-c \+.*\)$_\1python2\2_'\
    -e "s_'python'_'python2'_" -i {} \;
  find test/ -type f -exec sed 's_python _python2 _' -i {} \;
}

build() {
  cd node-$pkgver

  export PKG_CONFIG_PATH=/usr/lib/openssl-1.0/pkgconfig
  export PYTHON=python2
  ./configure \
    --prefix=/usr \
    --with-intl=system-icu \
    --without-npm \
    --shared-openssl \
    --shared-zlib \
    --shared-libuv \
    --shared-http-parser \
    --shared-cares
    # --shared-v8

  make
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
