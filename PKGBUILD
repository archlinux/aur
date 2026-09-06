# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=dbx-mcp-server-git
pkgver=0.4.80.r6178.g3e82d6d65
pkgrel=1
pkgdesc="MCP server for DBX — query databases from Claude Code, Cursor, and other AI agents (built from git)"
arch=('x86_64' 'aarch64')
url="https://github.com/t8y2/dbx/tree/main/crates/dbx-mcp"
license=('Apache-2.0')
depends=('glibc' 'gcc-libs')
makedepends=('rust' 'cargo' 'git')
optdepends=('dbx: desktop app to configure the database connections the MCP server reuses')
provides=('dbx-mcp-server')
# provides/conflicts on the base name is enough for mutual exclusion with
# dbx-mcp-server-bin too: pacman matches conflicts against provides.
conflicts=('dbx-mcp-server')
# The MCP server is only released to npm (no source tag), so track main.
# !lto: like the dbx package, makepkg's global LTO makes rust-lld drop symbols
# from the cc-built static archives that rustls' crypto backend (ring/aws-lc)
# pulls in. !debug: the workspace release profile strips symbols, leaving an
# empty debug subpackage that gdb-add-index chokes on.
options=('!lto' '!debug')
source=("dbx::git+https://github.com/t8y2/dbx.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/dbx"
    local _ver
    _ver=$(sed -n 's/^version = "\(.*\)"/\1/p' crates/dbx-mcp/Cargo.toml | head -1)
    printf '%s.r%s.g%s' "${_ver}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/dbx"
    # Keep cargo state inside $srcdir; never touch ~/.cargo.
    export CARGO_HOME="${srcdir}/.cargo"
    # Use Arch's openssl dependency instead of upstream's vendored feature:
    # the latter embeds a temporary $srcdir OpenSSL install path.
    sed -i 's/openssl = { version = "0.10", features = \["vendored"\] }/openssl = "0.10"/' \
        crates/dbx-core/Cargo.toml
    # This upstream-only workspace fallback embeds $srcdir through
    # env!("CARGO_MANIFEST_DIR") in release binaries.
    sed -i '/CARGO_MANIFEST_DIR/,+2d' crates/dbx-core/src/agent_service.rs

    cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
    cd "${srcdir}/dbx"
    export CARGO_HOME="${srcdir}/.cargo"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_PROFILE_RELEASE_LTO=false
    # Strip $srcdir from panic-message paths so makepkg doesn't warn about a
    # reference to $srcdir, and remap Cargo's registry and Git source trees
    # for reproducibility.
    export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix=${srcdir}/dbx=/build/dbx --remap-path-prefix=${srcdir}/.cargo/registry=/cargo-registry --remap-path-prefix=${srcdir}/.cargo/git=/cargo-git"

    # dbx-mcp pulls dbx-core with default-features=false, so the heavy
    # sqlcipher/duckdb native builds are skipped — only this crate is built.
    cargo build --frozen --release -p dbx-mcp
}

package() {
    cd "${srcdir}/dbx"
    # Install as `dbx-mcp-server` — the name DBX probes for on PATH
    # (src-tauri/src/commands/mcp.rs: locate_command("dbx-mcp-server")).
    install -Dm755 "target/release/dbx-mcp" "${pkgdir}/usr/bin/dbx-mcp-server"
    # Upstream's own binary name, for agent configs that reference `dbx-mcp`.
    ln -s dbx-mcp-server "${pkgdir}/usr/bin/dbx-mcp"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
