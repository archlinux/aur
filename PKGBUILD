# Maintainer: jinzhongjia <mail@nvimer.org>
pkgname=dbx
pkgver=0.6.19
pkgrel=1
pkgdesc="Open-source database management tool (Tauri-based)"
arch=('x86_64')
url="https://github.com/t8y2/dbx"
license=('Apache-2.0')
depends=(
    'webkit2gtk-4.1'
    'gtk3'
    'sqlite'
    'unixodbc'
    'openssl'
    'hicolor-icon-theme'
)
makedepends=(
    # Check rustc >= 1.94.1 below; a versioned dependency excludes rustup.
    'rust'
    'cargo'
    'nodejs'
    'pnpm'
    'pkgconf'
    'git'
)
provides=("$pkgname")
conflicts=("$pkgname-bin")
# makepkg's global LTO option injects -flto=auto / -C linker-plugin-lto, which
# breaks final-link symbol resolution against several bundled native static
# archives in our dep tree (ring, aws-lc-sys). Disable for this package.
# !debug: rust release profile strips symbols, so the auto-split debug pkg is
# empty and gdb-add-index errors out. Skip the debug subpackage entirely.
options=('!lto' '!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('06db1e68d7fe9ff783f636da767a3c2889fe6e1aad11121eada542463d0c4422')

# rustup provides an unversioned "rust" package, so check the actual toolchain.
_check_rust_version() {
    local rust_version minimum=1.94.1
    rust_version=$(rustc --version) || return 1
    rust_version=${rust_version#rustc }
    rust_version=${rust_version%% *}
    if (( $(vercmp "$rust_version" "$minimum") < 0 )); then
        error "DBX requires rustc >= $minimum; the selected toolchain is $rust_version."
        error "Upgrade system Rust with 'sudo pacman -Syu', or run 'rustup update stable' and select it with RUSTUP_TOOLCHAIN=stable."
        return 1
    fi
}

prepare() {
    cd "$pkgname-$pkgver"

    # Keep all build state inside $srcdir, never touch user $HOME
    export CARGO_HOME="$srcdir/.cargo"
    _check_rust_version || return 1
    export npm_config_cache="$srcdir/.npm"
    pnpm config --location project set store-dir "$srcdir/.pnpm-store"

    # Enable vue-demi's postinstall in upstream's pnpm build-script policy
    # so it can select the correct Vue 2/3 shim.
    sed -i 's/vue-demi: false/vue-demi: true/' pnpm-workspace.yaml
    # Upstream opts into openssl's vendored feature. Use the declared system
    # dependency instead: vendoring embeds its temporary $srcdir install path
    # in the final binary.
    sed -i 's/openssl = { version = "0.10", features = \["vendored"\] }/openssl = "0.10"/' \
        crates/dbx-drivers/Cargo.toml
    # The release binary must not retain a build-workspace fallback path.
    # It is only useful to upstream developers and contains $srcdir via
    # env!("CARGO_MANIFEST_DIR").
    sed -i '/CARGO_MANIFEST_DIR/,+2d' crates/dbx-drivers/src/agent_service.rs
    # Pre-fetch JS and Rust deps so build() can run without network.
    pnpm install --frozen-lockfile
    (
        cd src-tauri
        cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
    )
}

build() {
    cd "$pkgname-$pkgver"

    export CARGO_HOME="$srcdir/.cargo"
    _check_rust_version || return 1
    # Disable LTO. With lto="thin" (set in workspace Cargo.toml) plus rust-lld,
    # native static libs from build scripts (aws-lc-sys, ring, etc.) end up
    # with undefined symbols at final link. Disabling LTO restores normal
    # static-archive resolution.
    export CARGO_PROFILE_RELEASE_LTO=false

    # Strip $srcdir from panic-message file paths embedded by rustc; otherwise
    # makepkg warns "package contains reference to $srcdir". Also remap the
    # cargo registry to a stable path so the binary is reproducible regardless
    # of where it was built.
    export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix=$srcdir/$pkgname-$pkgver=/build/$pkgname --remap-path-prefix=$srcdir/.cargo/registry=/cargo-registry --remap-path-prefix=$srcdir/.cargo/git=/cargo-git"

    # Frontend + backend in one step; skip bundling, we install files ourselves
    pnpm exec tauri build --no-bundle
}

package() {
    cd "$pkgname-$pkgver"

    # Binary (workspace target dir is at repo root, not under src-tauri/)
    install -Dm755 "target/release/dbx" \
        "$pkgdir/usr/bin/dbx"

    # Icons (hicolor)
    install -Dm644 "src-tauri/icons/32x32.png" \
        "$pkgdir/usr/share/icons/hicolor/32x32/apps/dbx.png"
    install -Dm644 "src-tauri/icons/128x128.png" \
        "$pkgdir/usr/share/icons/hicolor/128x128/apps/dbx.png"
    install -Dm644 "src-tauri/icons/128x128@2x.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/dbx.png"
    install -Dm644 "src-tauri/icons/icon.png" \
        "$pkgdir/usr/share/pixmaps/dbx.png"

    # Desktop entry
    install -dm755 "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/dbx.desktop" <<EOF
[Desktop Entry]
Name=DBX
Comment=$pkgdesc
Exec=dbx %U
Icon=dbx
Terminal=false
Type=Application
Categories=Development;Database;
StartupWMClass=DBX
EOF

    # License
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
