# Maintainer: Alexandre Ferrando <alferpal@gmail.com>

pkgname=iojs
pkgver=1.1.0
_npmver=2.5.1
pkgrel=1
pkgdesc='Evented I/O for V8 JavaScript - Node.js fork'
url='http://iojs.org/'
license=('MIT')
arch=('i686' 'x86_64')
depends=('openssl' 'zlib' 'libuv')
makedepends=('python2' 'git')
provides=('nodejs')
conflicts=('nodejs' 'iojs-bin')
options=('!emptydirs')
source=("$pkgname::git://github.com/iojs/io.js#tag=v$pkgver"
        "git+https://github.com/npm/npm.git#tag=v$_npmver")
sha256sums=('SKIP'
            'SKIP')

prepare() {
  cd "${srcdir}/${pkgname}"

  msg "Preparing npm"
  
  ## We need newer version of npm to fix test bugs
  rm -rf deps/npm
  ln -s "$srcdir/npm" deps
  rm -rf "$srcdir/npm/.git"

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

  msg "making iojs"

  export PYTHON=python2
  ./configure \
    --prefix=/usr \
    --shared-openssl \
    --shared-zlib \
    --shared-libuv

  make

  msg "iojs made"

  ln -s "${srcdir}/${pkgname}"/iojs "${srcdir}/${pkgname}"/node

  msg "making npm"

  cd ../npm
  ../$pkgname/iojs cli.js install ronn marked
  PATH="$srcdir/$pkgname:$PATH" make
  ../$pkgname/iojs cli.js uninstall ronn marked marked-man
}

check() {
  cd $pkgname
  msg "checking tests"
  make test || warning "Tests failed"
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="$pkgdir" install

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/iojs/LICENSE
}
