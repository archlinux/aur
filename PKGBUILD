# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-launcher-git
pkgver=1.0.0.alpha.1.r0.gd84fda0
pkgrel=1
pkgdesc="WIP Layer Shell frontend for Pop Launcher."
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/cosmic-launcher"
license=('GPL-3.0-or-later')
groups=('cosmic')
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
source=('git+https://github.com/pop-os/cosmic-launcher.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/^epoch-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
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
