# Maintainer: quietvoid <tcChlisop0@gmail.com>

_pkgname=hdr10plus_tool
pkgname=${_pkgname}-git
pkgver=1.7.2.r2.g2ab405a
pkgrel=1
pkgdesc='CLI utility to work with HDR10+ in HEVC files'
arch=('x86_64')
url='https://github.com/quietvoid/hdr10plus_tool'
license=('MIT')
makedepends=('git' 'cargo')
conflicts=('hdr10plus-tool')
provides=('hdr10plus-tool')
source=(git+https://github.com/quietvoid/hdr10plus_tool.git)
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
  cargo test --frozen --workspace --all-features
}

package() {
  export CARGO_TARGET_DIR=target

  cd "${_pkgname}"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release-deploy/$_pkgname"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
