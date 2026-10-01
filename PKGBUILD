# Maintainer: AkusenArcade <akudesyn@gmail.com>

pkgname=business-network-wizard
pkgver=0.8.0
pkgrel=1
pkgdesc="Configura e mantiene l'accesso alla rete aziendale: proxy NTLM, VPN, WiFi 802.1X, dischi di rete, stampanti"
arch=('x86_64')
url="https://github.com/AkusenArcade/business-network-wizard"
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita' 'networkmanager' 'networkmanager-openvpn' 'openvpn' 'polkit'
         'tinyproxy' 'cntlm' 'cifs-utils' 'cups' 'curl' 'pacman-contrib' 'expac')
makedepends=('cargo' 'git')
options=('!lto')
install=business-network-wizard.install
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --bin bnw --bin bnw-helper
}

check() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release
}

package() {
  cd "$pkgname"
  local t=target/release
  install -Dm755 "$t/bnw"                         "$pkgdir/usr/bin/bnw"
  install -Dm755 "$t/bnw-helper"                  "$pkgdir/usr/lib/bnw/bnw-helper"
  install -Dm755 data/proxy-detect                "$pkgdir/usr/lib/bnw/proxy-detect"
  install -Dm755 data/proxy-mode                  "$pkgdir/usr/bin/proxy-mode"
  install -Dm755 data/90-bnw-proxy                "$pkgdir/usr/lib/NetworkManager/dispatcher.d/90-bnw-proxy"
  install -Dm644 data/bnw-proxy-detect.service    "$pkgdir/usr/lib/systemd/system/bnw-proxy-detect.service"
  install -Dm644 data/tinyproxy-bnw.conf          "$pkgdir/usr/lib/systemd/system/tinyproxy.service.d/bnw.conf"
  install -Dm644 data/cntlm-bnw.conf              "$pkgdir/usr/lib/systemd/system/cntlm.service.d/bnw.conf"
  install -Dm644 data/it.akusen.bnw.policy        "$pkgdir/usr/share/polkit-1/actions/it.akusen.bnw.policy"
  install -Dm644 data/it.akusen.BusinessNetworkWizard.desktop \
                 "$pkgdir/usr/share/applications/it.akusen.BusinessNetworkWizard.desktop"
  install -Dm644 LICENSE                          "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md                        "$pkgdir/usr/share/doc/$pkgname/README.md"
}
