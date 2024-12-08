# Maintainer: Kevin Yue <k3vinyue@gmail.com>

_pkgname_prefix=globalprotect-openconnect
pkgname="${_pkgname_prefix}-git"
pkgver="2.3.9"
pkgrel=2
pkgdesc="A GUI for GlobalProtect VPN, based on OpenConnect, supports the SSO authentication method."
arch=(x86_64 aarch64)
url="https://github.com/yuezk/GlobalProtect-openconnect"
license=('GPL3')

makedepends=(rustup 'openconnect>=8.20' webkit2gtk base-devel curl wget file appmenu-gtk-module gtk3 libappindicator-gtk3 librsvg libvips)
depends=('openconnect>=8.20' openssl webkit2gtk libappindicator-gtk3 libayatana-appindicator libsecret libxml2)
optdepends=('wmctrl: for window management')

conflicts=('globalprotect-openconnect')
provides=('globalprotect-openconnect' 'gpclient' 'gpservice' 'gpauth' 'gpgui')

install=gp.install

source=("${_pkgname_prefix}-$pkgver.tar.gz::https://github.com/yuezk/GlobalProtect-openconnect/releases/download/v$pkgver/globalprotect-openconnect-$pkgver.tar.gz")

options=('!strip')

prepare() {
  export RUSTUP_TOOLCHAIN=stable

  cd "${srcdir}/${_pkgname_prefix}-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  # Must unset the CFLAGS, otherwise the build fails on linking openssl, don't know why
  unset CFLAGS

  cd "${srcdir}/${_pkgname_prefix}-$pkgver"
  cargo build --frozen --release -p gpclient -p gpservice -p gpauth
  cargo build --frozen --release -p gpgui-helper --features "tauri/custom-protocol"
}

package() {
  cd "${srcdir}/${_pkgname_prefix}-$pkgver"

  install -Dm755 target/release/gpclient "${pkgdir}/usr/bin/gpclient"
  install -Dm755 target/release/gpservice "${pkgdir}/usr/bin/gpservice"
  install -Dm755 target/release/gpauth "${pkgdir}/usr/bin/gpauth"
  install -Dm755 target/release/gpgui-helper "${pkgdir}/usr/bin/gpgui-helper"
}

sha256sums=('74a44378d60f0d5300e211f10aea1cfbcee7b378894969ba9de05f767e7cff3c')
