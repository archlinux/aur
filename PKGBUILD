# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-idle-git
pkgver=r38.08c1cf3
pkgrel=1
pkgdesc="Cosmic idle daemon"
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/cosmic-idle"
license=('GPL-3.0-only')
depends=(
  'libxkbcommon'
  'wayland'
)
makedepends=(
  'cargo'
  'git'
  'just'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/pop-os/cosmic-idle.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
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
  nice just build-release --frozen --offline
}

package() {
  cd "${pkgname%-git}"
  just rootdir="$pkgdir" install
}
