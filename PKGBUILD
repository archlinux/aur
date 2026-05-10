# Maintainer: italoghost <eduprodive at posteo dot me>
# Reference: https://gitlab.manjaro.org/packages/extra/heroic-games-launcher

pkgname=heroic-games-launcher-electron-git
_pkgname=HeroicGamesLauncher
pkgver=2.21.0.r8.g7dfea533a
pkgrel=1
_electron=electron
pkgdesc="Native GOG, Epic Games and Amazon games launcher. Development version (Git) using system Electron."
arch=('x86_64')
url="https://heroicgameslauncher.com/"
license=('GPL-3.0-only')
depends=(
  'python'
  'glibc'
  'zlib'
  'libgcc'
  'hicolor-icon-theme'
  'qt6-base'
  'nss'
  'nspr'
  'alsa-lib'
  'libdrm'
  'libx11'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxrandr'
  'libxkbcommon'
  'libxcb'
  'gtk3'
  'pango'
  'cairo'
  'glib2'
  'at-spi2-core'
  'libcups'
  'mesa'
  'systemd-libs'
  'libxml2'
  'libxslt'
  'flac'
  'c-ares'
  'libpulse'
  'minizip'
  'opus'
  'libstdc++'
  'brotli'
  'fontconfig'
  'harfbuzz'
  'libffi'
  'freetype2'
  'expat'
  'libjpeg-turbo'
  'dbus'
  'libnghttp2'
)
makedepends=("$_electron" 'git' 'pnpm')
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
  sed -i "s/Exec=heroic-run /Exec=heroic /" "flatpak/com.heroicgameslauncher.hgl.desktop"
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

  # Use the compiled binary
  cp -R dist/linux-unpacked/. "${pkgdir}/opt/heroic/"
  ln -sf "/opt/heroic/heroic" "${pkgdir}/usr/bin/heroic"

  # System integration files
  install -Dm644 "flatpak/com.heroicgameslauncher.hgl.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/com.heroicgameslauncher.hgl.png"
  install -Dm644 "flatpak/com.heroicgameslauncher.hgl.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 "flatpak/templates/com.heroicgameslauncher.hgl.metainfo.xml.template" \
    "$pkgdir/usr/share/metainfo/com.heroicgameslauncher.hgl.metainfo.xml"
}
