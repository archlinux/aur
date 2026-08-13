# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=dbx-mcp-server-bin
pkgver=0.4.61
pkgrel=1
pkgdesc="MCP server for DBX — query databases from Claude Code, Cursor, and other AI agents"
arch=('x86_64' 'aarch64')
url="https://github.com/t8y2/dbx/tree/main/packages/mcp-server"
license=('Apache-2.0')
depends=('glibc' 'gcc-libs')
optdepends=('dbx: desktop app to configure the database connections the MCP server reuses')
provides=('dbx-mcp-server')
conflicts=('dbx-mcp-server')
# Prebuilt, already-stripped Rust binary shipped by upstream. Don't re-strip,
# and skip the (empty) debug subpackage since there are no source symbols.
options=('!strip' '!debug')

# Upstream publishes the MCP server as a per-platform prebuilt Rust binary
# named `dbx-mcp` inside npm packages @dbx-app/mcp-<platform>; the pure-JS
# @dbx-app/mcp-server package is only a launcher that spawns that binary.
# We install the binary directly, so no Node.js runtime is needed.
_npm='https://registry.npmjs.org/@dbx-app'

# The platform binary packages ship no LICENSE; pull the Apache-2.0 text from
# the launcher package (same license). Arch-independent.
source=("${pkgname}-${pkgver}-license.tgz::${_npm}/mcp-server/-/mcp-server-${pkgver}.tgz")
# ponytail: pkgver in the ::-renamed filenames so makepkg re-fetches on bump
# instead of reusing a stale cached tarball ([[pkgbuild-source-filename-versioned]]).
source_x86_64=("${pkgname}-${pkgver}-x64.tgz::${_npm}/mcp-linux-x64-gnu/-/mcp-linux-x64-gnu-${pkgver}.tgz")
source_aarch64=("${pkgname}-${pkgver}-arm64.tgz::${_npm}/mcp-linux-arm64-gnu/-/mcp-linux-arm64-gnu-${pkgver}.tgz")
sha256sums=('403fbbd0743b32720efab44d5a1a9fd1c69071927b4f2d08eb9e00f094c4f069')
sha256sums_x86_64=('8d1d8a73e1699fbe801082834866c90acd36b531a3ce3ed149f350cb668fd22f')
sha256sums_aarch64=('47f0fa94f6162f1870844b567acdb84bce48ebda9f35906c626f9d39a2ae29e9')

package() {
    # Both tarballs unpack under srcdir/package/; the files we consume
    # (bin/dbx-mcp from the platform pkg, LICENSE from the launcher pkg) have
    # distinct names, so the merge is deterministic.

    # Install as `dbx-mcp-server` — the name DBX probes for on PATH
    # (src-tauri/src/commands/mcp.rs: locate_command("dbx-mcp-server")), so
    # DBX's settings page reports the server installed.
    install -Dm755 "${srcdir}/package/bin/dbx-mcp" \
        "${pkgdir}/usr/bin/dbx-mcp-server"

    # Upstream's own binary name, for agent configs that reference `dbx-mcp`.
    ln -s dbx-mcp-server "${pkgdir}/usr/bin/dbx-mcp"

    install -Dm644 "${srcdir}/package/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
