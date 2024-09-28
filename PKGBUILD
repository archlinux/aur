# Maintainer: Sid Pranjale <mail@sidonthe.net>

pkgname=heroic-games-launcher-electron
pkgver=2.15.2
pkgrel=1
pkgdesc="Native GOG, Epic Games and Amazon games launcher for Linux"
arch=(x86_64)
url="https://heroicgameslauncher.com/"
license=(GPL3)
depends=(alsa-lib gtk3 nss which electron)
makedepends=(git pnpm)
options=(!strip)
source=("git+https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher.git#tag=v${pkgver}"
        heroic.sh
        heroic.desktop)
sha256sums=('b752b2c11f7d20f068b40d8122a5d4b2b9dcdf3be134d84c9888fe71559045fe'
            '90cfbac9ec10b7de83a2a83f1e308e2239842fddf056a2031be70bb70fa4ee86'
            '61a10cc9de919e3c29f5832503ab6ea075826905fe432d5bb255c733847241c7')
provides=(heroic-games-launcher)
conflicts=(heroic-games-launcher)

build() {
  cd HeroicGamesLauncher

  # Use system's electron
  sed -i "/linux/s/^/        \"electronDist\": \"\\/usr\\/lib\\/electron\",\n/" package.json

  pnpm install
  pnpm run download-helper-binaries
  pnpm dist:linux
}

package() {
  cd HeroicGamesLauncher
  install -d "${pkgdir}/opt/heroic"
  cp -ar "dist/linux-unpacked/resources/" "${pkgdir}/opt/heroic/"

  install -d "${pkgdir}/usr/bin"
  install -Dm755 ../heroic.sh "$pkgdir/usr/bin/heroic" # Start script

  install -D public/icon.png "${pkgdir}/usr/share/pixmaps/heroic.png"

  install -d "${pkgdir}/usr/share/applications/"
  install -Dm755 ../heroic.desktop "$pkgdir/usr/share/applications/heroic.desktop"

}
