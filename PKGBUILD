# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>
# Contributor: Martchus <martchus@gmx.net>

pkgname=mingw-w64-xvidcore
pkgver=1.3.7
pkgrel=1
pkgdesc='XviD is an open source MPEG-4 video codec (mingw-w64)'
arch=('any')
url='http://www.xvid.org/'
license=('GPL')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc' 'nasm' 'yasm')
options=(!buildflags !strip staticlibs)
source=(https://downloads.xvid.com/downloads/xvidcore-${pkgver}.tar.gz)
sha256sums=('abbdcbd39555691dd1c9b4d08f0a031376a3b211652c0d8b3b8aa9be1303ce2d')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}/build-${_arch}"

    cp -r "${srcdir}"/xvidcore ${srcdir}/build-${_arch}/

    cd ${srcdir}/build-${_arch}/xvidcore/build/generic

    ./configure \
      --prefix=/usr/${_arch} \
      --host=${_arch}
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/build-${_arch}"/xvidcore/build/generic
    make DESTDIR="${pkgdir}" install

    ${_arch}-strip --strip-unneeded "${pkgdir}/usr/${_arch}"/bin/*.dll
    ${_arch}-strip -g "${pkgdir}/usr/${_arch}"/lib/*.a

    mv "${pkgdir}/usr/${_arch}"/lib/xvidcore.a "${pkgdir}/usr/${_arch}"/lib/libxvidcore.a
  done
}
