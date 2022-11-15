_orig_ver=1.11.2
_orig_patch=c
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
sha256sums=('1f4cc154424c811e66fc9eb96d66a8ed8e874f6900398e666acbda2a1fd562fd'
            '3d997fa73b24608ae47d02849b8fd63e5168327b1be3f2fa6088317282c8d91b')
source=("https://zsmith.co/archives/${pkgname}-${_orig_fullver}.tar.gz"
        make-clean-fix.patch)

prepare() {
  cd "${srcdir}"
  patch -N -p0 -d "${pkgname}-${_orig_fullver}" < make-clean-fix.patch
}

build() {
  cd "${srcdir}/${pkgname}-${_orig_fullver}"

  make clean

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
