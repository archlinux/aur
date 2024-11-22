# Maintainer: k1f0 <archlinux at k1f0.mozmail.com>

pkgname=rsrpc-git
_pkgname=rsrpc
pkgver=r177.0b3b2a3
pkgrel=1
pkgdesc="Rust implementation of Discord RPC server"
arch=("x86_64")
url="https://github.com/SpikeHD/rsRPC"
license=("MIT")
makedepends=("cargo" "git")
provides=("${_pkgname}")
conflics=("${_pkgname}")
install="rsrpc.install"
source=("${_pkgname}::git+${url}.git"
        "https://discord.com/api/v9/applications/detectable"
        "rsrpc.install"
        "rsrpc.service")
b2sums=("SKIP"
        "SKIP"
        "7c2793e9c0588b5770dd9398a0403578856bf5195571878e13293bb296e9daa869fc3b45edc332d788520f94556f9f5235359031e7b6c666bc0a455e7b9340b8"
        "d910987b4dfc04421e35648aa1da13a4ea34a5f4928356f92ed6f4324b69d7a4cc0fd543d23167c602f8654b760cd37327cc2b2ef7f89f738f582095c21e8969")

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
  cd "${srcdir}/${_pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --features binary
}

package() {
  # install binary
  cd "${srcdir}/${_pkgname}"
  install -Dm0755 -t "${pkgdir}/usr/bin" "target/release/${_pkgname}"
  # install detectable database
  cd "${srcdir}"
  mkdir -p "${pkgdir}/opt/rsrpc"
  install -D -m644 "detectable" "${pkgdir}/opt/rsrpc/detectable.json"
  # install system service
  install -D -m644 "rsrpc.service" "${pkgdir}/usr/lib/systemd/user/rsrpc.service"
}

post_install() {
  echo "The systemd user service for rsRPC can be enabled with:"
  echo "systemctl enable --user --now rsrpc.service"
}
