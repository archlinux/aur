# Maintainer: italoghost <eduprodive at posteo dot me>

pkgname=heroic-games-launcher-electron-git
_pkgname=HeroicGamesLauncher
pkgver=2.15.2.r54.g78151d5c5
pkgrel=1
pkgdesc="Native GOG, Epic Games and Amazon games launcher for Linux, with the system electron (unsupported)."
arch=(x86_64)
url="https://heroicgameslauncher.com/"
license=(GPL-3.0-only)
depends=(electron)
makedepends=(git pnpm npm)
provides=(heroic-games-launcher)
conflicts=(heroic-games-launcher)
source=(git+https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher.git
        heroic.sh)
sha256sums=('SKIP'
            '98fafa65adcc0eb5b03fdab5e12ae19ce545b63b0961d88f8c9bec84a0524c3b')

pkgver() {
  cd HeroicGamesLauncher
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd HeroicGamesLauncher
  sed -i -e "s/Exec=heroic-run --ozone-platform-hint=auto %u/Exec=heroic %U/" "flatpak/com.heroicgameslauncher.hgl.desktop"
}

build() {
  cd HeroicGamesLauncher
  HOME="${srcdir}/.electron-gyp" pnpm install

  pnpm run download-helper-binaries
  ./node_modules/.bin/electron-vite build
  ./node_modules/.bin/electron-builder --linux --x64 --dir -c.electronDist=/usr/lib/electron/ -c.electronVersion=$(cat /usr/lib/electron/version)
}

package() {
  install -d "${pkgdir}/usr/lib/heroic"
  cp -rf ./$_pkgname/dist/linux-unpacked/resources/app.asar{,.unpacked} "${pkgdir}/usr/lib/heroic/"
  
  # executable
  install -Dm755 "./heroic.sh" "${pkgdir}/usr/bin/heroic"

  # icon
  install -Dm644 ./$_pkgname/flatpak/com.heroicgameslauncher.hgl.png -t "${pkgdir}/usr/share/pixmaps"
  
  # metainfo
  install -Dm644 ./$_pkgname/flatpak/templates/com.heroicgameslauncher.hgl.metainfo.xml.template "${pkgdir}"/usr/share/metainfo/com.heroicgameslauncher.hgl.metainfo.xml

  # desktop file
  install -Dm644 ./$_pkgname/flatpak/com.heroicgameslauncher.hgl.desktop -t "${pkgdir}/usr/share/applications"
}
