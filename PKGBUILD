# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: soloturn <soloturn@gmail.com>
pkgname=cosmic-notifications-git
pkgver=1.0.0.alpha.7.r0.g8eae7e0
pkgrel=1
pkgdesc="Layer Shell notifications daemon which integrates with COSMIC."
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/cosmic-notifications"
license=('GPL-3.0-only')
depends=(
  'hicolor-icon-theme'
  'libxkbcommon'
  'wayland'
)
makedepends=(
  'cargo'
  'git'
  'intltool'
  'just'
  'mold'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/pop-os/cosmic-notifications.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/^epoch-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

  # Use mold linker instead of lld
  sed -i 's/lld/mold/g' justfile
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
