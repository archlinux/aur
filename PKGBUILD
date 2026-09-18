# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=heroic-games-launcher-git
pkgver=2.22.3.r1.g6469b18
pkgrel=2
pkgdesc="Native GOG, Epic Games and Amazon games launcher for Linux"
arch=(x86_64)
url="https://heroicgameslauncher.com/"
license=(GPL-3.0-only)
_electron=electron43
depends=(
    $_electron
    glibc
    libgcc
    python
    sh
    which
    zlib
    )
makedepends=(
    desktop-file-utils
    git
    nodejs-lts
    pnpm
    )
optdepends=(
    gamemode
    gamescope
    mangohud
    "rsync: Move games using rsync instead of mv"
    )
provides=(heroic-games-launcher)
conflicts=(heroic-games-launcher)
source=("git+https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher.git"
    heroic.sh
    )
sha256sums=('SKIP'
            '6103e2429c60868452ad45e3537631a26812eeb3e3f57b5ba59c2f6f2b7398d9')

prepare() {
  sed -i "s|@ELECTRON@|${_electron}|" heroic.sh
}

pkgver() {
  cd HeroicGamesLauncher
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd HeroicGamesLauncher
  pnpm install --ignore-scripts
  pnpm run download-helper-binaries
  pnpm run dist:linux --dir --x64 -c.electronDist=/usr/lib/$_electron/ -c.electronVersion=$(cat /usr/lib/$_electron/version)
}

package() {
  install -Dm755 heroic.sh "${pkgdir}/usr/bin/heroic"

  cd "HeroicGamesLauncher"
  install -d "${pkgdir}/usr/lib/heroic"
  cp -r dist/linux-unpacked/resources/app.asar{,.unpacked} "${pkgdir}/usr/lib/heroic/"

  install -Dm644 flatpak/com.heroicgameslauncher.hgl.png -t "${pkgdir}/usr/share/icons/hicolor/128x128/apps"
  install -Dm644 src/frontend/assets/heroic-icon.svg "${pkgdir}/usr/share/icons/hicolor/scalable/com.heroicgameslauncher.hgl.svg"

  # template and outdated
  #install -Dm644 flatpak/templates/com.heroicgameslauncher.hgl.metainfo.xml.template "${pkgdir}"/usr/share/metainfo/com.heroicgameslauncher.hgl.metainfo.xml

  # fix icon on Gnome dock
  desktop-file-edit --set-key=Exec --set-value="heroic %U" flatpak/com.heroicgameslauncher.hgl.desktop
  install -Dm644 flatpak/com.heroicgameslauncher.hgl.desktop -t "${pkgdir}/usr/share/applications"
}
