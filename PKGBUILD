# Maintainer:

pkgname=heroic-games-launcher-git
pkgver=2.3.10.r0.gf8d0bb88
pkgrel=1
pkgdesc="Native GOG and Epic Games launcher for Linux"
arch=(x86_64)
url="https://heroicgameslauncher.com/"
license=(GLP3)
depends=(alsa-lib gtk3 nss)
makedepends=(git yarn node-gyp python)
provides=(heroic-games-launcher)
conflicts=(heroic-games-launcher)
source=("git+https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher.git")
sha256sums=('SKIP')

pkgver() {
  cd HeroicGamesLauncher
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd HeroicGamesLauncher
  yarn
  yarn dist tar.xz
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
