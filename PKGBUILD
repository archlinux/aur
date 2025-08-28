# Maintainer: 1994 <1994intime@protonmail.com>

pkgname='eigenwallet-developertools-git'
pkgver=3.0.0.beta.11.r1.b5574de
pkgrel=1
pkgdesc="λ eigenwallet developer tools are command-line tools for debugging purposes or to run a a maker (to provide liquidity) for eigenwallet's XMR<>BTC atomic swaps"
license=('GPL-3.0')
arch=('x86_64' 'aarch64')
url="https://eigenwallet.org"
conflicts=('eigenwallet-developertools-bin')
depends=('glib2')
makedepends=('git' 'base-devel' 'rustup' 'cargo' 'cmake' 'boost' 'libsodium' 'openssl')
options=('!lto') # https://github.com/launchbadge/sqlx/issues/3149
source=("${pkgname}"::"git+https://github.com/eigenwallet/core"
	"use_dynamic_libs.patch")
sha256sums=('SKIP' '9daa328e5dcd5c0e3fa7396f295d2879b216c63888f121ca420b83995f61e2e5')

pkgver() {
	cd "${srcdir}/${pkgname}"
	git describe --tags --match '[0-9]*' --abbrev=7 --always | sed -E 's/-([0-9]+)-g([0-9a-fA-F]+)/.r\1.\2/; s/-/./g'
}

export_rust_env() {
  export RUSTUP_HOME="${srcdir}/rustup"
  export CARGO_HOME="${srcdir}/cargo"
  export PATH="$PATH:$CARGO_HOME/bin"
}

prepare() {
  cd "${srcdir}/${pkgname}"

  git submodule update --init --recursive
  git apply "${srcdir}/use_dynamic_libs.patch"

  export_rust_env

  rustup install --profile minimal stable
}

build() {
  export_rust_env

  cd "${srcdir}/${pkgname}"
  
  RUSTFLAGS="-L/usr/lib" cargo build --locked --release -p swap-asb --bin=asb
  RUSTFLAGS="-L/usr/lib" cargo build --locked --release -p swap-controller --bin=asb-controller
  RUSTFLAGS="-L/usr/lib" cargo build --locked --release -p swap --bin=swap
  RUSTFLAGS="-L/usr/lib" cargo build --locked --release -p swap-orchestrator --bin=orchestrator
}

package() {
  install -Dm755 "${srcdir}/${pkgname}/target/release/asb" "${pkgdir}/usr/bin/asb"
  install -Dm755 "${srcdir}/${pkgname}/target/release/asb-controller" "${pkgdir}/usr/bin/asb-controller"
  install -Dm755 "${srcdir}/${pkgname}/target/release/swap" "${pkgdir}/usr/bin/swap"
  install -Dm755 "${srcdir}/${pkgname}/target/release/orchestrator" "${pkgdir}/usr/bin/orchestrator"
}

