# Maintainer: pingplug < aur at pingplug dot me >
# Contributor: Schala Zeal < schalaalexiazeal at gmail dot com >
# Contributor: ant32 < antreimer at gmail dot com >
# Contributor: Alexey Pavlov < Alexpux at gmail dot com >
# Contributor: Ray Donnelly < mingw dot android at gmail dot com >

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgname=mingw-w64-icu
pkgver=68.1
pkgrel=1
pkgdesc="International Components for Unicode library (mingw-w64)"
arch=('any')
url="http://site.icu-project.org"
license=('custom')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure')
options=('!strip' 'staticlibs' '!buildflags')
source=("https://github.com/unicode-org/icu/releases/download/release-${pkgver//./-}/icu4c-${pkgver//./_}-src.tgz"{,.asc}
        "0015-debug.mingw.patch"
        "0016-icu-pkgconfig.patch"
        "0021-mingw-static-libraries-without-s.patch")
sha256sums=('a9f2e3d8b4434b8e53878b4308bd1e6ee51c9c7042e2b1a376abefb6fbb29f2d'
            'SKIP'
            '0181f9ff8b7dd0a423869d8772da0a4feea64188347eb0dee7eb059aea92131c'
            '87ebe8962f8c387714f2a697a664a0c49aed2331b988548069d0c211abc36e05'
            'd8612f40b1731d9a94290afcf80c896184a2f15b8ae8f23b3643c64f6cabfa2f')
validpgpkeys=("0E51E7F06EF719FBD072782A5F56E5AFA63CCD33"
              "4569BBC09DA846FC91CBD21CE1BBA44593CF2AE0")

prepare() {
  cd icu
  patch -p1 -i ../0015-debug.mingw.patch
  patch -p1 -i ../0016-icu-pkgconfig.patch
  patch -p1 -i ../0021-mingw-static-libraries-without-s.patch

  cd source
  autoreconf -fi
}

build() {
  cd icu/source
  mkdir -p nativebuild && pushd nativebuild
  CC=gcc CXX=g++ ../configure --enable-static --disable-shared
  make
  popd
  for _arch in ${_architectures}; do
    mkdir build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --with-cross-build=${PWD}/../nativebuild \
      --with-data-packaging=library \
      --disable-rpath \
      --enable-release \
      --disable-tests \
      --disable-samples
    make
    popd
  done
}

package() {
  mkdir -p "${pkgdir}/usr/bin"
  for _arch in ${_architectures}; do
    cd "${srcdir}/icu/source/build-${_arch}"
    make install DESTDIR="${pkgdir}"
    find "${pkgdir}/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip {} \;
    find "${pkgdir}/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "${pkgdir}/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
    ln -s "/usr/${_arch}/bin/icu-config" "${pkgdir}/usr/bin/${_arch}-icu-config"
  done
}

# vim:set ts=2 sw=2 et:
