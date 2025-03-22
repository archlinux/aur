# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>
pkgname=mingw-w64-recode
pkgver=3.7.15
pkgrel=1
pkgdesc="Converts files between various character sets and usages (mingw-w64)"
arch=('any')
url='https://github.com/rrthomas/recode'
license=('GPL-3.0-or-later' 'LGPL-2.1-or-later')
depends=('mingw-w64-crt' 'mingw-w64-gettext')
options=('!strip' '!buildflags' 'staticlibs')
makedepends=('mingw-w64-gcc' 'mingw-w64-configure' 'mingw-w64-wine' 'python' 'help2man')
source=("https://github.com/rrthomas/recode/releases/download/v${pkgver}/recode-${pkgver}.tar.gz"
        "autotools.patch")
sha256sums=('f590407fc51badb351973fc1333ee33111f05ec83a8f954fd8cf0c5e30439806'
	    'e0eeaf5afec36c77b70a648c2ada06c3570a587e73a7a86e3eea26d2c96b24e0')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd ${srcdir}/recode-${pkgver}

  autoreconf -fi
  libtoolize

  patch -Np1 -i ${srcdir}/autotools.patch
}

build() {
  for _arch in ${_architectures}; do
    mkdir -p ${srcdir}/recode-${pkgver}/build-${_arch} && cd ${srcdir}/recode-${pkgver}/build-${_arch}
    ${_arch}-configure \
      --mandir=/usr/${_arch}/share/man \
      --infodir=/usr/${_arch}/share/info \
      --without-included-gettext
    make -j1
  done
}

package() {
  for _arch in ${_architectures}; do
    cd ${srcdir}/recode-${pkgver}/build-${_arch}
    make DESTDIR="${pkgdir}" install

    rm -r "${pkgdir}/usr/${_arch}/share"

    ${_arch}-strip -s "${pkgdir}/usr/${_arch}"/bin/*.exe
    ${_arch}-strip --strip-unneeded "${pkgdir}/usr/${_arch}"/bin/*.dll
    ${_arch}-strip -g "${pkgdir}/usr/${_arch}"/lib/*.a

    chmod 0644 "${pkgdir}/usr/${_arch}"/lib/librecode.dll.a
  done
}
