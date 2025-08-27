# Maintainer: 1994 <1994intime@protonmail.com>

pkgname='eigenwallet-git'
pkgver=3.0.0.beta.11.r1.b5574de
pkgrel=1
pkgdesc='λ eigenwallet (previously UnstoppableSwap) is a GUI for trustless cross-chain XMR<>BTC Atomic Swaps.'
license=('GPL-3.0')
arch=('x86_64')
url="https://eigenwallet.org"
conflicts=('eigenwallet-bin' 'unstoppableswap-gui')
depends=('glib2' 'hicolor-icon-theme' 'gtk3' 'webkit2gtk' 'webkit2gtk-4.1' 'unbound')
makedepends=('git' 'base-devel' 'rustup' 'cargo' 'cmake' 'boost' 'libsodium' 'openssl' 'yarn')
options=('!lto') # https://github.com/launchbadge/sqlx/issues/3149
source=("${pkgname}"::"git+https://github.com/eigenwallet/core"
	"use_dynamic_libs.patch" "eigenwallet.desktop")
sha256sums=('SKIP'
	'9daa328e5dcd5c0e3fa7396f295d2879b216c63888f121ca420b83995f61e2e5'
	'b029a65d9d6383843a5db3d985c886cea037ef0b6236ae2bae9df1b90e235125')

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

  # Dependencies from .github/workflows/build-gui-release-binaries.yml
  cargo install tauri-cli
  cargo install typeshare-cli
  cargo install dprint 
}

build() {
  export_rust_env

  cd "${srcdir}/${pkgname}"
  cd src-gui
  yarn install
  cd ..

  RUSTFLAGS="-L/usr/lib" cargo tauri build --no-bundle
}

package() {
  install -Dm755 "${srcdir}/${pkgname}/target/release/unstoppableswap-gui-rs" "${pkgdir}/usr/bin/unstoppableswap-gui-rs"
  install -Dm644 "${srcdir}/${pkgname}/src-tauri/icons/128x128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/unstoppableswap-gui-rs.png"
  install -Dm644 "${srcdir}/${pkgname}/src-tauri/icons/32x32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/unstoppableswap-gui-rs.png"
  install -Dm644 "${srcdir}/${pkgname}/src-tauri/icons/128x128@2x.png" "${pkgdir}/usr/share/icons/hicolor/256x256@2/apps/unstoppableswap-gui-rs.png"
  install -Dm644 "${srcdir}/eigenwallet.desktop" "${pkgdir}/usr/share/applications/eigenwallet.desktop"
}

