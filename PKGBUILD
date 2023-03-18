# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=d2vwitch-git
pkgver=v5.3.g4085afa
pkgrel=1
pkgdesc="Cross-platform D2V creator. (GIT version)"
arch=('x86_64')
url='http://forum.doom9.org/showthread.php?t=173090'
license=('LGPL2.1' 'ISC')
depends=('vapoursynth-plugin-d2vsource-git'
         'libavcodec.so=58-64'
         'libavformat.so=58-64'
         'libavutil.so=56-64'
         'gcc-libs'
         'qt5-base'
         'xdg-utils'
         )
makedepends=('git'
             'meson'
             'ffmpeg4.4'
             )
provides=('d2vwitch')
conflicts=('d2vwitch')
source=('d2vwitch::git+https://github.com/dubhater/D2VWitch.git'
        'd2vwitch.desktop'
        'd2vwitch.png'
        )
sha256sums=('SKIP'
            'ae75722403c34d53ea2e55b1b53abdfb02cdb4eaaf4e642e84bee0d26e2ab5d1'
            'c63a756f6e375ef4a6f220fcdde3f4a05f7a101c0c0dc3743ce9207730719bd5'
            )
options=('debug')

pkgver() {
  cd d2vwitch
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build

  sed "s|'GUI'|'Gui'|g" -i d2vwitch/meson.build
}

build() {
  cd build
  export PKG_CONFIG_PATH='/usr/lib/ffmpeg4.4/pkgconfig'

  arch-meson ../d2vwitch \
    --libdir /usr/lib/vapoursynth

  LC_ALL=C ninja
}

package(){
  DESTDIR="${pkgdir}" ninja -C build install

  install -Dm644 "${srcdir}/d2vwitch.desktop" "${pkgdir}/usr/share/applications/d2vwitch.desktop"
  install -Dm644 "${srcdir}/d2vwitch.png" "${pkgdir}/usr/share/pixmaps/d2vwitch.png"

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  head -n+16 d2vwitch/src/Audio.cpp | tail -n 15 > "${pkgdir}/usr/share/licenses/${pkgname}/ISC"
}
