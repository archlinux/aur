# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=heroic-games-launcher
pkgver=2.15.2
pkgrel=3
pkgdesc="Native GOG, Epic Games and Amazon games launcher for Linux"
arch=(x86_64)
url="https://heroicgameslauncher.com/"
license=(GPL-3.0-only)
_electron=electron34
depends=(alsa-lib gtk3 nss which $_electron)
makedepends=(git pnpm npm python)
source=("git+https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher.git#tag=v${pkgver}")
sha256sums=('b752b2c11f7d20f068b40d8122a5d4b2b9dcdf3be134d84c9888fe71559045fe')

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
  rm -rf "${pkgdir}/usr/lib/heroic-games-launcher/app.asar.unpacked/build/bin/x64/win32"
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/heroic" <<EOF
#!/usr/bin/bash
exec $_electron /usr/lib/heroic/app.asar "\$@"
EOF

  install -d "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps"
  ln -s /usr/lib/heroic/app.asar.unpacked/build/icon.png "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/heroic.png"
  install -Dm644 flatpak/com.heroicgameslauncher.hgl.desktop "${pkgdir}/usr/share/applications/heroic.desktop"
  sed -i 's|Exec=.*|Exec=/usr/bin/heroic|' "${pkgdir}/usr/share/applications/heroic.desktop"
  sed -i 's|Icon=.*|Icon=heroic|' "${pkgdir}/usr/share/applications/heroic.desktop"
}
