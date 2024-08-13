# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=heroic-games-launcher
pkgver=2.15.1
pkgrel=3
pkgdesc="Native GOG, Epic Games and Amazon games launcher for Linux"
arch=(x86_64)
url="https://heroicgameslauncher.com/"
license=(GPL3)
depends=(alsa-lib gtk3 nss )
makedepends=(git pnpm)
options=(!strip)
source=("git+https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher.git#tag=v${pkgver}")
sha256sums=('51c2d2e40ce034f6029f3979d7dbab101411396341b2e5f2d889a6a52ba35079')

build() {
  cd HeroicGamesLauncher
  pnpm install
  pnpm run download-helper-binaries
  pnpm dist:linux tar.xz
}

package() {
  cd HeroicGamesLauncher
  install -d "${pkgdir}/opt/heroic"
  cp -r dist/linux-unpacked/* "${pkgdir}/opt/heroic"

  install -d "${pkgdir}/usr/bin"
  ln -s /opt/heroic/heroic "${pkgdir}/usr/bin/heroic"

  install -D public/icon.png "${pkgdir}/usr/share/pixmaps/heroic.png"

  install -d "${pkgdir}/usr/share/applications/"
  cat > ${pkgdir}/usr/share/applications/heroic.desktop << _EOD
[Desktop Entry]
Name=Heroic Games Launcher
Exec=/opt/heroic/heroic %U
Terminal=false
Type=Application
Icon=heroic
StartupWMClass=Heroic
Comment=Open Source GOG and Epic Games launcher
MimeType=x-scheme-handler/heroic;
Categories=Game;
_EOD
}
