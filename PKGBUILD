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

pkgname=nodejs-0.12
pkgver=0.12.15
pkgrel=1
pkgdesc='Evented I/O for V8 javascript (legacy version 0.12)'
arch=('i686' 'x86_64')
url='http://nodejs.org/'
license=('MIT')
provides=("nodejs=${pkgver}")
conflicts=('nodejs')
depends=('openssl' 'zlib' 'icu') # 'libuv' 'v8' 'c-ares')
makedepends=('python2' 'procps-ng')
optdepends=('npm: nodejs package manager')
source=("http://nodejs.org/dist/v$pkgver/node-v$pkgver.tar.gz")
sha256sums=('c446d40d9b0eb876dab9a87c3dbd1935dc85155d2ad991b36ddd6c5ca3825a5e')

prepare() {
  cd node-v$pkgver

  msg 'Fixing for python2 name'
  find -type f -exec sed \
    -e 's_^#!/usr/bin/env python$_&2_' \
    -e 's_^\(#!/usr/bin/python2\).[45]$_\1_' \
    -e 's_^#!/usr/bin/python$_&2_' \
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
    --shared-zlib
    # --shared-libuv
    # --shared-v8
    # --shared-cares

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
