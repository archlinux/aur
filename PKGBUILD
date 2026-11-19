# Maintainer: Ismet Togay <ismet.togay at gmail dot com>
# Contributor: Christopher Cooper <christopher@cg505.com>
pkgname=cursor-cli
pkgver=2026.11.19.1.f005e9d
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
b2sums_x86_64=('c60b8607cef9824c004b7a7d6c4b917609a587e8062fc9f26be4d1880eb8a995d68859d8087d86121467fbe7edd1bf20e77e33dad95db7327fde5abe069968c1')
b2sums_aarch64=('c6c0f34eb27f577ce4772358710d82658cab4e2f34085cb6f138598e1a62592c3b6c3eaaecd9b2fb8ee7a913eb21e14d38d05210c51a6c7a857460c953c7a057')

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
