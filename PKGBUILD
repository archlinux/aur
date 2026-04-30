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

pkgver=0.3.885
pkgrel=1

# NOTE: aarch64 releases use "arm64" in the asset filename, not "aarch64".
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/pnn64/deadsync/releases/download/v${pkgver}/deadsync-v${pkgver}-x86_64-linux.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/pnn64/deadsync/releases/download/v${pkgver}/deadsync-v${pkgver}-arm64-linux.tar.gz")
sha256sums_x86_64=('8b04f90c1ff75e55d9018223d07ca62e30a1fde8cb2f47d1bb4686a0ccc0bde1')
sha256sums_aarch64=('f793954a272762d9b467c05b026bf68ec800977f820f7d3cce14e733650c29b6')

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
Actions=OpenDataDir;

[Desktop Action OpenDataDir]
Name=Open Data Directory
Exec=xdg-open "$XDG_DATA_HOME/deadsync"
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
