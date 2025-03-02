# Maintainer: italoghost <eduprodive at posteo dot me>

pkgname=heroic-games-launcher-electron-git
_pkgname=HeroicGamesLauncher
pkgver=2.16.0.r0.g733b3f60b
pkgrel=1
pkgdesc="Native GOG, Epic Games and Amazon games launcher for Linux, with the system electron (unsupported)."
arch=(x86_64)
url="https://heroicgameslauncher.com/"
license=(GPL-3.0-only)
depends=(electron)
makedepends=(git pnpm)
provides=(heroic-games-launcher)
conflicts=(heroic-games-launcher)
source=(git+https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher.git
        heroic.sh)
sha256sums=('SKIP'
            'b4b0c3709a8b1f2d8224d6c77d11f27a0f49f5ae8d1e11b74f90a2aaad99c089')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $_pkgname
  sed -i -e "s/Exec=heroic-run /Exec=heroic /" "flatpak/com.heroicgameslauncher.hgl.desktop"
}

build() {
  cd $_pkgname
  pnpm install
  pnpm run download-helper-binaries
  pnpm dist:linux tar.xz --x64 --dir -c.electronDist=/usr/lib/electron/ -c.electronVersion=$(cat /usr/lib/electron/version)
}

package() {
  install -d "${pkgdir}/usr/lib/heroic"

  # removing arm64 binaries
  rm -rf ./$_pkgname/dist/linux-unpacked/resources/app.asar.unpacked/build/bin/arm64/
  
  # copying libs
  cp -R ./$_pkgname/dist/linux-unpacked/. "${pkgdir}/usr/lib/heroic/"

  # executable
  # by linking the executable that we built and copied to "/usr/lib/heroic"
  # we avoid the problem when creating a shortcut to steam, where it would
  # link to the electron binary, instead of heroic
  install -Dm755 "./heroic.sh" "${pkgdir}/usr/bin/heroic"

  # icon
  install -Dm644 ./$_pkgname/flatpak/com.heroicgameslauncher.hgl.png -t "${pkgdir}/usr/share/pixmaps"
  
  # metainfo
  install -Dm644 ./$_pkgname/flatpak/templates/com.heroicgameslauncher.hgl.metainfo.xml.template "${pkgdir}"/usr/share/metainfo/com.heroicgameslauncher.hgl.metainfo.xml

  # desktop file
  install -Dm644 ./$_pkgname/flatpak/com.heroicgameslauncher.hgl.desktop -t "${pkgdir}/usr/share/applications"
}