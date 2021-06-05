# Maintainer: pingplug < aur at pingplug dot me >
# Contributor: Maxime Gauduin < alucryd at archlinux dot org >
# Contributor: PelPix < kylebloss at pelpix dot info >
# Contributor: DrZaius < lou at fakeoutdoorsman dot com >

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgname=mingw-w64-libfdk-aac
pkgver=2.0.2
pkgrel=1
pkgdesc="Fraunhofer FDK AAC codec library (mingw-w64)"
arch=('any')
url="https://sourceforge.net/projects/opencore-amr/"
license=('custom')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure')
options=('!strip' 'staticlibs' '!buildflags')
source=("https://downloads.sourceforge.net/opencore-amr/fdk-aac-${pkgver}.tar.gz")
sha256sums=('c9e8630cf9d433f3cead74906a1520d2223f89bcd3fa9254861017440b8eb22f')

build() {
  cd "${srcdir}/fdk-aac-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure
    make
    popd
  done
}

package () {
  cd "${srcdir}/fdk-aac-${pkgver}"
  for _arch in ${_architectures}; do
    pushd "build-${_arch}"
    make DESTDIR="${pkgdir}" install
    find "${pkgdir}/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip -x
    find "${pkgdir}/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g
    popd
  done
  install -dm 755 "${pkgdir}"/usr/share/licenses/${pkgname}
  install -m 644 NOTICE "${pkgdir}"/usr/share/licenses/${pkgname}/
}

# vim:set ts=2 sw=2 et:
