# Maintainer: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>

pkgname=nodejs-git
pkgver=0.12.7.52.g9660833
pkgrel=1
pkgdesc='Evented I/O for V8 javascript'
arch=('i686' 'x86_64')
url='http://nodejs.org/'
license=('MIT')
depends=('openssl')
makedepends=('python2' 'git')
provides=('nodejs')
conflicts=('nodejs')
options=('!emptydirs')
source=($pkgname::git://github.com/joyent/node.git)
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe | sed 's/^v//;s/-/./g'
}

prepare() {
  cd $pkgname

  msg 'Fixing for python2 name'
  find -type f -exec sed \
    -e 's_^#!/usr/bin/env python$_&2_' \
    -e 's_^\(#!/usr/bin/python2\).[45]$_\1_' \
    -e 's_^#!/usr/bin/python$_&2_' \
    -e "s_'python'_'python2'_" -i {} \;
  find test/ -type f -exec sed 's_python _python2 _' -i {} \;
}

build() {
  cd $pkgname

  export PYTHON=python2
  ./configure \
    --prefix=/usr \
    --shared-openssl

  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/nodejs/LICENSE
}
