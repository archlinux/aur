# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=d2vwitch-git
pkgver=5.5.gf002376
pkgrel=1
pkgdesc="Cross-platform D2V creator. (GIT version)"
arch=('x86_64')
url='http://forum.doom9.org/showthread.php?t=173090'
license=('LGPL2.1' 'ISC')
depends=(
  'gcc-libs'
  'glibc'
  'bzip2'
  'zlib'
  'xz'
  'qt6-base'
  'xdg-utils'
  'vapoursynth-plugin-d2vsource-git'
)
makedepends=(
  'git'
  'meson'
)
provides=('d2vwitch')
conflicts=('d2vwitch')
source=(
  'd2vwitch::git+https://github.com/dubhater/D2VWitch.git'
  'd2vwitch.desktop'
  'd2vwitch.png'
  'git+https://git.ffmpeg.org/ffmpeg.git#branch=release/6.0'
  'https://github.com/dubhater/D2VWitch/pull/18.diff'
)
sha256sums=(
  'SKIP'
  'ae75722403c34d53ea2e55b1b53abdfb02cdb4eaaf4e642e84bee0d26e2ab5d1'
  'c63a756f6e375ef4a6f220fcdde3f4a05f7a101c0c0dc3743ce9207730719bd5'
  'SKIP'
  'SKIP'
)
options=('debug')

pkgver() {
  cd d2vwitch
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

prepare() {
  mkdir -p build{,-ffmpeg}

  patch -d d2vwitch -p1 -i "${srcdir}/18.diff"
}

build() {
  (
  cd ffmpeg
  msg2 "Build FFmpeg"
  cd "${srcdir}/build-ffmpeg"
  ../ffmpeg/configure \
    --prefix="${srcdir}/fakeroot" \
    --disable-{network,{encod,mux}ers,hwaccels,{in,out}devs,debug,programs,doc,vdpau,vaapi,cuda,cuvid,nvenc} \
    --enable-pic \
    --enable-gpl

  make install
  )

  cd build
  msg2 "Build d2vwitch"
  PKG_CONFIG_PATH="${srcdir}/fakeroot/lib/pkgconfig" \
  arch-meson ../d2vwitch \
    --libdir /usr/lib/vapoursynth

  LC_ALL=C ninja
}

package(){
  depends+=(
#   'libc.so'
#   'libgcc_s.so' 'libstdc++.so'
    'libbz2.so'
    'liblzma.so'
    'libz.so'
#   'libQt6Widgets.so' 'libQt6Gui.so' 'libQt6Core.so'
  )

  DESTDIR="${pkgdir}" ninja -C build install

  install -Dm644 "${srcdir}/d2vwitch.desktop" "${pkgdir}/usr/share/applications/d2vwitch.desktop"
  install -Dm644 "${srcdir}/d2vwitch.png" "${pkgdir}/usr/share/pixmaps/d2vwitch.png"

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  head -n+16 d2vwitch/src/Audio.cpp | tail -n 15 > "${pkgdir}/usr/share/licenses/${pkgname}/ISC"
}
