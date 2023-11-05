# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
_plug=lsmashsource
pkgname="avisynth-plugin-${_plug}-git"
pkgver=1144.0.0.0.1.g2d1fa1f
pkgrel=1
pkgdesc="Plugin for Avisynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://forum.doom9.org/showthread.php?t=167435'
license=('custom:l-smash')
depends=(
  'avisynthplus'
  'l-smash' 'liblsmash.so'
)
makedepends=(
  'git'
  'meson'
  'avisynthplus'
 )
provides=("avisynth-plugin-${_plug}")
conflicts=("avisynth-plugin-${_plug}")
source=(
  "${_plug}::git+https://github.com/HomeOfAviSynthPlusEvolution/L-SMASH-Works.git"
  'ffmpeg::git+https://github.com/HomeOfAviSynthPlusEvolution/FFmpeg.git#branch=custom-patches-for-lsmashsource'
)
sha256sums=(
  'SKIP'
  'SKIP'
)
options=('debug')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

prepare() {
  rm -fr "${_plug}/include"
}

build() {
  (
  cd ffmpeg
  ./configure \
    --prefix="${srcdir}/fakeroot" \
    --enable-gpl \
    --enable-version3 \
    --disable-all \
    --disable-autodetect \
    --enable-avcodec \
    --enable-avformat \
    --enable-swresample \
    --enable-swscale \
    --disable-asm

  make
  make install
  )

  cat > native_config <<EOF
[properties]
pkg_config_path = '${srcdir}/fakeroot/lib/pkgconfig:/usr/lib/pkgconfig'
pkg_config_libdir = '${srcdir}/fakeroot/lib/pkgconfig:/usr/lib/pkgconfig'
EOF

  arch-meson "${_plug}/AviSynth" build \
    --buildtype=release \
    --native-file="${srcdir}/native_config" \

  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
  install -Dm644 "${_plug}/AviSynth/README" "${pkgdir}/usr/share/doc/avisynth/plugins/${_plug}/README"
  install -Dm644 "${_plug}/AviSynth/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
