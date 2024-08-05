# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-workspaces-git
pkgver=1.0.0.alpha.1.r0.gc1acf0c
pkgrel=1
pkgdesc="Cosmic workspaces"
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/cosmic-workspaces-epoch"
license=('GPL-3.0-or-later')
groups=('cosmic')
depends=(
  'libinput'
  'libxkbcommon'
  'mesa'
  'wayland'
)
makedepends=(
  'cargo'
  'git'
  'mold'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/pop-os/cosmic-workspaces-epoch.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}-epoch"
  git describe --long --tags --abbrev=7 | sed 's/^epoch-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}-epoch"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname%-git}-epoch"
  export RUSTUP_TOOLCHAIN=stable

  # use mold instead of lld to speed up build
  RUSTFLAGS="-C link-arg=-fuse-ld=mold"

  # use nice to build with lower priority
  ARGS+=" --frozen" nice make
}

package() {
  cd "${pkgname%-git}-epoch"
  make prefix='/usr' DESTDIR="$pkgdir" install
}
