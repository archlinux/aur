# Maintainer: David McInnis <davidm@eagles.ewu.edu>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: James Campos <james.r.campos@gmail.com>
# Contributor: BlackEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Dongsheng Cai <dongsheng at moodle dot com>
# Contributor: Masutu Subric <masutu.arch at googlemail dot com>
# Contributor: TIanyi Cui <tianyicui@gmail.com>

pkgname=nodejs-bigger-heap
pkgver=6.7.0
pkgrel=1
pkgdesc='Evented I/O for V8 javascript: patched for 8Gb max heap size'
arch=('i686' 'x86_64')
url='http://nodejs.org/'
license=('MIT')
depends=('openssl' 'zlib' 'icu' 'libuv' 'http-parser') # 'v8')
makedepends=('python2' 'procps-ng' 'git')
optdepends=('npm: nodejs package manager')
provides=('nodejs')
conflicts=('nodejs')
source=("git+https://github.com/nodejs/node.git#tag=v$pkgver"
        "increase_heap_limit-4x.patch"
        "increase_heap_limit-8x.patch")
sha256sums=('SKIP'
            '60e99aa0750b1a46a66cfa5cb14b993007bcfcf0c7531780e52a715887f69982'
            'c0c9408173df4ad0586bd3b564815c464cb08c07365a49e311ab6ae578c91bb4')
            
[[ "$CARCH" = "i686" ]] && _patch="increase_heap_limit-4x.patch"
[[ "$CARCH" = "x86_64" ]] && _patch="increase_heap_limit-8x.patch"

prepare() {
  cd node

  msg 'Fixing for python2 name'
  find -type f -exec sed \
    -e 's_^#!/usr/bin/env python$_&2_' \
    -e 's_^\(#!/usr/bin/python2\).[45]$_\1_' \
    -e 's_^#!/usr/bin/python$_&2_' \
    -e 's_^\( *exec \+\)python\( \+.*\)$_\1python2\2_'\
    -e 's_^\(.*\)python\( \+-c \+.*\)$_\1python2\2_'\
    -e "s_'python'_'python2'_" -i {} \;
  find test/ -type f -exec sed 's_python _python2 _' -i {} \;
  patch -p1 < "../${_patch}"
}

build() {
  cd node

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
  cd node
  make test || warning "Tests failed"
}

package() {
  cd node

  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

# vim:set ts=2 sw=2 et:
