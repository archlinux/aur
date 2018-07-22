# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=mingw-w64-libksba
pkgver=1.3.5
pkgrel=1
pkgdesc="A CMS and X.509 access library (mingw-w64)"
arch=('any')
url="https://www.gnupg.org/related_software/libksba/index.html"
license=('GPL')
makedepends=('mingw-w64-configure')
depends=('mingw-w64-libgpg-error')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://gnupg.org/ftp/gcrypt/libksba/libksba-${pkgver}.tar.bz2"
        "0001-fix-def.mingw.patch")
sha256sums=('41444fd7a6ff73a79ad9728f985e71c9ba8cd3e5e53358e70d5f066d35c1a340'
            '0252e688224bac2f008100a7c9139cd79b3c1b8321529ef672fea2d08206598a')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/libksba-${pkgver}"
  patch -p1 -i ${srcdir}/0001-fix-def.mingw.patch
}

build() {
  cd "${srcdir}/libksba-${pkgver}/"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --with-libgpg-error-prefix=/usr/${_arch} \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/libksba-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}
