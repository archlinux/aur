# Maintainer: Rodney Osodo <socials@rodneyosodo.com>

# Builds Ladybird from master the way upstream builds its release packages: the Distribution preset, with the
# third-party libraries built by vcpkg and bundled under /opt/ladybird, plus the same system integration files
# (command, desktop entry, icon, metainfo) that upstream's .deb and .rpm packages install.
# https://github.com/LadybirdBrowser/ladybird/blob/master/Documentation/BuildInstructionsLadybird.md

pkgname=ladybird-nightly-git
_pkgname=ladybird
pkgver=r95509.02b3079323
pkgrel=1
pkgdesc='Truly independent web browser, built from the latest master'
arch=(x86_64)
url='https://ladybird.org'
license=(BSD-2-Clause)
depends=(
  gcc-libs
  glibc
  libgl
  libpulse
  qt6-base
  qt6-positioning
  ttf-liberation
  wayland
  xcb-util-wm
)
makedepends=(
  autoconf-archive
  automake
  clang
  cmake
  curl
  git
  lld
  nasm
  ninja
  python
  qt6-tools
  rustup
  tar
  unzip
  zip
)
optdepends=(
  'ffmpeg: audio and video playback'
  'qt6-wayland: native Wayland support'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
# Upstream picks its own compiler flags and LTO settings, and makepkg's would leak into the vcpkg builds.
options=(!buildflags !lto !debug !emptydirs)
source=("$_pkgname::git+https://github.com/LadybirdBrowser/ladybird.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=10 HEAD)"
}

prepare() {
  cd "$_pkgname"
  # Install the Rust toolchain that rust-toolchain.toml pins.
  rustup toolchain install --profile minimal
}

build() {
  cd "$_pkgname"
  # ladybird.py bootstraps vcpkg, builds the dependencies and then Ladybird into Build/distribution.
  # Upstream builds its release packages with Clang.
  ./Meta/ladybird.py build --preset Distribution --cc clang --cxx clang++
}

package() {
  cd "$_pkgname"
  local component
  for component in ladybird_Runtime ladybird_SystemIntegration; do
    DESTDIR="$pkgdir" cmake --install Build/distribution --prefix /opt/ladybird --component "$component"
  done

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
