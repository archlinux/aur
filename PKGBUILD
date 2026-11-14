# Maintainer: ViniciusPHDU20
pkgname=archshield-pro
pkgver=2.1.0
pkgrel=1
pkgdesc="Sovereign Linux Cyber Deception, Ring 0 Kernel Sentry & Intrusion Prevention System"
arch=('x86_64')
url="https://github.com/ViniciusPHDU20/ArchShield"
license=('GPL-3.0-or-later')
depends=('nftables' 'systemd' 'curl' 'python' 'python-pyqt6' 'python-pyqt6-webengine')
makedepends=('cargo' 'git')
source=("git+https://github.com/ViniciusPHDU20/ArchShield.git#branch=main")
sha256sums=('SKIP')

build() {
  cd "ArchShield"
  cargo build --release
}

package() {
  cd "ArchShield"

  # 1. Binarios nativos em Rust
  install -Dm755 "target/release/archshield-daemon" "$pkgdir/usr/bin/archshield-daemon"
  install -Dm755 "target/release/archshield-ctl" "$pkgdir/usr/bin/archshield-ctl"
  install -Dm755 "archshield-panel" "$pkgdir/usr/bin/archshield-panel"

  # 2. Painel Desktop e templates
  install -d "$pkgdir/usr/share/archshield"
  install -Dm644 "panel.py" "$pkgdir/usr/share/archshield/panel.py"
  cp -r "templates" "$pkgdir/usr/share/archshield/"

  # 3. Assets de Sistema (Desktop, Icone, Servico)
  install -Dm644 "assets/archshield.desktop" "$pkgdir/usr/share/applications/archshield.desktop"
  install -Dm644 "assets/archshield.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/archshield.svg"
  install -Dm644 "assets/archshield.service" "$pkgdir/usr/lib/systemd/system/archshield.service"

  # 4. Diretorio de persistencia
  install -dm755 "$pkgdir/var/lib/archshield"
}
