_orig_ver=1.14.10
_orig_patch=
_orig_fullver=$_orig_ver$_orig_patch

pkgname=bandwidth
pkgver=$_orig_ver${_orig_patch:+.$_orig_patch}
pkgrel=2
pkgdesc="Benchmark memory bandwidth"
arch=('i686' 'x86_64')
url="http://zs3.me/bandwidth"
license=('GPL')
depends=('freetype2')
makedepends=('nasm')
options=(!makeflags !debug)
sha256sums=('fece39a6dfb10c65033d6d79b2356e9ee714e936862b075ebdabd7277ce914a6')
source=("https://zs3.me/archives/${pkgname}-${_orig_fullver}.tar.bz2")

prepare() {
  cd "${srcdir}/${pkgname}-${_orig_fullver}"

  make clean
  ./configure
}

build() {
  cd "${srcdir}/${pkgname}-${_orig_fullver}"

  # makefile uses LIB instead of LDFLAGS, and needs to know where OOC is
  export LIB="${LDFLAGS} -lm OOC/libOOC.a $(pkg-config --libs freetype2)"

  if [ "${CARCH}" = "x86_64" ]; then
     make -f Makefile-linux-x86_64 bandwidth64
   else
     make -f Makefile-linux-i386 bandwidth32
  fi
}

package() {
  cd "${srcdir}/${pkgname}-${_orig_fullver}"
  if [ "${CARCH}" = "x86_64" ]; then
     install -Dm755 bandwidth64 "${pkgdir}"/usr/bin/bandwidth
   else
     install -Dm755 bandwidth32 "${pkgdir}"/usr/bin/bandwidth
  fi
}
