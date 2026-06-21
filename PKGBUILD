# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-launcher-git
pkgver=1.0.16.r0.ga64ed9a
pkgrel=1
pkgdesc="Layer Shell frontend for Pop Launcher."
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/cosmic-launcher"
license=('GPL-3.0-only')
depends=(
  'cosmic-icons-git'
  'libxkbcommon'
  'pop-launcher-git'
  'wayland'
)
makedepends=(
  'cargo'
  'clang'
  'git'
  'intltool'
  'just'
  'mold'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/pop-os/cosmic-launcher.git'
        'lto.patch')
sha256sums=('SKIP'
            '852bbae9d79b0ababff4e0cc9e79ff3511622f1511cd854c5b176cba6928cde6')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/^epoch-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  # Use thin LTO
  patch -Np1 -i ../lto.patch

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable

  # use nice to build with lower priority
  nice just build-release --frozen
}

package() {
  cd "${pkgname%-git}"
  just rootdir="$pkgdir" install
}
