# Contributor: Gavin Lloyd <gavinhungry@gmail.com>
# Maintainer: Stefan Husmann <stefan dot husmann at t minus online dot de>

pkgname=iojs-git
pkgver=v2.3.3.10.g84b3915
pkgrel=1
pkgdesc='Evented I/O for V8 JavaScript - Node.js fork'
url='http://iojs.org/'
license=('MIT')
arch=('i686' 'x86_64')
depends=('python2' 'gnuplot' 'openssl')
makedepends=( 'git')
provides=('nodejs' 'npm')
conflicts=('nodejs' 'iojs' 'npm')
options=('!emptydirs')
source=(git://github.com/iojs/io.js)
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/io.js"
  printf  %s  $(git describe --always | sed 's|-|.|g') 
}

prepare() {
  cd "${srcdir}/io.js"

  find -type f -exec sed \
    -e 's_^#!/usr/bin/env python$_&2_' \
    -e 's_^\(#!/usr/bin/python2\).[45]$_\1_' \
    -e 's_^#!/usr/bin/python$_&2_' \
    -e "s_'python'_'python2'_" -i {} \
    -e 's_^\( *exec \+\)python\( \+.*\)$_\1python2\2_'\
    -e 's_^\(.*\)python\( \+-c \+.*\)$_\1python2\2_' -i {} \;
       
  find test/ -type f -exec sed 's_python _python2 _' -i {} \;
  sed -i 's+(python)+(python2)+' node.gyp 
}

build() {
  cd "${srcdir}/io.js"

  export PYTHON=/usr/bin/python2
  export gyp
  ./configure \
    --prefix=/usr \
    --shared-openssl

  make
}

package() {
  cd "${srcdir}/io.js"
  make DESTDIR="$pkgdir" install

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
