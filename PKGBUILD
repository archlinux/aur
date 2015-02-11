# Maintainer: Alexandre Ferrando <alferpal@gmail.com>

pkgname=iojs
pkgver=1.2.0
pkgrel=1
pkgdesc='Evented I/O for V8 JavaScript - Node.js fork'
url='http://iojs.org/'
license=('MIT')
arch=('i686' 'x86_64')
depends=('openssl' 'zlib' )
makedepends=('python2' 'git')
optdepends=('python2: for node-gyp')
provides=('nodejs')
conflicts=('nodejs' 'iojs-bin')
options=('!emptydirs')
source=("$pkgname::git://github.com/iojs/io.js#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {

  cd "${srcdir}/${pkgname}"

  msg "preparing python version"

  find -type f -exec sed \
    -e 's_^#!/usr/bin/env python$_&2_' \
    -e 's_^\(#!/usr/bin/python2\).[45]$_\1_' \
    -e 's_^#!/usr/bin/python$_&2_' \
    -e "s_'python'_'python2'_" -i {} \;
  find test/ -type f -exec sed 's_python _python2 _' -i {} \;
}

build() {
  cd "${srcdir}/${pkgname}"

  export PYTHON=python2
  ./configure \
    --prefix=/usr \
    --shared-openssl \
    --shared-zlib

  make
}

check() {
  cd $pkgname
  make test || warning "Tests failed"
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="$pkgdir" install

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/iojs/LICENSE
}
