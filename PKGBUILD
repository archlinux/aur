# Maintainer: Garrett Stewart <zero@gr-p.com>
pkgname=deadsync
pkgdesc='ITG/StepMania engine with Vulkan/OpenGL backends, focused on perfect sync and competitive-level performance'
url='https://github.com/pnn64/deadsync'
license=('GPL-3.0-only')
arch=('x86_64' 'aarch64')
depends=(
    'vulkan-icd-loader'
    'libgl'
    'libudev.so'
    'libasound.so'
    'hicolor-icon-theme'
)
makedepends=(
    'cargo'
    'cmake'
    'ninja'
    'vulkan-headers'
    'pkg-config'
    'rsync'
)
options=('!lto' '!debug' '!strip')
install="${pkgname}.install"

pkgver=0.5.690
pkgrel=1

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pnn64/deadsync/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('34864ca5cd2a5fcce6854dc7abb6102b9bc9ab0cbe9044c49fe9eaa6ce388f10')

prepare() {
    cd "${srcdir}/deadsync-${pkgver}"

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${srcdir}/deadsync-${pkgver}"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    unset CFLAGS CXXFLAGS

    export RUSTFLAGS="${RUSTFLAGS} \
        --remap-path-prefix=${srcdir}=/build/source \
        --remap-path-prefix=${CARGO_HOME:-$HOME/.cargo}=/build/cargo"

    cargo build --frozen --release
}

package() {
    cd "${srcdir}/deadsync-${pkgver}"

    install -dm755 "${pkgdir}/opt/deadsync"

    install -Dm755 "target/release/deadsync" \
        "${pkgdir}/opt/deadsync/deadsync"

    rsync -a --no-links \
        --exclude=src \
        --exclude=target \
        --exclude=.git \
        --exclude=.github \
        --exclude=tests \
        --exclude=docs \
        --exclude=scripts \
        --exclude=portable.txt \
        --exclude=Cargo.toml \
        --exclude=Cargo.lock \
        --exclude=build.rs \
        --exclude=flake.nix \
        --exclude=flake.lock \
        --exclude=.editorconfig \
        --exclude=.gitignore \
        --exclude=TRANSLATION_STATUS.md \
        . "${pkgdir}/opt/deadsync/"

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
Icon=folder-build
Exec=sh -c 'DS="${XDG_DATA_HOME:-$HOME/.local/share}/deadsync"; mkdir -p "$DS" && xdg-open "$DS"'

[Desktop Action OpenSongsDir]
Name=Open Songs Directory
Icon=folder-music
Exec=sh -c 'DS="${XDG_DATA_HOME:-$HOME/.local/share}/deadsync/songs"; mkdir -p "$DS" && xdg-open "$DS"'
EOF

    local _icondir="assets/graphics/icon"
    for _size in 16 24 32 48 64 96 128 256 512 1024; do
        install -Dm644 "${_icondir}/icon-${_size}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/deadsync.png"
    done
    install -Dm644 "${_icondir}/icon.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/deadsync.svg"

    install -Dm644 LICENSE \
        "${pkgdir}/usr/share/licenses/deadsync/LICENSE"
}
