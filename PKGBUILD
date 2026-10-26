# Maintainer: Sierra S. <sscoolqaz@protonmail.com>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org>

pkgname=heroic-games-launcher-bun
pkgver=2.22.4
pkgrel=1
pkgdesc="Native GOG, Epic Games and Amazon games launcher for Linux (built with Bun)"
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
    bun
    )
provides=("heroic-games-launcher=$pkgver")
conflicts=(heroic-games-launcher heroic-games-launcher-bin heroic-games-launcher-git)
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

  cd HeroicGamesLauncher
  bun -e '
    const fs = require("node:fs");
    const p = JSON.parse(fs.readFileSync("package.json", "utf8"));
    p.packageManager = `bun@${Bun.version}`;
    for (const key of Object.keys(p.scripts)) {
      p.scripts[key] = p.scripts[key].replaceAll("pnpm run ", "bun run ").replaceAll("pnpm ", "bun run ");
    }
    p.overrides = { ...p.overrides, "ts-morph": "17.0.1" };
    p.patchedDependencies = { "@types/node@22.19.3": "patches/@types__node@22.19.3.patch" };
    fs.writeFileSync("package.json", JSON.stringify(p, null, 2) + "\n");
    // pnpm 12 prefixes the application lock with a package-manager document.
    const lock = fs.readFileSync("pnpm-lock.yaml", "utf8").split(/^---\s*$/m).filter(s => s.trim());
    fs.writeFileSync("pnpm-lock.yaml", lock.at(-1).trimStart());
  '
  bun pm migrate
}

build() {
  cd HeroicGamesLauncher
  bun install --frozen-lockfile --ignore-scripts --linker hoisted
  bun run download-helper-binaries
  bun run dist:linux --dir --x64 -c.electronDist=/usr/lib/$_electron/ -c.electronVersion=$(cat /usr/lib/$_electron/version)
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
