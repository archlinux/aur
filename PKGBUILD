# $Id$
# Maintainer: Philipp Wolfer <ph.wolfer@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: James Campos <james.r.campos@gmail.com>
# Contributor: BlackEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Dongsheng Cai <dongsheng at moodle dot com>
# Contributor: Masutu Subric <masutu.arch at googlemail dot com>
# Contributor: TIanyi Cui <tianyicui@gmail.com>

pkgname=nodejs-4-lts
pkgver=4.4.5
pkgrel=1
pkgdesc='Evented I/O for V8 javascript (version 4 with long term support)'
arch=('i686' 'x86_64')
url='http://nodejs.org/'
license=('MIT')
provides=("nodejs=${pkgver}")
conflicts=('nodejs')
depends=('openssl' 'zlib' 'icu' 'libuv' 'http-parser') # 'v8')
makedepends=('python2' 'procps-ng')
optdepends=('npm: nodejs package manager')
source=("http://nodejs.org/dist/v$pkgver/node-v$pkgver.tar.gz")
sha256sums=('ea9c96ae4768feee4f18a26b819b9b4f6e49105ea0ee8c5c9d188dc8d49d4b77')

prepare() {
  cd node-v$pkgver

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
  cd node-v$pkgver

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

  # Workaround for g++ 6.x build issues,
  # see https://github.com/nodejs/node/issues/6648
  make -j8 CXX="g++ -fno-delete-null-pointer-checks"
  #make
}

check() {
  cd node-v$pkgver
  # Workaround for g++ 6.x build issues
  make -j8 CXX="g++ -fno-delete-null-pointer-checks" test
  #make test
}

package() {
  cd node-v$pkgver

  # Workaround for g++ 6.x build issues
  make -j8 CXX="g++ -fno-delete-null-pointer-checks" DESTDIR="$pkgdir" install
  #make DESTDIR="$pkgdir" install

  # install docs as per user request
  install -d "$pkgdir"/usr/share/doc/nodejs
  cp -r doc/api/{*.html,assets} \
    "$pkgdir"/usr/share/doc/nodejs

  install -D -m644 LICENSE \
    "$pkgdir"/usr/share/licenses/nodejs/LICENSE
}

# vim:set ts=2 sw=2 et:
