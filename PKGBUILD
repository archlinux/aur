# Maintainer : silverhikari <kerrickethan@gmail.com>
# Contributer: Wouter Wijsman <wwijsman@live.nl>

pkgname=dosbox-staging
pkgver=0.83.1
pkgrel=1
epoch=1
pkgdesc="DOS/x86 emulator focusing on ease of use. Based on DOSBox"
arch=('x86_64')
url="https://github.com/dosbox-staging/dosbox-staging"
license=('GPL-2.0-or-later')
depends=('sdl2-compat' 'sdl2_net' 'sdl2_image' 'opusfile'  'alsa-lib' 'libpng' 'iir1' 'hicolor-icon-theme' 'speexdsp' 'libslirp' 'fluidsynth' 'munt' 'zlib-ng' 'libglvnd' 'asio')
optdepends=('ncurses')
makedepends=('ninja' 'cmake')
provides=("dosbox")
conflicts=("dosbox")
source=("https://github.com/dosbox-staging/dosbox-staging/archive/refs/tags/v${pkgver//_/-}.tar.gz")
sha256sums=('14c3703369e56125a425aea8ebb1a425823df58f9769f3e48b1b8ebbf2c6cf09')

build() {
  local cmake_options=(
    -B build
    -S $pkgname-${pkgver//_/-}
    -W no-dev
    -D CMAKE_INSTALL_PREFIX=/usr
    -D OPT_TESTS=OFF
  )
  cmake --preset "release-linux" "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm 644 "${pkgname}-${pkgver//_/-}/docs/README.video" "$pkgdir/usr/share/doc/${pkgname}/video.txt"
  install -Dm 644 "${pkgname}-${pkgver//_/-}/README.md" "$pkgdir/usr/share/doc/${pkgname}/manual.txt"
  mv "$pkgdir/usr/share/dosbox-staging/resources"/* "$pkgdir/usr/share/dosbox-staging/"
}
