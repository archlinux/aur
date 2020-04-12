# $Id: PKGBUILD 244452 2015-08-20 20:37:01Z alucryd $
# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=mingw-w64-l-smash
pkgver=2.14.5
pkgrel=2
pkgdesc='MP4 muxer and other tools'
arch=('any')
url='https://github.com/l-smash/l-smash'
license=('custom')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc' 'fakeroot' "mingw-w64-environment")
options=(!strip !buildflags staticlibs)
source=("l-smash-${pkgver}.tar.gz::https://github.com/l-smash/l-smash/archive/v${pkgver}.tar.gz")
sha256sums=('e6f7c31de684f4b89ee27e5cd6262bf96f2a5b117ba938d2d606cf6220f05935')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    mkdir -p ${srcdir}/l-smash-${pkgver}/build-${_arch} && cd ${srcdir}/l-smash-${pkgver}/build-${_arch}

    source mingw-env ${_arch}

    ${srcdir}/l-smash-${pkgver}/configure \
       --prefix=/usr/${_arch} \
       --cross-prefix=${_arch}- \
       --enable-shared \
       --extra-cflags="$CFLAGS" \
       --extra-ldflags="$LDFLAGS"

    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd ${srcdir}/l-smash-${pkgver}/build-${_arch}

    source mingw-env ${_arch}

    make DESTDIR="${pkgdir}" install

    #install -dm 755 "${pkgdir}"/usr/share/licenses/l-smash
    #install -m 644 LICENSE "${pkgdir}"/usr/share/licenses/l-smash/
    ${_arch}-strip -s ${pkgdir}/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded ${pkgdir}/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g ${pkgdir}/usr/${_arch}/lib/*.a
  done
}

# vim: ts=2 sw=2 et:
