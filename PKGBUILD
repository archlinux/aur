# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: uint2048_t

pkgname=wipeout-rewrite-git
pkgver=r150.e510130
pkgrel=1
epoch=1
pkgdesc="A re-implementation of the 1995 PSX game wipEout"
arch=(x86_64)
url="https://github.com/phoboslab/wipeout-rewrite"
license=(unknown)
depends=(sdl2 glew)
makedepends=(git cmake imagemagick)
source=("git+https://github.com/phoboslab/wipeout-rewrite.git"
		"https://phoboslab.org/files/wipeout-data-v01.zip"
		"wipeout.png"
        "wipeout.desktop")
sha256sums=('SKIP'
            '5bc02de7118a62a5cb8b4d0ec79062cddbe20ced86dda594df8a10c455f90ad1'
            '9374b04f78bd925661decd8cc8832598d7c53e6f477f71edd5eee02d6f09a3e5'
            '2c58bd4621dac435db88e2e54df68a6bf4b4ac686e775e0b08df3f57409d0a5c')

pkgver() {
  cd wipeout-rewrite
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd wipeout-rewrite
  cmake -B build -S . -DPATH_ASSETS="/opt/wipeout-rewrite/" -DPATH_USERDATA="$HOME/" -Wno-dev
  cmake --build build
}

package() {
  install -dm755 "${pkgdir}"/opt/wipeout-rewrite
  install -Dm755 "${srcdir}/wipeout-rewrite/build/wipeout" "${pkgdir}/opt/wipeout-rewrite/wipegame"
  cp -rv "wipeout" "${pkgdir}/opt/wipeout-rewrite"
  for _size in "512x512" "256x256" "192x192" "128x128" "96x96" "64x64" "48x48" "32x32" "24x24" "22x22" "20x20" "16x16" "8x8"
  do
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/${_size}/apps"
    magick "${srcdir}/wipeout.png" -resize "${_size}" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/wipeout.png"
  done
  install -Dm644 "${srcdir}/wipeout.desktop" "${pkgdir}/usr/share/applications/wipeout.desktop"
}
