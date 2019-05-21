# Maintainer: pingplug < aur at pingplug dot me >
# Contributor: Schala Zeal < schalaalexiazeal at gmail dot com >

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgname=mingw-w64-lcms2
pkgver=2.9
pkgrel=1
pkgdesc="Small-footprint color management engine, version 2 (mingw-w64)"
arch=('any')
url="http://www.littlecms.com"
license=('MIT')
depends=('mingw-w64-crt'
         'mingw-w64-libtiff')
makedepends=('mingw-w64-configure')
options=('!strip' 'staticlibs' '!buildflags')
source=("https://downloads.sourceforge.net/sourceforge/lcms/lcms2-${pkgver}.tar.gz"
        "0002-need-jconfig-before-jmoreconfig.mingw.patch")
sha256sums=('48c6fdf98396fa245ed86e622028caf49b96fa22f3e5734f853f806fbc8e7d20'
            '3e85375a6b38de36e19fa7b4415b8c86aff492c0ef625932bec073d45e944339')

prepare() {
    cd lcms2-${pkgver}
    patch -p1 -i ${srcdir}/0002-need-jconfig-before-jmoreconfig.mingw.patch
    autoreconf -fi
}

build() {
  cd "${srcdir}"/${pkgname#mingw-w64-}-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${pkgname#mingw-w64-}-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    find "${pkgdir}/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip {} \;
    find "${pkgdir}/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "${pkgdir}/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}

# vim:set ts=2 sw=2 et:
