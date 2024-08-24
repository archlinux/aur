# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-randr-git
pkgver=1.0.0.alpha.1.r0.g71fabbb
pkgrel=3
pkgdesc="Library and utility for displaying and configuring Wayland outputs"
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/cosmic-randr"
license=('MPL-2.0')
depends=('wayland')
makedepends=(
  'cargo'
  'clang'
  'git'
  'just'
  'mold'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/pop-os/cosmic-randr.git')
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
