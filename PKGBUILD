# Maintainer: robertfoster
pkgname=aulos-git
pkgver=0.1.1.r0.ge8cec09
pkgrel=1
pkgdesc='A modern music player for the COSMIC desktop'
arch=(aarch64 x86_64)
url=https://github.com/M0Rf30/aulos
license=(GPL-3.0-only)
provides=("${pkgname%%-git}")
conflicts=("${pkgname%%-git}" lyra-git)
replaces=(lyra-git)
depends=(
  alsa-lib
  cosmic-icon-theme
  glibc
  libgcc
  libgl
  libpipewire
  libstdc++
  libxkbcommon
  wayland
)
makedepends=(
  cargo
  clang
  cmake
  git
  just
  mesa
  nasm
)
optdepends=(
  'projectm: visualizer presets'
  'ffmpeg: lossy audio conversion'
)
source=("${pkgname%%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%%-git}"
  local _tag
  if _tag=$(git describe --long --tags 2>/dev/null); then
    printf '%s' "$_tag" | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf '0.1.0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

prepare() {
  cd "${pkgname%%-git}"
  cargo fetch --locked
}

build() {
  cd "${pkgname%%-git}"
  # Strip GCC LTO flags — C static libraries (aws-lc-sys, projectm-sys,
  # libsqlite3-sys) compiled with -flto produce GCC LTO bitcode that
  # rust-lld (LLVM) cannot link.
  CFLAGS="${CFLAGS//-flto=auto/}"
  CXXFLAGS="${CXXFLAGS//-flto=auto/}"
  just build-release --frozen --features visualizer
}

package() {
  cd "${pkgname%%-git}"
  just rootdir="${pkgdir}" install
}
