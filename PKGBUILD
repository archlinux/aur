# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

_pkgname=linear-cli
pkgname=linear-cli-finesssee
pkgver=0.3.28
pkgrel=1
pkgdesc="A powerful CLI for Linear.app built with Rust (by nesszer)"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/nesszer/linear-cli"
license=('MIT')
depends=('dbus' 'gcc-libs' 'glibc')
conflicts=('linear-cli-finesssee-bin')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nesszer/linear-cli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ef3795901da1583456a7361d65cd9b0cecaca62ad4da57c026d370388f68a460')
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
