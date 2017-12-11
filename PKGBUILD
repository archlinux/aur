# Maintainer: Jeremy Audet <jerebear@protonmail.com>
# Contributor: Jonjo McKay <jonjo@jonjomckay.com>

pkgname=libgroove
pkgver=4.3.0
pkgrel=3
pkgdesc='Library that provides decoding and encoding of audio on a playlist.'
arch=(i686 x86_64)
url='https://github.com/andrewrk/libgroove'
license=(MIT)
depends=(sdl2 chromaprint libebur128)
makedepends=(cmake yasm)
options=('strip')
source=("https://github.com/andrewrk/libgroove/archive/${pkgver}.tar.gz"
        "0001-update-for-ffmpeg-3.0.patch")
sha256sums=('76f68896f078a9613d420339ef887ca8293884ad2cd0fbc031d89a6af2993636'
            '444daed8d4a1180eb8ce303470c87c15bd6c28ff90cf145c5db815639c47be08')


prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -fNp1 -i ../0001-update-for-ffmpeg-3.0.patch

  sed \
    -e 's|^libdir=$|libdir=/usr/lib|' \
    -e 's|^includedir=$|includedir=/usr/include/groove|' \
    -e "s|^Version:$|Version: ${pkgver}|" \
    example/libgroove.pc \
    > "${srcdir}/libgroove.pc"
}

build() {
  mkdir -p "${srcdir}/${pkgname}-${pkgver}/build"
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  cmake \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX=/usr \
    ..
  make
}

check() {
  cat > libgroove-version.c <<EOF
  #include <stdio.h>
  #include <groove/groove.h>
  int main() {
      printf("%s\n", groove_version());
      return 0;
  }
EOF

  gcc \
    -Wall \
    -I "${srcdir}/${pkgname}-${pkgver}" \
    -L "${srcdir}/${pkgname}-${pkgver}/build" \
    $(pkg-config --libs libgroove.pc) \
    -o libgroove-version \
    libgroove-version.c

  diff -u \
    <(pkg-config --modversion libgroove.pc) \
    <(LD_LIBRARY_PATH="${srcdir}/${pkgname}-${pkgver}/build" \
      ./libgroove-version)
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
