# Maintainer: Andy Alt <arch_stanton5995 at proton.me>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=mars-shooter-git
pkgver=0.7.4.r259.84664cd
pkgrel=1
pkgdesc="A ridiculous space shooter with nice graphics (development version)"
arch=('x86_64')
url="https://marsshooter.org/"
license=('GPL-3.0-or-later')
depends=(
  'fribidi'
  'hicolor-icon-theme'
  'sfml2'
  'taglib'
)
makedepends=('cmake' 'git')
provides=('mars-shooter')
conflicts=('mars-shooter')
source=(mars-shooter::"git+https://github.com/thelaui/M.A.R.S..git#commit=84664cd")
sha256sums=('SKIP')

pkgver() {
  cd mars-shooter
  # todo: remove hardcoded version number (when proper tags are in repo)
  printf "0.7.4.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd mars-shooter

  # fix executable name in and remove mimetype from launcher
  sed 's/Exec=mars$/&-shooter/;/MimeType=.*/d' -i resources/marsshooter.desktop
}

build() {
  local cmake_options=(
    -B build
    -S "${srcdir}/mars-shooter"
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_CXX_STANDARD=14
    -DCMAKE_CXX_FLAGS="-std=c++14"
    -DSFML_DIR=/opt/sfml2/lib/cmake/SFML
    -DSFML_INCLUDE_DIR=/opt/sfml2/include
    -DSFML_SYSTEM_LIBRARY=/opt/sfml2/lib/libsfml-system.so
    -DSFML_WINDOW_LIBRARY=/opt/sfml2/lib/libsfml-window.so
    -DSFML_GRAPHICS_LIBRARY=/opt/sfml2/lib/libsfml-graphics.so
    -DSFML_AUDIO_LIBRARY=/opt/sfml2/lib/libsfml-audio.so
    -DCMAKE_INSTALL_RPATH=/opt/sfml2/lib
    -DCMAKE_BUILD_WITH_INSTALL_RPATH=TRUE
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm755 "${pkgdir}/usr/games/marsshooter" \
    "${pkgdir}/usr/bin/mars-shooter"
  # Remove the original /usr/games install
  rm -rf "${pkgdir}/usr/games"

  mv "${pkgdir}/usr/share/man/man6/marsshooter.6" \
    "${pkgdir}/usr/share/man/man6/mars-shooter.6"

  sed -i 's|^Exec=.*|Exec=mars-shooter|' \
    "${pkgdir}/usr/share/applications/marsshooter.desktop"
  mv "${pkgdir}/usr/share/applications/marsshooter.desktop" \
    "${pkgdir}/usr/share/applications/mars-shooter.desktop"
}
