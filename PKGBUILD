# Maintainer: Ismet Togay <ismet.togay at gmail dot com>
# Contributor: Christopher Cooper <christopher@cg505.com>
pkgname=cursor-cli
pkgver=2026.10.19.1.6bbf2c4
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
b2sums=('f1dbf9263b11fa275baa3e192de3e29855262dd7d538aa3fd73d28a0e1e3c9b917ae1957e4b3a414e7492edc8f645255ad3df1fdbe83ad67a1c0d8913c141690'
        '1928e04c713e13911ea607f84c3e4a2fed1f76af9795503811078f43d2b53c753e28b2233e553fc17e766831800fb0dbc272aad2a80b387f95ba6071d7d4116a')
b2sums_x86_64=('60ccdfddb84a3ed54d5eb31dba1d493875e9c00f8274ef478b05cd6f4309683acd7031e478533fbcf47cd14f92174beff6d3b8cdf173e4c6d7509fdc7cdac8ee')
b2sums_aarch64=('97748f0a5939d684bdae2c2dc8be2b4943a5edbd6c6c053b19732453c6f54ddb5c59cb5616a7097032b1e2efb6d342b2faa916eda2be28bc0866096cc14d3c79')

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
