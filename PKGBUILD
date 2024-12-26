# Maintainer: Kevin Yue <k3vinyue@gmail.com>

_pkgname_prefix=globalprotect-openconnect
pkgname="${_pkgname_prefix}-git"
pkgver=2.3.9.r4.g0f67be4
pkgrel=1
pkgdesc="A GUI for GlobalProtect VPN, based on OpenConnect, supports the SSO authentication method."
arch=(x86_64 aarch64)
url="https://github.com/yuezk/GlobalProtect-openconnect"
license=('GPL3')

makedepends=(git rustup 'openconnect>=8.20' webkit2gtk base-devel curl wget file appmenu-gtk-module gtk3 libappindicator-gtk3 librsvg libvips)
depends=('openconnect>=8.20' openssl webkit2gtk libappindicator-gtk3 libayatana-appindicator libsecret libxml2)
optdepends=('wmctrl: for window management')

conflicts=('globalprotect-openconnect')
provides=('globalprotect-openconnect' 'gpclient' 'gpservice' 'gpauth' 'gpgui')

install=gp.install

source=("${_pkgname_prefix}::git+https://github.com/yuezk/GlobalProtect-openconnect.git#tag=v${pkgver}")

options=('!strip')

prepare() {
  export RUSTUP_TOOLCHAIN=stable

  cd "${_pkgname_prefix}"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

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
sha256sums=('16bac6be2e2d073f385a009ce6c8091b653b7e4a6f738b82a4095bf06054982a')
