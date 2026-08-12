# Maintainer: italoghost <eduprodive at posteo dot me>
# Reference: https://gitlab.manjaro.org/packages/extra/heroic-games-launcher

pkgname=heroic-games-launcher-electron-git
_pkgname=HeroicGamesLauncher
pkgver=2.22.1.r5.g37a9bef67
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
    'bash'
)
makedepends=("$_electron" 'git' 'pnpm')
provides=('heroic-games-launcher')
conflicts=('heroic-games-launcher')
source=("git+https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher.git")
sha256sums=('SKIP')

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
    # Install resources to /opt to avoid container path reservation conflicts
    install -Dm644 dist/linux-unpacked/resources/app.asar -t "$pkgdir/opt/heroic/"
    cp -r dist/linux-unpacked/resources/app.asar.unpacked "$pkgdir/opt/heroic/"
    # Wrapper script
    echo -e "#!/bin/bash\nexec $_electron /opt/heroic/app.asar \"\$@\"" > "$pkgdir/usr/bin/heroic"
    chmod +x "$pkgdir/usr/bin/heroic"
    # System integration files
    install -Dm644 "flatpak/com.heroicgameslauncher.hgl.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/com.heroicgameslauncher.hgl.png"
    install -Dm644 "flatpak/com.heroicgameslauncher.hgl.desktop" -t "$pkgdir/usr/share/applications/"
    install -Dm644 "flatpak/templates/com.heroicgameslauncher.hgl.metainfo.xml.template" \
        "$pkgdir/usr/share/metainfo/com.heroicgameslauncher.hgl.metainfo.xml"
}
