_orig_ver=1.12.3
_orig_patch=
_orig_fullver=$_orig_ver$_orig_patch

pkgname=bandwidth
pkgver=$_orig_ver${_orig_patch:+.$_orig_patch}
pkgrel=1
pkgdesc="Benchmark memory bandwidth"
arch=('i686' 'x86_64')
url="http://zsmith.co/bandwidth.php"
license=('GPL')
makedepends=('nasm')
options=(!makeflags !debug)
sha256sums=('6a756d244d1d93036b8e79aff66f9c939a95ac743d43489e50b62903bb96640c')
source=("https://zsmith.co/archives/${pkgname}-${_orig_fullver}.tar.bz2")

build() {
  cd "${srcdir}/${pkgname}-${_orig_fullver}"

  make clean

  # makefile uses LIB instead of LDFLAGS, and needs to know where OOC is
  export LIB="${LDFLAGS} -L ./OOC"

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
