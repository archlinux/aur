# Maintainer: Irshad Ali <irshadali5@proton.me>
pkgname=siar-git
pkgver=0.1.0.alpha.2.r0.gc936778
pkgrel=1
pkgdesc="Survivable Identity & Autonomous Routing: decentralized, offline-first messaging (built from git master)"
arch=('x86_64')
url="https://github.com/irshadlab/siar"
license=('AGPL-3.0-or-later' 'Apache-2.0' 'MIT')
depends=('gtk3' 'alsa-lib' 'openssl')
makedepends=('git' 'cargo' 'rust' 'pkg-config' 'cmake' 'libopus' 'dav1d')
provides=('siar' 'siar-daemon' 'siar-desktop')
conflicts=('siar' 'siar-bin')
source=('git+https://github.com/irshadlab/siar.git')
sha256sums=('SKIP')

pkgver() {
  cd siar
  git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
  printf "0.1.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd siar
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd siar
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen -p siar-cli -p siar-daemon -p siar-desktop
}

package() {
  cd siar

  # Install binaries
  install -Dm755 target/release/siar "${pkgdir}/usr/bin/siar"
  install -Dm755 target/release/siar-daemon "${pkgdir}/usr/bin/siar-daemon"
  install -Dm755 target/release/siar-desktop "${pkgdir}/usr/bin/siar-desktop"

  # Install icons
  install -Dm644 assets/branding/icon.png "${pkgdir}/usr/share/pixmaps/siar.png"
  for sz in 16 32 64 128 256 512; do
    if [ -f "assets/branding/icon-${sz}.png" ]; then
      install -Dm644 "assets/branding/icon-${sz}.png" "${pkgdir}/usr/share/icons/hicolor/${sz}x${sz}/apps/siar.png"
    fi
  done

  # Install desktop entry
  install -d "${pkgdir}/usr/share/applications"
  cat << 'EOF' > "${pkgdir}/usr/share/applications/siar.desktop"
[Desktop Entry]
Name=SIAR
GenericName=Decentralized Secure Messenger
Comment=Sovereign Infrastructure for Autonomous Resilience (P2P / Mesh / E2EE Messenger)
Exec=siar-desktop
Icon=siar
Terminal=false
Type=Application
Categories=Network;InstantMessaging;Chat;P2P;
StartupWMClass=siar-desktop
EOF

  # Install Licenses
  install -Dm644 LICENSE-AGPLv3 "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-AGPLv3"
  install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
  install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
