# Maintainer: Jeremy Audet <jerebear@protonmail.com>
# Contributor: epitron <chris@ill-logic.com>
# Contributor: Jonjo McKay <jonjo@jonjomckay.com>

pkgname=libgroove-git
_pkgname=libgroove
pkgver=4.3.0.81.gaf456a0
pkgrel=1
pkgdesc='Library that provides decoding and encoding of audio on a playlist.'
arch=(i686 x86_64)
url='https://github.com/andrewrk/libgroove'
license=(MIT)
# chromaprint provides ffmpeg, but we want to pin a minimum version
depends=(chromaprint 'ffmpeg>=3.0' libebur128 libsoundio)
makedepends=(cmake yasm)
provides=(libgroove)
conflicts=(libgroove)
options=('strip')
source=('git+https://github.com/andrewrk/libgroove.git' libgroove-const.patch )
sha256sums=('SKIP'
            'c4deaff272fb3a4991e7fdeb4cae4cc7c62da9a8b394cca5a076ecefff00c348')

pkgver() {
  cd "${_pkgname}"
  git describe --always | sed 's/-/./g'
}

prepare() {
  cd "${_pkgname}"

  # The version inserted in to libgroove.pc includes no hash. It is something
  # like "4.2.1". This matches what libgroove itself reports.
  version=$(git describe --always --abbrev=0)
  sed \
    -e 's|^libdir=$|libdir=/usr/lib|' \
    -e 's|^includedir=$|includedir=/usr/include/groove|' \
    -e "s|^Version:$|Version: ${version}|" \
    "${srcdir}/${_pkgname}/doc/libgroove.pc" \
    > "${srcdir}/libgroove.pc"

  patch -Np1 -i $srcdir/libgroove-const.patch
}

build() {
  mkdir -p "${srcdir}/${_pkgname}/build"
  cd "${srcdir}/${_pkgname}/build"
  cmake \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D BUILD_EXAMPLE_PROGRAMS=OFF \
    -D BUILD_STATIC_LIBS=OFF \
    ..
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
