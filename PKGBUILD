# Maintainer: Martchus <martchus@gmx.net>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Jeff 'codemac' Mickey <jeff@archlinux.org>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_name=cppunit
pkgname=mingw-w64-cppunit
pkgver=1.14.0
pkgrel=1
pkgdesc="A C++ unit testing framework (mingw-w64)"
arch=('any')
url="http://www.freedesktop.org/wiki/Software/cppunit"
license=('LGPL')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc' 'mingw-w64-configure')
options=(!strip !buildflags !libtool staticlibs !emptydirs)
source=("https://dev-www.libreoffice.org/src/${_name}-${pkgver}.tar.gz"
        0001-Don-t-redefine-NOMINMAX.patch)
sha256sums=('3d569869d27b48860210c758c4f313082103a5e58219a7669b52bfd29d674780'
            '68ae7a200a6bea8669268665c9a2b80c96a90fbf07273749184ce7a7f190cd40')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/${_name}-${pkgver}"
  for patch in "$srcdir/"*.patch; do
    msg2 "Applying patch $patch"
    patch -p1 -i "$patch"
  done
}

build() {
  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}/${_name}-${pkgver}/build-${_arch}"
    cd "${srcdir}/${_name}-${pkgver}/build-${_arch}"
    ${_arch}-configure
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}/${_name}-${pkgver}/build-${_arch}"
    cd "${srcdir}/${_name}-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/usr/${_arch}/share/"
    find "${pkgdir}/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip --strip-all {} \;
    find "${pkgdir}/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "${pkgdir}/usr/${_arch}" -name '*.a'   -exec ${_arch}-strip -g {} \;
  done
}
