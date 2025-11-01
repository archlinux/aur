# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=heroic-games-launcher-git
pkgver=2.18.1.r18.gd827d7053
pkgrel=2
pkgdesc="Native GOG, Epic Games and Amazon games launcher for Linux"
arch=(x86_64)
url="https://heroicgameslauncher.com/"
license=(GPL-3.0-only)
_electron=electron36
depends=(which $_electron zlib gcc-libs glibc)
makedepends=(git pnpm npm python desktop-file-utils
			 nodejs-lts-jod
			 )
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
  HOME="${srcdir}/.electron-gyp" pnpm install

  pnpm run download-helper-binaries
  ./node_modules/.bin/electron-vite build
  ./node_modules/.bin/electron-builder --linux --x64 --dir -c.electronDist=/usr/lib/$_electron/ -c.electronVersion=$(cat /usr/lib/$_electron/version)
}

package() {
  cd "HeroicGamesLauncher"
  install -d "${pkgdir}/usr/lib/heroic"
  cp -rf dist/linux-unpacked/resources/app.asar{,.unpacked} "${pkgdir}/usr/lib/heroic/"
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/heroic" <<EOF
#!/usr/bin/bash
exec $_electron /usr/lib/heroic/app.asar "\$@"
EOF

  install -Dm644 flatpak/com.heroicgameslauncher.hgl.png -t "${pkgdir}/usr/share/pixmaps"
  install -Dm644 flatpak/templates/com.heroicgameslauncher.hgl.metainfo.xml.template "${pkgdir}"/usr/share/metainfo/com.heroicgameslauncher.hgl.metainfo.xml

  # fix icon on Gnome dock
  desktop-file-edit --set-key=Exec --set-value="heroic %U" --set-key=StartupWMClass --set-value=heroic flatpak/com.heroicgameslauncher.hgl.desktop
  install -Dm644 flatpak/com.heroicgameslauncher.hgl.desktop -t "${pkgdir}/usr/share/applications"
}
