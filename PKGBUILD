# Maintainer: Ameyama Izumi <souiken@oneamongus.ca>
# Co-Maintainer: Misaka13514 <Misaka13514 at gmail dot com>

pkgname=speedynote-git
pkgver=0.7.1.r0.g99dcf07
pkgrel=1
pkgdesc="A simple note app with good performance and PDF import support"
arch=('x86_64')
url="https://github.com/alpha-liu-01/SpeedyNote"
license=('MIT')
depends=('qt6-base' 'qt6-multimedia' 'poppler-qt6' 'sdl2-compat' 'hicolor-icon-theme' 'glibc' 'gcc-libs')
makedepends=('git' 'cmake' 'qt5-tools')
provides=('speedynote')
conflicts=('speedynote' 'speedynote-bin')
source=(
  "git+$url.git"
  "speedynote.desktop"
  "speedynote.png"
)
sha256sums=('SKIP'
            '6f07fa15736a865e1b7877e364a4da83af82cb16b5d0875eba59f1f5a6af089c'
            '1d20a105d72a502609b8c61bd2388dba8792182057cbf47e148ef72fd2becd71')

pkgver() {
  cd "$srcdir/SpeedyNote"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/SpeedyNote"
  lrelease resources/translations/*.ts

  cd "$srcdir"
  local cmake_options=(
    -B build
    -S SpeedyNote
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  # DESTDIR="$pkgdir" cmake --install build

  # install main application
  install -Dm755 build/NoteApp "$pkgdir/usr/bin/speedynote"

  # install translations
  # install -Dm644 build/app_*.qm -t "$pkgdir/usr/share/speedynote/translations/"

  # install license
  install -Dm644 "SpeedyNote/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # install .desktop
  install -Dm644 "speedynote.desktop" "$pkgdir/usr/share/applications/speedynote.desktop"

  # install icon
  install -Dm644 "speedynote.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/speedynote.png"
}
