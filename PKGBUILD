# Maintainer: Emilwojcik93 <emilwojcik93@gmail.com>

_pkgname=artemis
pkgname=artemis-qt-git
pkgver=0.6.7.dev.20250831.0017.afe2de7.0.gafe2de7f
pkgrel=1
pkgdesc="Enhanced GameStream client for PCs (Artemis Qt, Moonlight fork w/ Apollo/Sunshine extras) - git build"
arch=('x86_64')
url="https://github.com/wjbeckett/artemis"
license=('GPL-3.0-or-later')
depends=(
  'qt6-base'
  'qt6-declarative'
  'qt6-svg'
  'qt6-multimedia'
  'ffmpeg'
  'sdl2'
  'sdl2_ttf'
  'opus'
  'openssl'
  'libva'
  'libvdpau'
  'libplacebo'
  'libxkbcommon'
  'hicolor-icon-theme'
)
makedepends=(
  'git'
  'vulkan-headers'
  'wayland-protocols'
  'qt6-tools'
)
optdepends=(
  'libva-intel-driver: hardware acceleration for older Intel GPUs (pre-Broadwell)'
  'intel-media-driver: hardware acceleration for Broadwell+ Intel GPUs / Arc'
  'libva-mesa-driver: hardware acceleration for AMD GPUs'
  'libva-nvidia-driver: NVDEC hardware acceleration via VA-API for NVIDIA'
)
provides=('artemis-qt')
conflicts=('artemis-qt')
source=("$_pkgname::git+https://github.com/wjbeckett/artemis.git#branch=develop")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  # upstream tags look like: 0.6.7-dev.20250831.0017+afe2de7
  # sanitize to a monotonically increasing, AUR-legal pkgver (no '-' or '+')
  git describe --long --tags 2>/dev/null | sed -E 's/^[^0-9]*//; s/[-+]/./g' \
    || printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$_pkgname"
  git submodule update --init --recursive --depth=1
}

build() {
  cd "$_pkgname"
  qmake6 artemis.pro PREFIX=/usr CONFIG+=release "QMAKE_CXXFLAGS+=-fPIC"
  make -j$(nproc)
}

package() {
  cd "$_pkgname"
  make INSTALL_ROOT="$pkgdir" install
}
