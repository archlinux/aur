# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=dbx-mcp-server-bin
pkgver=0.4.44
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
sha256sums=('1146a8fe507ec806ca320bbebd6bba2207e9f04871e4fcbabf41389324bd91a9')
sha256sums_x86_64=('7d176ac034bfee4cef67d1aaa86d3cf17a6b99fcdaca1d63c99e1ade57e78a87')
sha256sums_aarch64=('6c2f0038be2243298b5ec15244c762d3269f3460f8c5455a16a79730691820a4')

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
