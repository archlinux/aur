# Maintainer: Luke Bubar <luke@coldmail.xyz>

pkgname=project-reclaimer-bin
_pkgname=project-reclaimer
pkgver=0.10.3
_commit=c0b3fe02fd6c1bf64c7cdfd16eb7013c7352c3b5
pkgrel=1
pkgdesc="A rewrite of Bungie's Halo Games. Uses Master Chief Collection on Steam for game data."
arch=('x86_64')
url='https://github.com/ProjectReclaimer/project-reclaimer-releases'

license=('none')
# The game is 32-bit x86 code (its data has 32-bit pointers, as on the Xbox).
# The release brings its own SDL3, which loads the rest when it starts.

depends=(
    'glibc>=2.36'
    'alsa-lib'
    'vulkan-icd-loader'
    'hicolor-icon-theme'
)

optdepends=(
    'vulkan-radeon: Vulkan support for AMD GPUs'
    'vulkan-intel: Vulkan support for Intel GPUs'
    'nvidia-utils: Vulkan support for NVIDIA GPUs'
    'pipewire-alsa: Sound through PipeWire'
    'pulseaudio-alsa: Sound through PulseAudio'
    'wayland: Native Wayland window support'
    'libxkbcommon: Keyboard input for native Wayland'
    'libdecor: Client-side window decorations on Wayland'
    'xdg-utils: Opening invite links'
    'steam: Project Reclaimer requires game data from steam, and can use steam to pull maps and mods from the workshop'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
# Upstream's files as they are: its crash reports name addresses in this build.
source=(
    "${url}/releases/download/v${pkgver}/project-reclaimer-client-v${pkgver}-linux-x86_64.tar.gz"
)
sha256sums=('1b25ef4ed0e617c2e3c5ccdae5742c03e8eedcf310c8e6b32fe33e980145436b')

package() {
    local appdir
    appdir="$(dirname "$(find "$srcdir" -type f -name project-reclaimer -print -quit)")"

    # Install application files
    install -d "$pkgdir/opt/project-reclaimer"
    cp -a "$appdir/." "$pkgdir/opt/project-reclaimer/"

    # Install desktop entry, replacing @INSTALL@
    install -d "$pkgdir/usr/share/applications"
    sed 's|@INSTALL@|/opt/project-reclaimer|g' \
        "$appdir/project-reclaimer.desktop" \
        > "$pkgdir/usr/share/applications/project-reclaimer.desktop"

    # Install application icon
    install -Dm644 "$appdir/project-reclaimer.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/project-reclaimer.png"

    # Add command-line launcher
    install -d "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/project-reclaimer" <<'EOF'
#!/bin/sh
cd /opt/project-reclaimer || exit 1
exec ./project-reclaimer "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/project-reclaimer"
}
