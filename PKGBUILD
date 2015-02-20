# Maintainer: Alexandre Ferrando <alferpal@gmail.com>

pkgname=iojs
pkgver=1.2.0
pkgrel=1
pkgdesc='Evented I/O for V8 JavaScript - Node.js fork'
url='http://iojs.org/'
license=('MIT')
arch=('i686' 'x86_64')
depends=('openssl' 'zlib' 'libuv')
makedepends=('python2' 'git')
optdepends=('python2: for node-gyp')
provides=('nodejs')
conflicts=('nodejs' 'iojs-bin')
options=('!emptydirs')
source=("https://iojs.org/dist/v${pkgver}/iojs-v${pkgver}.tar.gz")

#obtained from https://iojs.org/dist/$pkgver/SHASUMS256.txt
sha256sums=('33666fce914ca57ef60e2e29d7b02cd64c99a8609287a9227da2087ab9c65d9d')

prepare() {

  cd "${srcdir}/${pkgname}-v${pkgver}"

  msg "preparing python version"

  find -type f -exec sed \
    -e 's_^#!/usr/bin/env python$_&2_' \
    -e 's_^\(#!/usr/bin/python2\).[45]$_\1_' \
    -e 's_^#!/usr/bin/python$_&2_' \
    -e "s_'python'_'python2'_" -i {} \;
  find test/ -type f -exec sed 's_python _python2 _' -i {} \;
}

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"

  export PYTHON=python2
  ./configure \
    --prefix=/usr \
    --shared-openssl \
    --shared-zlib \
    --shared-libuv

  make
}

check() {
  cd "${pkgname}-v${pkgver}"
  make test || warning "Tests failed"
}

package() {
  cd "${srcdir}/${pkgname}-v$pkgver"
  make DESTDIR="$pkgdir" install

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/iojs/LICENSE
}
