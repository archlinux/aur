# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

_pkgname=linear-cli
pkgname=linear-cli-finesssee
pkgver=0.3.27
pkgrel=3
pkgdesc="A powerful CLI for Linear.app built with Rust (by Finesssee)"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/Finesssee/linear-cli"
license=('MIT')
depends=('gcc-libs' 'glibc')
conflicts=('linear-cli-finesssee-bin')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Finesssee/linear-cli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a2714aaf85c18460ca006985984af77d7474dcfd9591569a9d8751a2e34e8f64')
options=('!lto')

prepare() {
  cd "${_pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${_pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "${_pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "${_pkgname}-${pkgver}"
  
  # Install binary
  install -Dm755 "target/release/${_pkgname}" -t "${pkgdir}/usr/bin/"

  # Generate and install shell completions
  "target/release/${_pkgname}" completions static bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  "target/release/${_pkgname}" completions static zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
  "target/release/${_pkgname}" completions static fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
  
  # Install documentation and license
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
