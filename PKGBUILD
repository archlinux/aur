# Maintainer: invisi101 <https://github.com/invisi101>
pkgname=bigsnatch
pkgver=0.1.3
pkgrel=1
pkgdesc="Real-time eBPF network connection monitor — see what your computer is reaching out to"
arch=('x86_64')
url="https://github.com/invisi101/bigsnatch"
license=('GPL-3.0-only')
depends=('polkit')
makedepends=('rust' 'cargo' 'protobuf' 'base-devel' 'wayland' 'libxcb' 'fontconfig' 'freetype2')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('231510786404a4bdb182d3aca0592f792d592120fdade7792d3eaa579abfdf4d')

build() {
  cd "${pkgname}-${pkgver}"

  # Install nightly + bpf-linker if not present
  rustup toolchain install nightly --component rust-src 2>/dev/null || true
  command -v bpf-linker >/dev/null 2>&1 || cargo install bpf-linker

  make all
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 target/release/snitchster-daemon "$pkgdir/usr/bin/bigsnatch-daemon"
  install -Dm755 target/release/snitchster-gui "$pkgdir/usr/bin/bigsnatch"
  install -Dm644 systemd/snitchster-daemon.service "$pkgdir/usr/lib/systemd/system/bigsnatch-daemon.service"
  install -Dm644 assets/bigsnatch.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/bigsnatch.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE" 2>/dev/null || true

  # Desktop entry with correct installed paths
  install -dm755 "$pkgdir/usr/share/applications"
  cat > "$pkgdir/usr/share/applications/bigsnatch.desktop" <<EOF
[Desktop Entry]
Name=BigSnatch
Comment=Real-time network connection monitor
GenericName=Network Monitor
Exec=/usr/bin/bigsnatch
Terminal=false
Type=Application
Icon=bigsnatch
Categories=Network;Monitor;System;Security;
Keywords=network;firewall;monitor;connections;snitch;ebpf;
StartupWMClass=bigsnatch
EOF
}
