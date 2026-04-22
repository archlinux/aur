# Maintainer: Garrett Stewart <zero@gr-p.com>
pkgname=deadsync-git
pkgdesc='ITG/StepMania engine with Vulkan/OpenGL backends, focused on perfect sync and competitive-level performance - from git'
url='https://github.com/pnn64/deadsync'
license=('GPL-3.0-only')
arch=('x86_64' 'aarch64')
provides=('deadsync')
conflicts=('deadsync' 'deadsync-bin')
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
    'git'
    'rsync'
)
options=('!lto' '!debug' '!strip')
install="${pkgname}.install"

pkgver=0.3.620.r0.g83363dd # Placeholder - gets overwritten with pkgver()
pkgrel=1

source=("${pkgname}::git+https://github.com/pnn64/deadsync.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags --abbrev=7 --match='v[0-9]*' 2>/dev/null \
        | sed 's/^v//; s/-\([0-9]*\)-g/\.r\1\.g/; s/-/\./g' \
        || printf 'r%s.g%s' \
               "$(git rev-list --count HEAD)" \
               "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "${srcdir}/${pkgname}"

    git submodule update --init --recursive

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${srcdir}/${pkgname}"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    export RUSTFLAGS="${RUSTFLAGS} \
        --remap-path-prefix=${srcdir}=/build/source \
        --remap-path-prefix=${CARGO_HOME:-$HOME/.cargo}=/build/cargo"

    cargo build --release
}

package() {
    cd "${srcdir}/${pkgname}"

    install -dm755 "${pkgdir}/opt/deadsync"

    install -Dm755 "target/release/deadsync" \
        "${pkgdir}/opt/deadsync/deadsync"

    # Copy all game data using rsync with a denylist so future additions
    # (songs, courses, new asset dirs) are included automatically.
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

    # -----------------------------------------------------------------------
    # Wrapper script so `deadsync` works from any terminal.
    # -----------------------------------------------------------------------
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/deadsync" <<'EOF'
#!/bin/sh
exec /opt/deadsync/deadsync "$@"
EOF

    # -----------------------------------------------------------------------
    # Desktop entry
    # -----------------------------------------------------------------------
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
EOF

    # Install all sized icons into the hicolor theme so Icon=deadsync in the
    # .desktop file resolves correctly through the icon theme lookup chain.
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
