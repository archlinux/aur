# $Id$
# Current Maintainer: Samuel Fernando Mesa Giraldo <samuelmesa@linuxmail.org>
# Original Maintainer: Kiswono Prayogo <kiswono@gmail.com>
# Original maintainer: Kaiting Chen <kaitocracy@gmail.com>
# Original contributor: tocer <tocer.deng@gmail.com>

pkgname=v8-3.20
pkgver=3.20.17
pkgrel=1
pkgdesc='A fast and modern javascript engine (old 3.21 version required for couchbase)'
arch=('i686' 'x86_64')
url='http://code.google.com/p/v8'
license=('BSD')
depends=('gcc-libs' 'readline')
options=('!emptydirs' '!strip')
makedepends=('subversion' 'python2')
source=(https://github.com/v8/v8-git-mirror/archive/$pkgver.tar.gz)
sha256sums=('5f721c5840b845fb1edc780e08652fec0968d90b0e6d5ae6c8afb5a6af1a76c2')
provides=('v8')
conflicts=('v8')

[[ "$CARCH" = 'i686' ]]   && ARCH=ia32
[[ "$CARCH" = 'x86_64' ]] && ARCH=x64

build() {
  cd v8-git-mirror-$pkgver

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
  sed -i 's/-Werror//' build/standalone.gypi build/toolchain.gypi

  library=shared make -j8 x64.release
}

package() {
  cd v8-git-mirror-$pkgver

  install -Dm755 out/$ARCH.release/d8 $pkgdir/opt/v8/bin/d8
  install -Dm755 out/$ARCH.release/lib.target/libv8.so $pkgdir/opt/v8/lib/libv8.so

  install -d $pkgdir/opt/v8/include
  install -Dm644 include/*.h $pkgdir/opt/v8/include

  install -d $pkgdir/opt/v8/licenses/v8
  install -m644 LICENSE* ${pkgdir}/opt/v8/licenses/v8
  
  install -d ${pkgdir}/etc/ld.so.conf.d
  echo "/opt/v8/lib" > ${pkgdir}/etc/ld.so.conf.d/v8.conf
}
