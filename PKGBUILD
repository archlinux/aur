# Maintainer: jinzhongjia <mail@nvimer.org>
pkgname=dbx
pkgver=0.5.52
pkgrel=1
pkgdesc="Open-source database management tool (Tauri-based)"
arch=('x86_64')
url="https://github.com/t8y2/dbx"
license=('AGPL-3.0-only')
depends=(
    'webkit2gtk-4.1'
    'gtk3'
    'sqlite'
    'unixodbc'
    'openssl'
    'hicolor-icon-theme'
)
makedepends=(
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
sha256sums=('665cae4d9d4f9454f97a8a29e2d14b805a2667fd237d1725c9a0b8163f2620b4')

prepare() {
    cd "$pkgname-$pkgver"

    # Keep all build state inside $srcdir, never touch user $HOME
    export CARGO_HOME="$srcdir/.cargo"
    export npm_config_cache="$srcdir/.npm"
    pnpm config --location project set store-dir "$srcdir/.pnpm-store"

    # pnpm v10 blocks postinstall scripts unless the package is listed in
    # package.json#pnpm.onlyBuiltDependencies. Upstream allows esbuild only;
    # vue-demi also needs its postinstall to pick the right Vue 2/3 shim.
    node -e '
      const fs = require("fs");
      const p = JSON.parse(fs.readFileSync("package.json", "utf8"));
      p.pnpm = p.pnpm || {};
      const cur = p.pnpm.onlyBuiltDependencies || [];
      p.pnpm.onlyBuiltDependencies = [...new Set([...cur, "vue-demi"])];
      fs.writeFileSync("package.json", JSON.stringify(p, null, 2) + "\n");
    '

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
    export RUSTUP_TOOLCHAIN=stable

    # ponytail: upstream's default `sqlite-sqlcipher` feature builds rusqlite
    # with `bundled-sqlcipher-vendored-openssl` — sqlcipher + openssl compiled
    # statically in-tree, no system lib needed. The old
    # LIBSQLITE3_SYS_USE_PKG_CONFIG=1 (added for the since-removed sqlx dep)
    # forced pkg-config mode, making the linker look for a system -lsqlcipher
    # that isn't there. Dropped so the bundled build runs as upstream intends.

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
