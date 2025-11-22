# Maintainer: Daan Hessen <daanh2002@gmail.com>
pkgname=earctl
pkgver=0.1.2
pkgrel=1
pkgdesc="A Rust API/CLI that allows every device on your network to control your Nothing earbuds"
arch=('x86_64')
url="https://github.com/DaanHessen/earctl"
license=('AGPL-3.0-or-later')
depends=('dbus')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('cec6834f6694fb4412eba1ea788f708778ce4dff14358ce45c924653d55c043f')

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # Explicitly disable LTO in RUSTFLAGS to ensure ring links correctly
  export RUSTFLAGS="-C lto=off"
  cargo build --release --locked --all-features
}

check() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --release --locked
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  
  install -Dm644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"
  
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  cat > "${pkgdir}/usr/share/${pkgname}/post-install.txt" << 'EOF'
To start using earctl:

1. Enable and start the service:
   systemctl --user enable --now earctl.service

2. Use earctl commands immediately:
   earctl auto-connect
   earctl battery
   earctl anc set off

To check service status: systemctl --user status earctl
To view logs: journalctl --user -u earctl -f
EOF
}
