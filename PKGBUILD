# Maintainer: pingplug <pingplug@foxmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: PelPix <kylebloss@pelpix.info>
# Contributor: DrZaius <lou[at]fakeoutdoorsman[dot]com>

pkgname=mingw-w64-libfdk-aac
pkgver=0.1.5
pkgrel=1
pkgdesc='Fraunhofer FDK AAC codec library(mingw-w64)'
arch=('any')
url='https://sourceforge.net/projects/opencore-amr/'
license=('custom')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure')
options=(staticlibs !strip !buildflags)
source=("http://downloads.sourceforge.net/opencore-amr/fdk-aac-${pkgver}.tar.gz")
sha256sums=('2164592a67b467e5b20fdcdaf5bd4c50685199067391c6fcad4fa5521c9b4dd7')

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
