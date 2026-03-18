# Maintainer: Winícius Cota <winicius.cota@gmail.com>
#
# ╔══════════════════════════════════════════════════════════════════╗
# ║  EXPERIMENTAL — NOT FOR GENERAL USE                             ║
# ║  This is a personal fork of KDE Spectacle that adds desktop     ║
# ║  audio capture to screen recordings via PulseAudio + ffmpeg.    ║
# ║                                                                  ║
# ║  • It tracks a feature branch that may rebase at any time.      ║
# ║  • It is unlikely to be merged upstream as-is.                  ║
# ║  • It will NOT be maintained once KDE ships native audio in     ║
# ║    Spectacle (or the branch is abandoned).                       ║
# ║  • Use the official `spectacle` package unless you specifically  ║
# ║    need this feature.                                            ║
# ╚══════════════════════════════════════════════════════════════════╝

pkgname=spectacle-audio-git
pkgver=6.6.80.r1.fd46c0e
pkgrel=1
pkgdesc='KDE Spectacle with desktop-audio capture (experimental fork — not maintained long-term)'
arch=('x86_64')
url='https://invent.kde.org/winicius/spectacle'
license=('LGPL-2.0-or-later')
depends=(
  ffmpeg
  kglobalacceld
  kio
  kirigami
  kpipewire
  kquickimageeditor
  kstatusnotifieritem
  layer-shell-qt
  libpulse
  opencv
  pipewire
  qt6-base
  qt6-declarative
  qt6-multimedia
)
makedepends=(
  cmake
  extra-cmake-modules
  git
  ninja
  plasma-wayland-protocols
  wayland-protocols
)
provides=('spectacle')
conflicts=('spectacle' 'spectacle-audio')

source=("spectacle::git+https://invent.kde.org/winicius/spectacle.git#branch=feature/audio")
sha256sums=('SKIP')

pkgver() {
  cd spectacle
  local _base
  _base=$(grep -m1 'set(PROJECT_VERSION' CMakeLists.txt | sed 's/[^0-9.]//g')
  printf '%s.r%s.%s' "$_base" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=7 HEAD)"
}

build() {
  cmake -B build -S spectacle \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
