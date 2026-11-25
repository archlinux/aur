# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=dbx-mcp-server-bin
pkgver=0.4.145
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
sha256sums=('5382da1bb600365ab77dc14a39b5a89e8827751054798a19de065c4ba7d724b0')
sha256sums_x86_64=('649935ef6541fa0024ae2d312c2e24abe25e7949b72600610f81b2ee16a13947')
sha256sums_aarch64=('4da4c513599a1b291b27c8dba3c8a2d35b433bc83ebe602a8bec2db54628ea2e')

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
