# Maintainer: AnimaZed Team <team@animazed.dev>
# Contributor: Zed Industries <hi@zed.dev>
# Based on zed-git from AUR and zed's script/package-arch-linux

pkgname=animazed-git
pkgver=1.9.0.r38682.gf945407ed6
pkgrel=1
pkgdesc="A high-performance, multiplayer code editor (AnimaZed fork) - git version"
arch=('x86_64' 'aarch64')
url="https://github.com/animaios/animazed"
license=('Apache-2.0' 'GPL-3.0-or-later')
depends=(
    'gcc-libs'
    'glibc'
    'libxcb'
    'libxkbcommon'
    'wayland'
    'libgl'
    'fontconfig'
    'freetype2'
    'alsa-lib'
    'glib2'
    'libva'
    'zstd'
    'sqlite'
    'pipewire'
    'xdg-desktop-portal'
)
makedepends=(
    'git'
    'cargo'
    'clang'
    'cmake'
    'pkgconf'
    'musl'
    'libgit2'
    'openssl'
    'jq'
)
optdepends=(
    'git: for git integration'
    'nodejs: for language servers'
    'python: for language servers'
    'rust: for rust-analyzer'
    'docker: for dev containers'
    'ssh: for remote development'
)
provides=('animazed' 'zed')
conflicts=('animazed' 'zed' 'zed-git' 'zed-preview' 'zed-nightly')
options=('!lto')
source=("git+${url}.git")
sha256sums=('SKIP')

# Version format: major.minor.patch.r<commits_since_tag>.g<short_hash>
pkgver() {
    cd "${pkgname%-git}"

    # Get version from Cargo.toml
    local version=$(grep '^version =' crates/zed/Cargo.toml | head -1 | sed 's/.*= *"\(.*\)".*/\1/')

    # Get git info
    local commits=$(git rev-list --count HEAD)
    local hash=$(git rev-parse --short HEAD)

    printf "%s.r%s.g%s" "${version}" "${commits}" "${hash}"
}

prepare() {
    cd "${pkgname%-git}"

    # Set up cargo environment
    export CARGO_HOME="${srcdir}/cargo-home"
    export RUSTUP_TOOLCHAIN=stable

    # Create cargo home if it doesn't exist
    mkdir -p "${CARGO_HOME}"

    # Fetch dependencies
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${pkgname%-git}"

    # Set up build environment
    export CARGO_HOME="${srcdir}/cargo-home"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR="${srcdir}/target"

    # Use mold linker if available for faster linking
    export RUSTFLAGS="${RUSTFLAGS} -C link-arg=-fuse-ld=mold"

    # Build the workspace with release profile
    cargo build --release --locked --workspace \
        --exclude zed_visual_test_runner \
        --exclude benchmarks \
        --exclude compliance \
        --exclude perf \
        --exclude xtask
}

check() {
    cd "${pkgname%-git}"

    export CARGO_HOME="${srcdir}/cargo-home"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR="${srcdir}/target"

    # Run unit tests (skip integration tests which may need services)
    cargo test --release --locked --workspace --lib --bins \
        --exclude zed_visual_test_runner \
        --exclude benchmarks \
        --exclude compliance \
        --exclude perf \
        --exclude xtask 2>&1 | head -1000
}

