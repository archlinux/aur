# Maintainer: k1f0 <archlinux at k1f0.mozmail.com>

pkgname=rsrpc-git
_pkgname=rsrpc
pkgver=r116.bc7481b
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
        "https://raw.githubusercontent.com/OpenAsar/arrpc/main/src/process/detectable.json"
        "rsrpc.install"
        "rsrpc.service")
b2sums=("SKIP"
        "19cd505425fe48bfd3e1de134be3f58130c842de262d2d57c9f79ff04a5622bf892eb5b52b33fc57a4faf25b444b53779790e3378dbf58d260ec8228c7d3e530"
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
  cargo build --frozen --release --features binary
}

package() {
  # install binary
  cd "${srcdir}/${_pkgname}"
  install -Dm0755 -t "${pkgdir}/usr/bin" "target/release/${_pkgname}"
  # install detectable database
  cd "${srcdir}"
  mkdir -p "${pkgdir}/opt/rsrpc"
  install -D -m644 "detectable.json" "${pkgdir}/opt/rsrpc/detectable.json"
  # install system service
  install -D -m644 "rsrpc.service" "${pkgdir}/usr/lib/systemd/user/rsrpc.service"
}

post_install() {
  echo "The systemd user service for rsRPC can be enabled with:"
  echo "systemctl enable --user --now rsrpc.service"
}
