# Maintainer: IRedDragonICY <your-email@example.com>
pkgname=controlhub-vortexseries-git
pkgver=r1.f10fa90
pkgrel=1
pkgdesc="An ultra-lightweight, fully offline desktop client for Vortex Series mice"
arch=('x86_64')
url="https://github.com/IRedDragonICY/controlhub-vortexseries"
license=('0BSD')
depends=('electron')
makedepends=('cargo' 'git')
provides=('controlhub-vortexseries')
conflicts=('controlhub-vortexseries')
source=("git+https://github.com/IRedDragonICY/controlhub-vortexseries.git"
        "LICENSE")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "$srcdir/controlhub-vortexseries"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/controlhub-vortexseries"
  cargo build --release --locked --all-features --target-dir=target
}

package() {
  cd "$srcdir/controlhub-vortexseries"
  install -Dm 755 target/release/controlhub-vortexseries -t "${pkgdir}/usr/bin"
  
  cat << 'DESKTOPEOF' > controlhub-vortexseries.desktop
[Desktop Entry]
Name=Vortex Control Hub
Comment=Offline Desktop Client for Vortex Series Devices
Exec=/usr/bin/controlhub-vortexseries
Icon=controlhub-vortexseries
Terminal=false
Type=Application
Categories=Utility;HardwareSettings;
Keywords=mouse;vortex;controlhub;
StartupNotify=true
DESKTOPEOF

  install -Dm 644 controlhub-vortexseries.desktop -t "${pkgdir}/usr/share/applications"
  install -Dm 644 assets/img/light/global/logo.png "${pkgdir}/usr/share/pixmaps/controlhub-vortexseries.png"
  install -Dm 644 "$srcdir/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
