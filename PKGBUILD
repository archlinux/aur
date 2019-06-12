# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=lib32-libclc
pkgver=0.2.0+585+9f6204e
pkgrel=1
pkgdesc="Library requirements of the OpenCL C programming language"
arch=('any')
url="https://libclc.llvm.org/"
license=('MIT')
makedepends=('clang' 'llvm' 'git' 'python')
depends=('lib32-clang' 'lib32-llvm' 'libclc')
options=('staticlibs')
source=('git+http://llvm.org/git/libclc.git#commit=9f6204e')
sha256sums=('SKIP')

pkgver() {
  cd ${srcdir}/libclc

  echo 0.2.0+$(git rev-list --count HEAD)+$(git describe --always)
}

build() {
  cd ${srcdir}/libclc
  
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  export LDFLAGS+=' -m32'

  ./configure.py \
    --prefix=/usr \
    --libexecdir=/usr/lib32/clc \
    --pkgconfigdir=/usr/lib32/pkgconfig \
    --with-llvm-config=/usr/bin/llvm-config32 \
    --with-cxx-compiler="/usr/bin/g++ -m32"
  make
}

package() {
  cd ${srcdir}/libclc
  
  make install DESTDIR="${pkgdir}"
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}

