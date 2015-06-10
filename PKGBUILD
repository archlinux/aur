# $Id$
# Maintainer: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: tocer <tocer.deng@gmail.com>

pkgname=v8-3.14
pkgver=3.14.5
pkgrel=1
pkgdesc='A fast and modern javascript engine (old 3.14 version required for plv8)'
arch=('i686' 'x86_64')
url='http://code.google.com/p/v8'
license=('BSD')
depends=('gcc-libs' 'readline')
makedepends=('subversion' 'python2')
source=(http://commondatastorage.googleapis.com/chromium-browser-official/v8-$pkgver.tar.bz2)
sha256sums=('361ad3b63dc7c9d0943b72b1be592a8135e4ddb0e416b9bcf02b4d2df514fca7')
provides=('v8')
conflicts=('v8')

[[ "$CARCH" = 'i686' ]]   && ARCH=ia32
[[ "$CARCH" = 'x86_64' ]] && ARCH=x64

build() {
  cd v8-$pkgver

  # Fetch gyp
  make dependencies

  # The world isn't ready for python2
  export PYTHON=python2
  find build/ test/ tools/ src/ -type f \
    -exec sed -e 's_^#!/usr/bin/env python$_&2_' \
              -e 's_^\(#!/usr/bin/python2\).[45]$_\1_' \
              -e 's_^#!/usr/bin/python$_&2_' \
              -e "s_'python'_'python2'_" -i {} \;
  sed -i 's/python /python2 /' Makefile

  # -Werror causes errors with newer versions of GCC
  sed -i 's/-Werror//' build/standalone.gypi build/common.gypi

  make $ARCH.release library=shared console=readline
}

package() {
  cd v8-$pkgver

  install -Dm755 out/$ARCH.release/d8 $pkgdir/usr/bin/d8
  install -Dm755 out/$ARCH.release/lib.target/libv8.so $pkgdir/usr/lib/libv8.so.3.14.5

  install -d $pkgdir/usr/include
  install -Dm644 include/*.h $pkgdir/usr/include

  install -d $pkgdir/usr/share/licenses/v8
  install -m644 LICENSE* ${pkgdir}/usr/share/licenses/v8
}
