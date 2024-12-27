# Maintainer: Kevin Yue <k3vinyue@gmail.com>

_pkgname_prefix=globalprotect-openconnect
pkgname="${_pkgname_prefix}-git"
pkgver=2.4.0
pkgrel=2
pkgdesc="A GUI for GlobalProtect VPN, based on OpenConnect, supports the SSO authentication method."
arch=(x86_64 aarch64)
url="https://github.com/yuezk/GlobalProtect-openconnect"
license=('GPL3')

makedepends=(git pkg-config 'openconnect>=8.20' webkit2gtk-4.1 curl wget file openssl appmenu-gtk-module libappindicator-gtk3 librsvg libsecret)
depends=('openconnect>=8.20' openssl webkit2gtk-4.1 libappindicator-gtk3 libsecret libxml2)
optdepends=('wmctrl: for window management')

conflicts=('globalprotect-openconnect')
provides=('globalprotect-openconnect' 'gpclient' 'gpservice' 'gpauth' 'gpgui')

install=gp.install

source=("${_pkgname_prefix}::git+https://github.com/yuezk/GlobalProtect-openconnect.git#tag=v${pkgver}")

options=('!strip')

prepare() {
  # Install the rust toolchain
  export RUSTUP_HOME="${srcdir}/.rustup"
  export CARGO_HOME="${srcdir}/.cargo"
  export PATH="${CARGO_HOME}/bin:${PATH}"

  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- \
    -y \
    -q \
    --profile minimal \
    --default-toolchain 1.80 \
    --no-modify-path

  cargo --version

  cd "${_pkgname_prefix}"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  export CARGO_TARGET_DIR=target

  cargo --version

  # Must unset the CFLAGS, otherwise the build fails on linking openssl, don't know why
  unset CFLAGS

  cd "${_pkgname_prefix}"
  cargo build --frozen --release -p gpclient -p gpservice -p gpauth
  cargo build --frozen --release -p gpgui-helper --features "tauri/custom-protocol"
}

package() {
  cd "${_pkgname_prefix}"

  install -Dm755 target/release/gpclient "${pkgdir}/usr/bin/gpclient"
  install -Dm755 target/release/gpservice "${pkgdir}/usr/bin/gpservice"
  install -Dm755 target/release/gpauth "${pkgdir}/usr/bin/gpauth"
  install -Dm755 target/release/gpgui-helper "${pkgdir}/usr/bin/gpgui-helper"

  install -Dm644 packaging/files/usr/share/applications/gpgui.desktop "${pkgdir}/usr/share/applications/gpgui.desktop"
  install -Dm644 packaging/files/usr/share/icons/hicolor/scalable/apps/gpgui.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/gpgui.svg"
  install -Dm644 packaging/files/usr/share/icons/hicolor/32x32/apps/gpgui.png "${pkgdir}/usr/share/icons/hicolor/32x32/apps/gpgui.png"
  install -Dm644 packaging/files/usr/share/icons/hicolor/128x128/apps/gpgui.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/gpgui.png"
  install -Dm644 packaging/files/usr/share/icons/hicolor/256x256@2/apps/gpgui.png "${pkgdir}/usr/share/icons/hicolor/256x256@2/apps/gpgui.png"
  install -Dm644 packaging/files/usr/share/polkit-1/actions/com.yuezk.gpgui.policy "${pkgdir}/usr/share/polkit-1/actions/com.yuezk.gpgui.policy"
}
sha256sums=('854da3f5f9f5d294439065fb6410da7088dc47e750005d53450995fcc372ba72')
