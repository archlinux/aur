pkgname=lumo-git
pkgver=1.4.1.r23.g72f396d
pkgrel=1
pkgdesc=' Fast, cross-platform, standalone ClojureScript REPL '
arch=('i686' 'x86_64')
url='https://github.com/anmonteiro/lumo'
license=('EPL-1.0')
#depends=('openssl' 'zlib' 'icu' 'libuv' 'http-parser') # 'v8')
makedepends=('python2' 'git' 'boot' 'yarn')
#optdepends=('npm: nodejs package manager')
provides=('lumo')
conflicts=('lumo')
source=(${pkgname%-git}::git+https://github.com/anmonteiro/lumo)
sha256sums=('SKIP')
options=('!makeflags')

pkgver() {
  cd ${pkgname%-git}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  cd ${pkgname%-git}

  #msg 'Fixing for python2 name'
  #find -type f -exec sed \
  #  -e 's_PYTHON ?= python_PYTHON ?= python2_' \
  #  -e 's_^#!/usr/bin/env python$_&2_' \
  #  -e 's_^\(#!/usr/bin/python2\).[45]$_\1_' \
  #  -e 's_^#!/usr/bin/python$_&2_' \
  #  -e 's_^\( *exec \+\)python\( \+.*\)$_\1python2\2_'\
  #  -e 's_^\(.*\)python\( \+-c \+.*\)$_\1python2\2_'\
  #  -e "s_'python'_'python2'_" -i {} \;
  #find -type f -exec sed 's_python _python2 _' -i {} \;
}

build() {
  cd ${pkgname%-git}

  #export PYTHON=python2
  #./configure \
  #  --prefix=/usr \
  #  --with-intl=system-icu \
  #  --without-npm \
  #  --shared-openssl \
  #  --shared-zlib \
  #  --shared-libuv \
  #  --shared-http-parser
  #  # --shared-v8

  rm -rf tmp
  mkdir tmp
  ln -s /usr/bin/python2 tmp/python
  PATH=$PWD/tmp:$PATH
  boot release-ci
}

package() {
  cd ${pkgname%-git}
  install -d $pkgdir/usr/bin
  cp build/lumo $pkgdir/usr/bin/
  #make DESTDIR="$pkgdir" install

  # install docs as per user request
  #install -d "$pkgdir"/usr/share/doc/nodejs-git
  #cp -r doc/api/*.md \
  #  "$pkgdir"/usr/share/doc/nodejs-git

  #install -D -m644 LICENSE \
  #  "$pkgdir"/usr/share/licenses/nodejs-git/LICENSE
}
