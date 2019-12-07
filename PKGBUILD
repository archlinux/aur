# Maintainer: pingplug < aur at pingplug dot me >
# Contributor: Schala Zeal < schalaalexiazeal at gmail dot com >
# Contributor: ant32 < antreimer at gmail dot com >
# Contributor: Alexey Pavlov < Alexpux at gmail dot com >
# Contributor: Ray Donnelly < mingw dot android at gmail dot com >

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgname=mingw-w64-icu
pkgver=65.1
pkgrel=2
pkgdesc="International Components for Unicode library (mingw-w64)"
arch=('any')
url="http://site.icu-project.org"
license=('custom')
depends=('mingw-w64-crt>=6.0.0')
makedepends=('mingw-w64-configure')
options=('!strip' 'staticlibs' '!buildflags')
source=("https://github.com/unicode-org/icu/releases/download/release-${pkgver//./-}/icu4c-${pkgver//./_}-src.tgz"{,.asc}
        "0004-move-to-bin.mingw.patch"
        "0007-actually-move-to-bin.mingw.patch"
        "0008-data-install-dir.mingw.patch"
        "0009-fix-bindir-in-config.mingw.patch"
        "0011-sbin-dir.mingw.patch"
        "0012-libprefix.mingw.patch"
        "0014-mingwize-pkgdata.mingw.patch"
        "0015-debug.mingw.patch"
        "0016-icu-pkgconfig.patch"
        "0017-icu-config-versioning.patch"
        "0021-mingw-static-libraries-without-s.patch")
sha256sums=('53e37466b3d6d6d01ead029e3567d873a43a5d1c668ed2278e253b683136d948'
            'SKIP'
            '0b6f5ea91bb579f03cdfa2737719411e3207169f5921ffeea8564cf24fa46715'
            'a32b3fae6a59599c942e5f8bc2d29416aaedca0ce2832c857ecf99eb7529cee1'
            'f437f25a62420856ed234d2b33672b860ae00106cb5d4ccc682f5ff15176aeaf'
            'c84fda5b32edcbf062d629bbf04c47e73e7b9620f4dae752c1c0c25f49124ca8'
            '4f4787caeccf70607cf0cbde0c005f05f5c6de1543265a927839122405b4054f'
            'e7ecdafe85e18a4a4b5f29bbfde38776521a848e5b65089a2379b90e59f1592d'
            '426f2dc16a8f12c2aa91f6b2ab0533b41efdf60c946f14e267a5868af558dc4f'
            '0181f9ff8b7dd0a423869d8772da0a4feea64188347eb0dee7eb059aea92131c'
            '87ebe8962f8c387714f2a697a664a0c49aed2331b988548069d0c211abc36e05'
            '5247102df5604671c33a6e7226e5135a6b48049550861b892f0686dcefec4329'
            'd8612f40b1731d9a94290afcf80c896184a2f15b8ae8f23b3643c64f6cabfa2f')
validpgpkeys=("FFA9129A180D765B7A5BEA1C9B432B27D1BA20D7")

prepare() {
  cd icu
  patch -p1 -i ../0004-move-to-bin.mingw.patch
  patch -p1 -i ../0007-actually-move-to-bin.mingw.patch
  patch -p1 -i ../0008-data-install-dir.mingw.patch
  patch -p1 -i ../0009-fix-bindir-in-config.mingw.patch
  patch -p1 -i ../0011-sbin-dir.mingw.patch
  patch -p1 -i ../0012-libprefix.mingw.patch
  patch -p1 -i ../0014-mingwize-pkgdata.mingw.patch
  patch -p1 -i ../0015-debug.mingw.patch
  patch -p1 -i ../0016-icu-pkgconfig.patch
  patch -p1 -i ../0017-icu-config-versioning.patch
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
    mv "${pkgdir}"/usr/${_arch}/lib/*.dll "${pkgdir}"/usr/${_arch}/bin
    find "${pkgdir}/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip {} \;
    find "${pkgdir}/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "${pkgdir}/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
    ln -s "/usr/${_arch}/bin/icu-config" "${pkgdir}/usr/bin/${_arch}-icu-config"
  done
}

# vim:set ts=2 sw=2 et:
