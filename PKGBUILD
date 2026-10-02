# Maintainer: Ismet Togay <ismet.togay at gmail dot com>
# Contributor: Christopher Cooper <christopher@cg505.com>
pkgname=cursor-cli
pkgver=2026.10.01.1.e373342
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
b2sums_x86_64=('d03c9968dc65309de7879104dd67e0b1a55f218af5c89a3a9a810d597a525b8f4fa4aa8f6cea3cd9329d0fcb14075c6fc181a5c96ed0addba5756b464a4d878b')
b2sums_aarch64=('5018a6242c2de61bac40a369039ebc8f62e9783c4ac5956a9b10ad76956474c03abf957150df8d7bd2abb798e9d22f2d96ae1735765d086e522748c0ca0c2f5b')

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