package() {
    cd "${pkgname%-git}"

    local target_dir="${srcdir}/target/release"
    local pkg_dir="${pkgdir}"

    # Install binaries
    install -Dm755 "${target_dir}/zed" "${pkg_dir}/usr/bin/animazed-editor"
    install -Dm755 "${target_dir}/remote_server" "${pkg_dir}/usr/libexec/animazed-remote-server"

    # Install CLI binary (named 'animazed' for CLI, 'animazed-editor' for GUI)
    if [[ -f "${target_dir}/cli" ]]; then
        install -Dm755 "${target_dir}/cli" "${pkg_dir}/usr/bin/animazed"
    else
        # Build cli if not already built
        export CARGO_HOME="${srcdir}/cargo-home"
        export RUSTUP_TOOLCHAIN=stable
        export CARGO_TARGET_DIR="${srcdir}/target"
        cargo build --release --locked --package cli
        install -Dm755 "${target_dir}/cli" "${pkg_dir}/usr/bin/animazed"
    fi

    # Create symlink for compatibility (zed -> animazed)
    ln -sf animazed "${pkg_dir}/usr/bin/zed"
    ln -sf animazed-editor "${pkg_dir}/usr/bin/zed-editor"

    # Install desktop file
    install -Dm644 crates/zed/resources/zed.desktop.in "${pkg_dir}/usr/share/applications/dev.zed.Zed.desktop"
    sed -i 's|\$APP_NAME|AnimaZed|g' "${pkg_dir}/usr/share/applications/dev.zed.Zed.desktop"
    sed -i 's|\$APP_CLI|animazed|g' "${pkg_dir}/usr/share/applications/dev.zed.Zed.desktop"
    sed -i 's|\$APP_ICON|animazed|g' "${pkg_dir}/usr/share/applications/dev.zed.Zed.desktop"
    sed -i 's|\$APP_ARGS|%U|g' "${pkg_dir}/usr/share/applications/dev.zed.Zed.desktop"
    sed -i 's|\$DO_STARTUP_NOTIFY|true|g' "${pkg_dir}/usr/share/applications/dev.zed.Zed.desktop"

    # Install icons
    install -Dm644 crates/zed/resources/app-icon.png "${pkg_dir}/usr/share/icons/hicolor/512x512/apps/animazed.png"
    install -Dm644 crates/zed/resources/app-icon@2x.png "${pkg_dir}/usr/share/icons/hicolor/1024x1024/apps/animazed.png"

    # Create symlinks for standard zed icon names
    ln -sf animazed.png "${pkg_dir}/usr/share/icons/hicolor/512x512/apps/zed.png"
    ln -sf animazed.png "${pkg_dir}/usr/share/icons/hicolor/1024x1024/apps/zed.png"

    # Install metainfo
    install -Dm644 crates/zed/resources/flatpak/zed.metainfo.xml.in "${pkg_dir}/usr/share/metainfo/dev.zed.Zed.metainfo.xml"
    sed -i 's|\$APP_ID|dev.zed.Zed|g' "${pkg_dir}/usr/share/metainfo/dev.zed.Zed.metainfo.xml"
    sed -i 's|\$APP_NAME|AnimaZed|g' "${pkg_dir}/usr/share/metainfo/dev.zed.Zed.metainfo.xml"
    sed -i 's|\$BRANDING_LIGHT|#f5f5f5|g' "${pkg_dir}/usr/share/metainfo/dev.zed.Zed.metainfo.xml"
    sed -i 's|\$BRANDING_DARK|#2b2b2b|g' "${pkg_dir}/usr/share/metainfo/dev.zed.Zed.metainfo.xml"
    # Remove the placeholder release_info
    sed -i '/@release_info@/d' "${pkg_dir}/usr/share/metainfo/dev.zed.Zed.metainfo.xml"

    # Install license
    install -Dm644 LICENSE-APACHE "${pkg_dir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
    install -Dm644 LICENSE-GPL "${pkg_dir}/usr/share/licenses/${pkgname}/LICENSE-GPL"

    # Install shell completions if available
    if [[ -f "${target_dir}/zed.bash" ]]; then
        install -Dm644 "${target_dir}/zed.bash" "${pkg_dir}/usr/share/bash-completion/completions/animazed"
        ln -sf animazed "${pkg_dir}/usr/share/bash-completion/completions/zed"
    fi
    if [[ -f "${target_dir}/zed.fish" ]]; then
        install -Dm644 "${target_dir}/zed.fish" "${pkg_dir}/usr/share/fish/vendor_completions.d/animazed.fish"
        ln -sf animazed.fish "${pkg_dir}/usr/share/fish/vendor_completions.d/zed.fish"
    fi
    if [[ -f "${target_dir}/_zed" ]]; then
        install -Dm644 "${target_dir}/_zed" "${pkg_dir}/usr/share/zsh/site-functions/_animazed"
        ln -sf _animazed "${pkg_dir}/usr/share/zsh/site-functions/_zed"
    fi

    # Generate completions if not present
    if ! [[ -f "${target_dir}/zed.bash" ]]; then
        "${pkg_dir}/usr/bin/animazed" completions bash > "${pkg_dir}/usr/share/bash-completion/completions/animazed" 2>/dev/null || true
        ln -sf animazed "${pkg_dir}/usr/share/bash-completion/completions/zed"
        "${pkg_dir}/usr/bin/animazed" completions fish > "${pkg_dir}/usr/share/fish/vendor_completions.d/animazed.fish" 2>/dev/null || true
        ln -sf animazed.fish "${pkg_dir}/usr/share/fish/vendor_completions.d/zed.fish"
        "${pkg_dir}/usr/bin/animazed" completions zsh > "${pkg_dir}/usr/share/zsh/site-functions/_animazed" 2>/dev/null || true
        ln -sf _animazed "${pkg_dir}/usr/share/zsh/site-functions/_zed"
    fi
}
