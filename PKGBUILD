# Maintainer: Nico <d3sox at protonmail dot com>
pkgname=soundux-git
pkgver=r424.db04167
pkgrel=2
epoch=1
pkgdesc="A cross-platform soundboard"
arch=('any')
url="https://github.com/Soundux/Soundux"
license=('GPL3')
depends=('pulseaudio' 'webkit2gtk')
makedepends=('git' 'cmake' 'ninja')
conflicts=('soundux')
provides=('soundux')
source=("git+https://github.com/Soundux/Soundux.git" "soundux.desktop")
sha256sums=('SKIP' '9ba572406c69e23c43ae419fde2bcefb4eade15e4e8ed9c082324b11d7e35184')

pkgver() {
  cd "${srcdir}/Soundux"

  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/Soundux"
  git submodule update --init --recursive
  mkdir -p build
  cd build
  cmake -GNinja -DCMAKE_BUILD_TYPE=Release ..
  ninja
}

package() {
  # install binary
  install -Dm 755 "${srcdir}/Soundux/build/soundux" "${pkgdir}/opt/soundux/soundux"
  mkdir -p "${pkgdir}/usr/bin/"
  ln -sf /opt/soundux/soundux "${pkgdir}/usr/bin/soundux"
  # install dist
  mkdir -p "${pkgdir}/opt/soundux/dist"
  cp -r "${srcdir}/Soundux/build/dist"/* "${pkgdir}/opt/soundux/dist"
  # install icon
  install -Dm 664 "${srcdir}/Soundux/assets/icon.png" "${pkgdir}/usr/share/pixmaps/soundux.png"
  # install desktop file
  install -Dm 644 "${srcdir}/soundux.desktop" "${pkgdir}/usr/share/applications/soundux.desktop"
}
