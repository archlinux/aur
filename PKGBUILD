# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=startup-configuration
pkgver=1.0.0
pkgrel=1
pkgdesc="Configure startup applications for the COSMIC desktop environment"
arch=('x86_64' 'aarch64')
url="https://github.com/ellieplayswow/startup-configuration"
license=('GPL-3.0-or-later')
depends=(
  'hicolor-icon-theme'
  'libxkbcommon'
)
makedepends=(
  'cargo'
  'git'
  'just'
)
source=("git+https://github.com/ellieplayswow/startup-configuration.git#tag=v$pkgver")
sha256sums=('4d08c3dcdcbca6897ff05d279d6df1278439e718bfe69f1567032aa6fbc99d8e')

prepare() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

  # Add missing args variable
  sed -i 's/cargo build/cargo build {{args}}/g' justfile
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  just build-release --frozen
}

package() {
  cd "$pkgname"
  just rootdir="$pkgdir" install
}
