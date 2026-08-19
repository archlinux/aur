# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=dbx-mcp-server-bin
pkgver=0.4.66
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
sha256sums=('f692caac9db11075d95189d3a6cde2366590f8f84584f23b91a6d9541bdd35e4')
sha256sums_x86_64=('199c839776bb1c2a5171697803effe59eb8b945069169ca61c29636a098bb7a6')
sha256sums_aarch64=('334eba4da65ecdd8ad2998ae566c569156471a0a8cf7af15553a61e042777f16')

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
