pkgname=nodejs-lts-argon
pkgver=4.8.3
pkgrel=1
pkgdesc='Evented I/O for V8 javascript (LTS release: Argon)'
arch=('i686' 'x86_64')
url='https://nodejs.org/'
license=('MIT')
depends=('openssl-1.0' 'zlib' 'icu') # 'libuv' 'v8' 'c-ares')
makedepends=('python2' 'procps-ng')
optdepends=('npm: nodejs package manager')
provides=('nodejs')
conflicts=('nodejs')
source=("https://nodejs.org/dist/v$pkgver/node-v$pkgver.tar.xz" "icu59.patch")
sha256sums=('d84e7544c2e31a2d0825b4f8b093d169bf8bdb1881ee8cf75ff937918e59e9cb'
            'cbc1395c4d0cd66dd8757529f0fe1262a7c3534ed29b1c1e4de0d7b502237179')

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

  patch -p 1 -i ../icu59.patch
}

build() {
  cd node-v$pkgver
  export PKG_CONFIG_PATH=/usr/lib/openssl-1.0/pkgconfig
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
