# Maintainer: Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com>
# Contributor: epitron <chris@ill-logic.com>
# Contributor: Jonjo McKay <jonjo@jonjomckay.com>

pkgname=libgroove-git
_pkgname=libgroove
pkgver=4.3.0.1.gd56306e
pkgrel=1
pkgdesc='Library that provides decoding and encoding of audio on a playlist.'
arch=(i686 x86_64)
url='https://github.com/andrewrk/libgroove'
license=(MIT)
depends=(sdl2 chromaprint libebur128)
makedepends=(cmake yasm)
provides=(libgroove)
conflicts=(libgroove)
options=('strip' ccache)
source=('git+https://github.com/andrewrk/libgroove.git')
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --always | sed 's/-/./g'
}

prepare() {
  # The version inserted in to libgroove.pc includes no hash. It is something
  # like "4.2.1". This matches what libgroove itself reports.
  mkdir "${srcdir}/${_pkgname}/build"
  cp "${srcdir}/${_pkgname}/example/libgroove.pc" "${srcdir}/"
  for pattern in \
      's|^libdir=$|libdir=/usr/lib|' \
      's|^includedir=$|includedir=/usr/include/groove|' \
      "s|^Version:$|Version: $(cd "$_pkgname" && git describe --always --abbrev=0)|"
    do sed -i "${pattern}" "${srcdir}/libgroove.pc"
  done
}

build() {
  cd "${srcdir}/${_pkgname}/build"
  cmake ../ -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  make -C "${srcdir}/${_pkgname}/build" DESTDIR="${pkgdir}/" install
  install -Dm 644 "${srcdir}/${_pkgname}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Created in the `prepare` function.
  install -Dm 644 "${srcdir}/libgroove.pc" \
    "${pkgdir}/usr/lib/pkgconfig/libgroove.pc"
}

# vim:set ts=2 sw=2 et:
