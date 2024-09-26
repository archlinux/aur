# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-launcher-git
pkgver=1.0.0.alpha.2.r0.g5c9757b
pkgrel=1
pkgdesc="Layer Shell frontend for Pop Launcher."
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/cosmic-launcher"
license=('GPL-3.0-or-later')
depends=(
  'hicolor-icon-theme'
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
            '49d87bb5f95b5f3e830022f6d237277a51f182dc7eabb5e941b497b1885a1c08')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/^epoch-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"

  # Use thin LTO
  patch -Np1 -i ../lto.patch

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
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
