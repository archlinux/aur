# Maintainer: uint2048_t

pkgname=wipeout-rewrite-git
pkgver=90702ce
pkgrel=1
pkgdesc="A re-implementation of the 1995 PSX game wipEout"
arch=(x86_64)
url="https://github.com/phoboslab/wipeout-rewrite"
license=(custom)
depends=(sdl2 glew)
makedepends=(git cmake gcc imagemagick)
             
source=("git+https://github.com/phoboslab/wipeout-rewrite.git"
	"https://archive.org/download/wipeout-data.tar/wipeout-data.tar.zst"
	"wipeout.png"
        "wipeout.desktop")

sha256sums=('SKIP'
	    'c15037e260bd186ddda2b4bf26d055f0b1ec7e6d0610f3b75f57d1bf788d92b7'
            '9374b04f78bd925661decd8cc8832598d7c53e6f477f71edd5eee02d6f09a3e5'
	    '2c58bd4621dac435db88e2e54df68a6bf4b4ac686e775e0b08df3f57409d0a5c')

pkgver() {
  cd wipeout-rewrite
  git rev-parse --short HEAD
}

build() {
  cd wipeout-rewrite
  cmake -B build -S . -DPATH_ASSETS="/opt/wipeout-rewrite/" -DPATH_USERDATA="$HOME/"
  cmake --build build
}

package() {
  install -dm755 "${pkgdir}"/opt/wipeout-rewrite
  install -Dm755 "${srcdir}/wipeout-rewrite/build/wipeout" "${pkgdir}/opt/wipeout-rewrite/wipegame"
  cp -rv "wipeout" "${pkgdir}/opt/wipeout-rewrite"
  for _size in "512x512" "256x256" "192x192" "128x128" "96x96" "64x64" "48x48" "32x32" "24x24" "22x22" "20x20" "16x16" "8x8"
  do
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/${_size}/apps"
    convert "${srcdir}/wipeout.png" -resize "${_size}" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/wipeout.png"
  done
  install -Dm644 "${srcdir}/wipeout.desktop" "${pkgdir}/usr/share/applications/wipeout.desktop"
}
