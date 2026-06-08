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

pkgver=0.4.573
pkgrel=1

# NOTE: aarch64 releases use "arm64" in the asset filename, not "aarch64".
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/pnn64/deadsync/releases/download/v${pkgver}/deadsync-v${pkgver}-x86_64-linux.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/pnn64/deadsync/releases/download/v${pkgver}/deadsync-v${pkgver}-arm64-linux.tar.gz")
sha256sums_x86_64=('b6957b6f02951e9e5b99faa22512d52cd33b1802dd4c5dd3d9a352f9b0913d69')
sha256sums_aarch64=('49d163e72b9a6208414c1e38d6218e85619caeb09485a82342074375791d842b')

package() {
    # The release tarball always extracts to a single "deadsync/" subdirectory.
    local _src="${srcdir}/deadsync"

    # portable.txt tells the game to resolve data paths relative to its own
    # directory instead of ~/.local/share/deadsync. Must not ship in an
    # installed package where user data lives in the home directory.
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
Actions=OpenConfigDir;OpenSongsDir;

[Desktop Action OpenConfigDir]
Name=Open Config Directory
Exec=sh -c 'DS="${XDG_DATA_HOME:-$HOME/.local/share}/deadsync"; mkdir -p "$DS" && xdg-open "$DS"'

[Desktop Action OpenSongsDir]
Name=Open Songs Directory
Exec=sh -c 'DS="${XDG_DATA_HOME:-$HOME/.local/share}/deadsync/songs"; mkdir -p "$DS" && xdg-open "$DS"'
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
