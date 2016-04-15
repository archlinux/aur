# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>

pkgname=nodejs-git
pkgver=5.10.1.r5.g61167c3
pkgrel=1
pkgdesc='Evented I/O for V8 javascript'
arch=('i686' 'x86_64')
url='http://nodejs.org/'
license=('MIT')
depends=('openssl' 'zlib' 'icu' 'libuv' 'http-parser') # 'v8')
makedepends=('python2' 'procps-ng' 'git')
optdepends=('npm: nodejs package manager')
provides=('nodejs')
conflicts=('nodejs')
source=($pkgname::git://github.com/nodejs/node#branch=v5.x)
sha256sums=('SKIP')
options=('!makeflags')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  cd $pkgname

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
  cd $pkgname

  export PYTHON=python2
  ./configure \
    --prefix=/usr \
    --with-intl=system-icu \
    --without-npm \
    --shared-openssl \
    --shared-zlib \
    --shared-libuv \
    --shared-http-parser
    # --shared-v8

  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install

  # install docs as per user request
  install -d "$pkgdir"/usr/share/doc/nodejs-git
  cp -r doc/api/*.markdown \
    "$pkgdir"/usr/share/doc/nodejs-git

  install -D -m644 LICENSE \
    "$pkgdir"/usr/share/licenses/nodejs-git/LICENSE
}
