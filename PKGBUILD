# Maintainer: quietvoid <tcChlisop0@gmail.com>

_pkgname=dovi_tool
pkgname=${_pkgname}-git
pkgver=2.3.1.r8.g25c397e
pkgrel=1
pkgdesc='CLI tool combining multiple utilities for working with Dolby Vision'
arch=('x86_64')
url='https://github.com/quietvoid/dovi_tool'
license=('MIT')
makedepends=('git' 'cargo')
depends=('fontconfig')
conflicts=('dovi-tool')
provides=('dovi-tool')
source=(git+https://github.com/quietvoid/dovi_tool.git)
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"

  git describe --match "[0-9]*" --long HEAD --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  export RUSTUP_TOOLCHAIN=stable

  cd "${_pkgname}"
  cargo fetch --locked --target host-tuple
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cd "${_pkgname}"
  cargo build --frozen --profile release-deploy
}

check() {
  export RUSTUP_TOOLCHAIN=stable

  cd "${_pkgname}"
  cargo test --frozen --all-features
  cargo test --frozen --all-features --bins
}

package() {
  export CARGO_TARGET_DIR=target

  cd "${_pkgname}"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release-deploy/$_pkgname"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/dovi_tool/LICENSE"
}
