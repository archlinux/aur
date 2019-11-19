# Maintainer: Keoma Borges <keomab at gmail dot com>

pkgname=nodejs12
pkgver=12.13.0
pkgrel=2
pkgdesc='Evented I/O for V8 javascript, version 12'
arch=('x86_64')
url='https://nodejs.org/'
license=('MIT')
depends=('openssl' 'zlib' 'icu64' 'libuv' 'c-ares' 'libnghttp2')
makedepends=('python2' 'procps-ng')
optdepends=('npm: nodejs package manager')
provides=('nodejs')
conflicts=('nodejs')
source=("nodejs-$pkgver.tar.gz::https://github.com/nodejs/node/archive/v$pkgver.tar.gz")
sha512sums=('4698b7f9fed657ca1707c33dbf5892dea396c3e049ece38e77db02ce80573ee1ad548d1103cdc963861d814288e579ae6332f9885258d511c4861df9ce40b7c3')

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

  export PYTHON=python2
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

# vim:set ts=2 sw=2 et: