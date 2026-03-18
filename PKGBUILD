# Maintainer: k1f0 <archlinux at k1f0.mozmail.com>

pkgname=rsrpc-git
pkgver=r243.4ff3d5e
pkgrel=1
pkgdesc="Rust implementation of Discord RPC server"
arch=("x86_64" "aarch64")
url="https://github.com/SpikeHD/rsRPC"
license=("MIT")
makedepends=("cargo" "git")
provides=("${pkgname%-git}")
conflics=("${pkgname%-git}")
install="rsrpc.install"
source=("${pkgname%-git}::git+${url}.git"
        "https://discord.com/api/v10/applications/detectable"
        "rsrpc.install"
        "rsrpc.service")
sha256sums=('SKIP'
            'SKIP'
            'c96484996efde8defc8eb35b84766875732d0a105ef3b7c9bbabe9645f594ac3'
            '6e39467d6d5a5fd93e4e8c8607296771958b70f5744aeb5940adf04ecaf58df4')
options=(!debug)

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname%-git}"
  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --package rsrpc-cli
}

package() {
  # install binary
  cd "${srcdir}/${pkgname%-git}"
  install -Dm0755 "target/release/${pkgname%-git}-cli" "${pkgdir}/usr/bin/${pkgname%-git}-cli"
  # license
  install -Dm0644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-git}"
  # install detectable database
  cd "${srcdir}"
  mkdir -p "${pkgdir}/opt/rsrpc"
  install -Dm0644 "detectable" "${pkgdir}/opt/rsrpc/detectable.json"
  # install system service
  install -Dm0644 "rsrpc.service" "${pkgdir}/usr/lib/systemd/user/rsrpc.service"
}
