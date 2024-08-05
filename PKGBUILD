# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-store-git
pkgver=1.0.0.alpha.1.r0.g639a17c
pkgrel=1
pkgdesc="Cosmic App Store"
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/cosmic-store"
license=('GPL-3.0-or-later')
groups=('cosmic')
depends=(
  'archlinux-appstream-data'
  'cosmic-icons-git'
  'glib2'
  'libxkbcommon'
)
makedepends=(
  'cargo'
  'flatpak'
  'git'
  'just'
  'mold'
)
optdepends=(
  'flatpak: Flatpak packages support'
  'packagekit: package manager integration module'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/pop-os/cosmic-store.git')
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

  # use mold instead of lld to speed up build
  RUSTFLAGS="-C link-arg=-fuse-ld=mold"

  # use nice to build with lower priority
  nice just build-release --frozen
}

package() {
  cd "${pkgname%-git}"
  just rootdir="$pkgdir" install
}
