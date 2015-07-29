# Maintainer: Alexandre Ferrando <alferpal@gmail.com>

pkgname=iojs
pkgver=2.5.0
_foldername=iojs-v${pkgver}
pkgrel=1
pkgdesc='Evented I/O for V8 JavaScript - Node.js fork'
url='http://iojs.org/'
license=('MIT')
arch=('i686' 'x86_64')
depends=('icu' 'openssl' 'zlib')
makedepends=('python2' 'git')
provides=('nodejs' 'npm')
conflicts=('nodejs' 'iojs-bin' 'npm')
options=('!emptydirs')
source=("https://iojs.org/dist/v${pkgver}/iojs-v${pkgver}.tar.gz")
sha256sums=('8d0b5f6a28655045d04cdc6fd2d4eb76fa2e02ad0610cdfc2a441f7c39ee404a')

prepare() {

  cd "${srcdir}/${_foldername}"

  msg "preparing python version"

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
  cd "${srcdir}/${_foldername}"

  export PYTHON=python2
  ./configure \
    --prefix=/usr \
    --shared-openssl \
    --shared-zlib \
    --with-intl=system-icu 
  make
}

check() {
  cd "${_foldername}"
  make test || warning "Tests failed"
}

package() {
  cd "${srcdir}/${_foldername}"
  make DESTDIR="$pkgdir" install

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/iojs/LICENSE
}
