# Maintainer: Garrett Stewart <zero@gr-p.com>
pkgname=deadsync-bin
pkgdesc='ITG/StepMania engine with Vulkan/OpenGL backends, focused on perfect sync and competitive-level performance - binary release'
url='https://github.com/pnn64/deadsync'
license=('GPL-3.0-only')
arch=('x86_64' 'aarch64')
provides=('deadsync')
conflicts=('deadsync' 'deadsync-git')
depends=(
    'vulkan-icd-loader'
    'libgl'
    'libudev.so'
    'libasound.so'
    'hicolor-icon-theme'
)
options=('!strip')
install="${pkgname}.install"

pkgver=0.3.826
pkgrel=1

# NOTE: aarch64 releases use "arm64" in the asset filename, not "aarch64".
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/pnn64/deadsync/releases/download/v${pkgver}/deadsync-v${pkgver}-x86_64-linux.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/pnn64/deadsync/releases/download/v${pkgver}/deadsync-v${pkgver}-arm64-linux.tar.gz")
sha256sums_x86_64=('0483b072c219e23963722899505761b9df4adb03c45416a48c65fe3f19427340')
sha256sums_aarch64=('53302d3bac29270899c461210a6986c99af87a0f4ee5d2f2947fc1f59138c10b')

package() {
    local _src="${srcdir}/deadsync"

    # portable.txt tells the game to resolve data paths relative to its own directory
    rm -f "${_src}/portable.txt"

    install -dm755 "${pkgdir}/opt/deadsync"
    cp -a "${_src}/." "${pkgdir}/opt/deadsync/"
    chmod 755 "${pkgdir}/opt/deadsync/deadsync"

    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/deadsync" <<'EOF'
#!/bin/sh
exec /opt/deadsync/deadsync "$@"
EOF

    install -Dm644 /dev/stdin \
        "${pkgdir}/usr/share/applications/deadsync.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=DeadSync
GenericName=Rhythm Game
Comment=ITG/StepMania engine focused on perfect sync and competitive performance
Exec=/usr/bin/deadsync
Icon=deadsync
Categories=Game;
Keywords=ITG;StepMania;rhythm;dance;
StartupNotify=true

[Desktop Action OpenConfigDir]
Name=Open Config Directory
Exec=xdg-open "${HOME}/.deadsync"

[Desktop Action OpenSongsDir]
Name=Open Songs Directory
Exec=xdg-open "${HOME}/.deadsync/songs"
EOF

    local _icondir="${_src}/assets/graphics/icon"
    for _size in 16 24 32 48 64 96 128 256 512 1024; do
        install -Dm644 "${_icondir}/icon-${_size}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/deadsync.png"
    done
    install -Dm644 "${_icondir}/icon.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/deadsync.svg"

    [[ -f "${_src}/LICENSE" ]] && install -Dm644 "${_src}/LICENSE" \
        "${pkgdir}/usr/share/licenses/deadsync/LICENSE"
}
