# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=heroic-games-launcher
pkgver=2.5.2
pkgrel=1
pkgdesc="Native GOG and Epic Games launcher for Linux"
arch=(x86_64)
url="https://heroicgameslauncher.com/"
license=(GPL3)
depends=(alsa-lib gtk3 nss python)
makedepends=(git yarn node-gyp)
source=("git+https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd HeroicGamesLauncher
  yarn
  yarn dist:linux tar.xz
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
