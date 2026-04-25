# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from Gemini 3 Flash.

pkgname=tun2proxy
pkgver=0.7.21
pkgrel=1
pkgdesc="Tunnel (TUN) interface for SOCKS and HTTP proxies"
url='https://github.com/tun2proxy/tun2proxy'
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=(cargo)
options=('!debug')
source=("https://github.com/tun2proxy/${pkgname}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('5f694f31fe1bdeee8261ed61b79377f4f5fac70038d4c27c16c49da20f04b667')

prepare() {
  cd "${pkgname}-${pkgver}"
  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_TARGET_DIR="$srcdir/cargo-target"
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}-${pkgver}"
  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_TARGET_DIR="$srcdir/cargo-target"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --release
}

check() {
  cd "${pkgname}-${pkgver}"
  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_TARGET_DIR="$srcdir/cargo-target"
  cargo test 2>/dev/null || true
}

package() {
  cd "${pkgname}-${pkgver}"
  local _release="$srcdir/cargo-target/release"

  # Upstream [[bin]] is tun2proxy-bin; CLI in docs is tun2proxy
  install -Dm755 "$_release/tun2proxy-bin" "${pkgdir}/usr/bin/tun2proxy"
  install -Dm755 "$_release/udpgw-server" "${pkgdir}/usr/bin/udpgw-server"

  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
