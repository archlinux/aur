# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=d2vwitch-git
pkgver=v3.3.gbd0b13b
pkgrel=1
pkgdesc="Cross-platform D2V creator. (GIT version)"
arch=('x86_64')
url='http://forum.doom9.org/showthread.php?t=173090'
license=('LGPL2.1' 'ISC')
depends=('vapoursynth'
         'libavutil.so'
         'libavformat.so'
         'libavcodec.so'
         'gcc-libs'
         'qt5-base'
         'xdg-utils'
         )
makedepends=('git'
             'meson'
             )
provides=('d2vwitch')
conflicts=('d2vwitch')
source=('d2vwitch::git+https://github.com/dubhater/D2VWitch.git'
        'd2vwitch.desktop'
        )
sha256sums=('SKIP'
            '6d9204fc7dab73b19976241ce5a4e74fed5c3d264796b782c02d783dd8f1bbb0'
            )

pkgver() {
  cd d2vwitch
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  arch-meson ../d2vwitch \
    --libdir /usr/lib/vapoursynth

  LC_ALL=C ninja
}

package(){
  DESTDIR="${pkgdir}" ninja -C build install

  install -Dm644 "${srcdir}/d2vwitch.desktop" "${pkgdir}/usr/share/applications/d2vwitch.desktop"

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  head -n+16 d2vwitch/src/Audio.cpp | tail -n 15 > "${pkgdir}/usr/share/licenses/${pkgname}/ISC"
}
