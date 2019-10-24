# Maintainer: Vsevolod Ivanov <rrt@archlinux.org>

pkgname=nodejs-10.10.0
pkgver=10.10.0
pkgrel=1
pkgdesc="Evented I/O for V8 javascript (LTS release: Erbium)"
arch=(x86_64)
url="https://nodejs.org/"
license=(MIT)
depends=(openssl zlib icu libuv c-ares libnghttp2) # http-parser
makedepends=(python2 procps-ng)
optdepends=('npm: nodejs package manager')
provides=("nodejs=$pkgver")
conflicts=(nodejs)
source=("${url}/dist/v${pkgver}/node-v${pkgver}.tar.xz")
sha256sums=(860eff976d83dd619849c0b4fab4cadb093ece2c718aaa5af8fb5ebbfa7d8a80)

prepare() {
  cd node-v${pkgver}

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
  cd node-v${pkgver}

  export PYTHON=python2
  ./configure \
    --prefix=/usr \
    --with-intl=system-icu \
    --without-npm \
    --shared-openssl \
    --shared-zlib \
    --shared-libuv \

  make
}

check() {
  cd node-v${pkgver}
  make test || warning "Tests failed"
}

package() {
  cd node-v${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
