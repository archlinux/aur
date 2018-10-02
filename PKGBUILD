# Maintainer: Ding Xiao <tinocodfcdsa10@mails.tsinghua.edu.cn>

pkgname=sdsl-lite
pkgver=v2.1.1.r132.gddb0fbbc
pkgrel=3
pkgdesc="Succinct Data Structure Library 2.0"
arch=('i686' 'x86_64')
url="https://github.com/simongog/sdsl-lite"
license=('GPLv3')
makedepends=('git' 'cmake>=3.2.0')
depends=('gtest' 'libdivsufsort' 'libdivsufsort64')
provides=(sdsl-lite)
conflicts=(sdsl-lite)
source=(sdsl-lite::git+https://github.com/simongog/sdsl-lite.git)
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/sdsl-lite"
}

build() {
  cd "${srcdir}/sdsl-lite"

  if [[ -d build_ ]]; then
      rm -rf build_
  fi
  mkdir build_ && cd build_

  cmake -DCMAKE_INSTALL_PREFIX="/usr" ..
  make
}

package() {
  cd "${srcdir}/sdsl-lite/build_"
  make install DESTDIR="${pkgdir}/"

  install -D -m644 "${srcdir}/sdsl-lite/README.md" \
          "${pkgdir}/usr/share/doc/sdsl-lite/README"

  rm -r "${pkgdir}/usr/include/gtest"
  rm "${pkgdir}/usr/include/divsufsort.h"
  rm "${pkgdir}/usr/include/divsufsort64.h"
  rm "${pkgdir}/usr/lib/libgtest.a"
  rm "${pkgdir}/usr/lib/libgtest_main.a"
  rm "${pkgdir}/usr/lib/libdivsufsort.a"
  rm "${pkgdir}/usr/lib/libdivsufsort64.a"
  rm "${pkgdir}/usr/lib/pkgconfig/libdivsufsort.pc"
  rm "${pkgdir}/usr/lib/pkgconfig/libdivsufsort64.pc"
}
