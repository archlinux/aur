# Maintainer: Christoph Scholz <christoph.scholz@gmail.com>
# Contributor: Philipp Wolfer <ph.wolfer@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: James Campos <james.r.campos@gmail.com>
# Contributor: BlackEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Dongsheng Cai <dongsheng at moodle dot com>
# Contributor: Masutu Subric <masutu.arch at googlemail dot com>
# Contributor: TIanyi Cui <tianyicui@gmail.com>

pkgname=nodejs-lts
pkgver=4.4.3
pkgrel=1
pkgdesc='Evented I/O for V8 javascript (LTS version)'
arch=('i686' 'x86_64')
url='http://nodejs.org/'
license=('MIT')
provides=("nodejs=${pkgver}")
conflicts=('nodejs')
depends=('openssl' 'zlib' 'icu' 'libuv' 'http-parser') # 'v8')
makedepends=('python2' 'procps-ng' 'git')
optdepends=('npm: nodejs package manager')
source=("http://nodejs.org/dist/v$pkgver/node-v$pkgver.tar.gz")
sha256sums=('8e67b95721aab7bd721179da2fe5dd97f9acc1306c15c9712ee103bcd6381638')

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

  make
}


check() {
  cd node-v$pkgver
  make test || warning "Tests failed"
}

package() {
  cd node-v$pkgver

  make DESTDIR="$pkgdir" install

  # install docs as per user request
  install -d "$pkgdir"/usr/share/doc/nodejs
  cp -r doc/api/{*.html,assets} \
    "$pkgdir"/usr/share/doc/nodejs

  install -D -m644 LICENSE \
    "$pkgdir"/usr/share/licenses/nodejs/LICENSE
}

# vim:set ts=2 sw=2 et:
