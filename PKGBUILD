# Maintainer: Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com>
# Contributor: Jonjo McKay <jonjo@jonjomckay.com>

pkgname=libgroove
pkgver=4.2.1
pkgrel=2
pkgdesc='Library that provides decoding and encoding of audio on a playlist.'
arch=(i686 x86_64)
url='https://github.com/andrewrk/libgroove'
license=(MIT)
depends=(sdl2 chromaprint libebur128)
makedepends=(cmake yasm)
conflicts=(libgroove-git)
options=('strip' ccache)
source=("https://github.com/andrewrk/libgroove/archive/${pkgver}.tar.gz")
sha256sums=('82ba73ff44a3359f10899a11522521bdc9256b8bfad082a3fac49915e9f4d70f')

prepare() {
  mkdir "${srcdir}/${pkgname}-${pkgver}/build"
  cp "${srcdir}/${pkgname}-${pkgver}/example/libgroove.pc" "${srcdir}/"
  for pattern in \
      's|^libdir=$|libdir=/usr/lib|' \
      's|^includedir=$|includedir=/usr/include/groove|' \
      "s|^Version:$|Version: ${pkgver}|"
    do sed -i "${pattern}" "${srcdir}/libgroove.pc"
  done
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  cmake ../ -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  make -C "${srcdir}/${pkgname}-${pkgver}/build" DESTDIR="${pkgdir}/" install
  install -Dm 644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Created in the `prepare` function.
  install -Dm 644 "${srcdir}/libgroove.pc" \
    "${pkgdir}/usr/lib/pkgconfig/libgroove.pc"
}

# vim:set ts=2 sw=2 et:
