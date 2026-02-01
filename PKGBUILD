# Maintainer: quietvoid <tcChlisop0@gmail.com>

_pkgname=hevc_hdr_editor
pkgname=${_pkgname}-git
pkgver=1.0.1.r0.g6772c91
pkgrel=1
pkgdesc='CLI tool combining multiple utilities for working with Dolby Vision'
arch=('x86_64')
url='https://github.com/quietvoid/hevc_hdr_editor'
license=('MIT')
makedepends=('git' 'cargo')
depends=('fontconfig')
source=(git+https://github.com/quietvoid/hevc_hdr_editor.git)
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"

  git describe --long HEAD --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
  cargo test --frozen --workspace --all-features
}

package() {
  export CARGO_TARGET_DIR=target

  cd "${_pkgname}"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release-deploy/$_pkgname"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
