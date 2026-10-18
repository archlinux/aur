# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=heroic-games-launcher
pkgver=2.22.4
pkgrel=1
pkgdesc="Native GOG, Epic Games and Amazon games launcher for Linux"
arch=(x86_64)
url="https://heroicgameslauncher.com/"
license=(GPL-3.0-only)
_electron=electron43
depends=(
    $_electron
    glibc
    hicolor-icon-theme
    libgcc
    python
    sh
    which
    zlib
    )
makedepends=(
    desktop-file-utils
    git
    nodejs
    pnpm
    )
optdepends=(
    gamemode
    gamescope
    mangohud
    "rsync: Move games using rsync instead of mv"
    )
source=(
    "git+https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher.git#tag=v${pkgver}"
    heroic.sh
    )
sha256sums=('a628cc8fb1bf533c7a437f32c7d21bf55dc990ac247c304a33e259870fa12a49'
            '6103e2429c60868452ad45e3537631a26812eeb3e3f57b5ba59c2f6f2b7398d9')

prepare() {
  sed -i "s|@ELECTRON@|${_electron}|" heroic.sh
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
