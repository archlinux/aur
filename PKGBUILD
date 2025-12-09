# Maintainer: italoghost <eduprodive at posteo dot me>

pkgname=heroic-games-launcher-electron-git
_pkgname=HeroicGamesLauncher
pkgver=2.18.1.r36.gf825234a1
pkgrel=1
_electron=electron
pkgdesc="Native GOG, Epic Games and Amazon games launcher for Linux, with the system electron (unsupported)."
arch=(x86_64)
url="https://heroicgameslauncher.com/"
license=(GPL-3.0-only)
depends=($_electron)
makedepends=(git pnpm npm yq)
provides=(heroic-games-launcher)
conflicts=(heroic-games-launcher)
source=(git+https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher.git)
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $_pkgname

  # updating the desktop file
  sed -i -e "s/Exec=heroic-run /Exec=heroic /" "flatpak/com.heroicgameslauncher.hgl.desktop"
  
  # overriding node-abi
  jq '.pnpm.overrides = {"node-abi": "latest"} + (.pnpm.overrides // {})' package.json > package.json.tmp && mv package.json.tmp package.json
}

build() {
  cd $_pkgname
  pnpm install
  pnpm run download-helper-binaries
  pnpm dist:linux --x64 --dir -c.electronDist=/usr/lib/$_electron/ -c.electronVersion=$(cat /usr/lib/$_electron/version)
}

package() {
  install -d "${pkgdir}/usr/lib/heroic"
  install -d "${pkgdir}/usr/bin"

  # removing arm64 binaries
  rm -rf ./$_pkgname/dist/linux-unpacked/resources/app.asar.unpacked/build/bin/arm64/
  
  # copying libs
  cp -R ./$_pkgname/dist/linux-unpacked/. "${pkgdir}/usr/lib/heroic/"

  # executable
  ln -sf "/usr/lib/heroic/heroic" "${pkgdir}/usr/bin/heroic"

  # icon
  install -Dm644 ./$_pkgname/flatpak/com.heroicgameslauncher.hgl.png -t "${pkgdir}/usr/share/pixmaps"
  
  # metainfo
  install -Dm644 ./$_pkgname/flatpak/templates/com.heroicgameslauncher.hgl.metainfo.xml.template "${pkgdir}"/usr/share/metainfo/com.heroicgameslauncher.hgl.metainfo.xml

  # desktop file
  install -Dm644 ./$_pkgname/flatpak/com.heroicgameslauncher.hgl.desktop -t "${pkgdir}/usr/share/applications"
}
