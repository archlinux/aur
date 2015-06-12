# Maintainer: pingplug <pingplug@foxmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: PelPix <kylebloss@pelpix.info>
# Contributor: DrZaius <lou[at]fakeoutdoorsman[dot]com>

pkgname=mingw-w64-libfdk-aac
pkgver=0.1.4
pkgrel=1
pkgdesc='Fraunhofer FDK AAC codec library(mingw-w64)'
arch=('any')
url='http://sourceforge.net/projects/opencore-amr/'
license=('custom')
makedepends=('mingw-w64-configure')
options=(staticlibs !strip !buildflags)
source=("http://downloads.sourceforge.net/opencore-amr/fdk-aac-${pkgver}.tar.gz")
sha256sums=('5910fe788677ca13532e3f47b7afaa01d72334d46a2d5e1d1f080f1173ff15ab')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

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
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip -x
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g
    popd
  done
  
  install -dm 755 "${pkgdir}"/usr/share/licenses/${pkgname}
  install -m 644 NOTICE "${pkgdir}"/usr/share/licenses/${pkgname}/
}

# vim: ts=2 sw=2 et:
