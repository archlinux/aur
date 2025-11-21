# Maintainer: Daan Hessen <daanh2002@gmail.com>
pkgname=earctl
pkgver=0.1.0
pkgrel=2
pkgdesc="A Rust API/CLI that allows every device on your network to control your Nothing earbuds"
arch=('x86_64')
url="https://github.com/DaanHessen/earctl"
license=('AGPL-3.0-or-later')
depends=('dbus')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('386997aeca25911cd1252472bdf5898ec4a2c05977495665ed7fd92bf0050416')

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
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
  
  # Install systemd user service
  install -Dm644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"
  
  # Create post-install message
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
