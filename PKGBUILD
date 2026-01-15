# Maintainer: italoghost <eduprodive at posteo dot me>
# Reference: https://gitlab.manjaro.org/packages/extra/heroic-games-launcher

pkgname=heroic-games-launcher-electron-git
_pkgname=HeroicGamesLauncher
pkgver=2.18.1.r57.g645fae05a
pkgrel=1
_electron=electron
pkgdesc="Native GOG, Epic Games and Amazon games launcher. Development version (Git) using system Electron."
arch=('x86_64')
url="https://heroicgameslauncher.com/"
license=('GPL-3.0-only')
depends=("$_electron" 'rsync' 'which' 'glibc' 'gcc-libs' 'zlib')
makedepends=('git' 'pnpm' 'npm')
provides=('heroic-games-launcher')
conflicts=('heroic-games-launcher')
source=("git+https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher.git"
        "fix-exec-heroic.patch")
sha256sums=('SKIP'
            '9d5363c79dea4e3dd341e182497fb673ca23475dd8e0799f16c5d6136051c5a0')

optdepends=(
  'gamemode: Optimise Linux system performance on demand'
  'lib32-gamemode: Optimise Linux system performance on demand (32-bit)'
  'mangohud: A Vulkan and OpenGL overlay for monitoring FPS, temperatures, CPU/GPU load and more'
  'lib32-mangohud: A Vulkan and OpenGL overlay for monitoring FPS, temperatures, CPU/GPU load and more (32-bit)'
  'gamescope:  SteamOS session compositing window manager '
  'umu-launcher:  Unified launcher for Windows games on Linux'
)
options=('!debug')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  # Ensures Steam shortcuts point to our wrapper instead of raw electron
  patch -p1 -i "$srcdir/fix-exec-heroic.patch"
  # Fix desktop file for system integration
  sed -i "s/Exec=heroic-run /Exec=heroic %u/" "flatpak/com.heroicgameslauncher.hgl.desktop"
}

build() {
  cd "$_pkgname"
  export PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1
  export ELECTRON_SKIP_BINARY_DOWNLOAD=1

  pnpm install
  pnpm run download-helper-binaries
  pnpm electron-vite build
  pnpm electron-builder --linux --x64 --dir \
    -c.electronDist=/usr/lib/$_electron/ \
    -c.electronVersion=$(cat /usr/lib/$_electron/version | sed 's/^v//')
}

package() {
  cd "$_pkgname"
  install -d "$pkgdir/opt/heroic"
  install -d "$pkgdir/usr/bin"

  # Install resources to /opt to avoid container path reservation conflicts
  install -Dm644 dist/linux-unpacked/resources/app.asar -t "$pkgdir/opt/heroic/"
  cp -r dist/linux-unpacked/resources/app.asar.unpacked "$pkgdir/opt/heroic/"
  rm -rf "$pkgdir/opt/heroic/app.asar.unpacked/build/bin/arm64/"

  # Wrapper script
  echo -e "#!/bin/bash\nexec $_electron /opt/heroic/app.asar \"\$@\"" > "$pkgdir/usr/bin/heroic"
  chmod +x "$pkgdir/usr/bin/heroic"

  # System integration files
  install -Dm644 "flatpak/com.heroicgameslauncher.hgl.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/com.heroicgameslauncher.hgl.png"
  install -Dm644 "flatpak/com.heroicgameslauncher.hgl.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 "flatpak/templates/com.heroicgameslauncher.hgl.metainfo.xml.template" \
    "$pkgdir/usr/share/metainfo/com.heroicgameslauncher.hgl.metainfo.xml"
}
