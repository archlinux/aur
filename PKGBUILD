# Maintainer: WhiredPlanck <whiredplanck at outlook dot com>

pkgname=x-minecraft-launcher
pkgver=0.35.4
pkgrel=1
pkgdesc="A Minecraft launcher dedicated to providing modern UX and efficient Mod management"
arch=("x86_64")
url="https://xmcl.app"
license=("MIT")
depends=("hicolor-icon-theme" "electron")
makedepends=("git" "nodejs" "pnpm" "openssl-static")
provides=("xmcl" "xmcl-launcher" "x-minecraft-launcher")
conflicts=("xmcl-bin" "xmcl-launcher" "xmcl-launcher-bin")
source=("$pkgname::git+https://github.com/Voxelum/x-minecraft-launcher.git#tag=v$pkgver")
sha256sums=("SKIP")

build() {
  cd "$srcdir/$pkgname"
  pnpm install
  pnpm run --prefix xmcl-keystone-ui build
  pnpm run --prefix xmcl-electron-app build:dir
}

package() {
  cd "$srcdir/$pkgname"
  install -Dvm644 "xmcl-electron-app/build/output/linux-unpacked/resources/app.asar" \
      "$pkgdir/usr/lib/$pkgname/app.asar"

  mkdir -pv "$pkgdir/usr/"{bin,share/applications}

  cat << EOF >> "$pkgdir/usr/bin/xmcl"
#!/bin/sh

electron /usr/lib/$pkgname/app.asar "\$@"
EOF

  chmod -v 755 "$pkgdir/usr/bin/xmcl"

  cat << EOF >> "$pkgdir/usr/share/applications/$pkgname.desktop"
[Desktop Entry]
Name=X Minecraft Launcher
Comment=Minecraft Launcher with modern UX
Exec=xmcl %U
Terminal=false
Type=Application
Icon=x-minecraft-launcher
Categories=Game;Utility;
EOF

  chmod -v 644 "$pkgdir/usr/share/applications/$pkgname.desktop"

  install -Dvm644 "xmcl-electron-app/icons/dark@256x256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
  install -Dvm644 -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE" LICENSE
}
