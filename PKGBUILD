# Maintainer: Ismet Togay <ismet.togay at gmail dot com>
# Contributor: Christopher Cooper <christopher@cg505.com>
pkgname=cursor-cli
pkgver=2026.08.25.1.3e8eec8
# Upstream is YYYY.MM.DD-<hash>. pkgver cannot contain hyphens, and hashes are
# not monotonically ordered, so pkgver is YYYY.MM.DD.<n>.<hash>: n resets to 1
# on a new date and increments when the same date gets a new hash.
# Derive the upstream version (YYYY.MM.DD-<hash>) from that pkgver.
_upstream_ver="${pkgver%.*}"
_upstream_ver="${_upstream_ver%.*}-${pkgver##*.}"
pkgrel=1
# epoch=1: bumped when switching from the original `20250808.0.<sha>` scheme
# to the current `YYYY.MM.DD.<n>.<hash>` scheme (2025-08-09). Never decrease.
epoch=1
pkgdesc="CLI tool for Cursor, the AI-first coding agent"
arch=('x86_64' 'aarch64')
url="https://cursor.com/cli"
license=('LicenseRef-Cursor')
depends=('gcc-libs' 'git' 'zlib')
options=('!strip')
install=cursor-cli.install
source=('Cursor-TOS'
        'auto-update-block.patch')
source_x86_64=("cursor-cli-${_upstream_ver}-x86_64.tar.gz::https://downloads.cursor.com/lab/${_upstream_ver}/linux/x64/agent-cli-package.tar.gz")
source_aarch64=("cursor-cli-${_upstream_ver}-aarch64.tar.gz::https://downloads.cursor.com/lab/${_upstream_ver}/linux/arm64/agent-cli-package.tar.gz")
b2sums=('d241ee9895bdb1c17514438fde8528222a8f2326568bd7a033d7a1b11432ce6b4575ff1a50625764bfe6bc6f8a9dc060f7439c3be7e95f8fd02912cdd37a011d'
        '1928e04c713e13911ea607f84c3e4a2fed1f76af9795503811078f43d2b53c753e28b2233e553fc17e766831800fb0dbc272aad2a80b387f95ba6071d7d4116a')
b2sums_x86_64=('cd5485f7524688e1a688daa2b64669c76bedcdd9ab87638bac78f9b42c2442bd5000559920a2f5171e00b5eb7fcf737f9111ef296f1eba40369cebf3279ee0a9')
b2sums_aarch64=('191ff1c538f294134d93d501e9ca68cc6d4f8101cb1cee449753dfefcd9039daecd7bf9f9f2baf9ee9262f40eea19aaf15f834c9abb56d967fb48a3a3f23b8ea')

prepare() {
    # Block cursor-agent auto-updates by making its versions directory
    # non-searchable (chmod -x; see auto-update-block.patch).
    patch -Np1 -d "${srcdir}/dist-package" -i "${srcdir}/auto-update-block.patch"
}

package() {
    install -dm755 "${pkgdir}/opt/cursor-agent"
    install -dm755 "${pkgdir}/usr/bin"

    # Copy all files from the extracted package (including upstream's
    # bundled node and rg runtimes).
    cp -r "${srcdir}"/dist-package/* "${pkgdir}/opt/cursor-agent/"

    # Create symlink in /usr/bin
    ln -s "/opt/cursor-agent/cursor-agent" "${pkgdir}/usr/bin/cursor-agent"

    # Install license
    # This is downloaded from https://cursor.com/terms-of-service
    install -Dm644 Cursor-TOS "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
