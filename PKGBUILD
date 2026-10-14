# Maintainer: Oliver Mangold <oliver.mangold@pm.me>

pkgname=agy-acp-server
pkgver=1.4.0
pkgrel=1
pkgdesc="Google Antigravity ACP (Agent Client Protocol) server"
arch=('x86_64' 'aarch64')
url="https://antigravity.google/docs/ide/extensions"
license=('LicenseRef-Proprietary')
depends=(
    'bash'
    'glibc'
)
optdepends=(
    'antigravity-cli: Antigravity CLI companion'
    'antigravity: Antigravity desktop application'
)
provides=('antigravity-acp')
conflicts=('antigravity-acp')
options=('!strip')

source=(
    "LICENSE"
    "agy-acp-server.sh"
    "agent.json"
)
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::https://dl.google.com/agy-extensions/releases/linux/agy-acp-server-${pkgver}-linux-x86_64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::https://dl.google.com/agy-extensions/releases/linux/agy-acp-server-${pkgver}-linux-arm64.zip")

sha256sums=(
    'de423ec93df63fdf871960364f47514d2ab2614b4e73d63ee55266a41fa295fc'
    'bd7e2ebf6e8be2a03f66c32c86db68e4bb6c0bbb275b9b6c59d0b85409e872a5'
    'b4b527a6373f7edf95856e454875505954860678fc334b7e41a963cd002d07f1'
)
sha256sums_x86_64=('fbb2d54dd94fb897845308d3b6b46187c627f1c60078ded81adeeaf8b90c5d7a')
sha256sums_aarch64=('3dc43a21f5402b23a4dba7b320a6745e9dbf4b6ead912ce9fc76011ea3a08a7e')

package() {
    # Install server binaries into private library directory
    install -dm755 "${pkgdir}/usr/lib/${pkgname}"
    install -m755 "${srcdir}/agy_acp_server.par" "${pkgdir}/usr/lib/${pkgname}/agy_acp_server.par"
    install -m755 "${srcdir}/localharness_external" "${pkgdir}/usr/lib/${pkgname}/localharness_external"

    # Install launcher script and command symlinks
    install -Dm755 "${srcdir}/agy-acp-server.sh" "${pkgdir}/usr/bin/agy-acp-server"
    ln -s agy-acp-server "${pkgdir}/usr/bin/antigravity-acp"
    ln -s agy-acp-server "${pkgdir}/usr/bin/agy_acp_server.par"

    # Install ACP registry metadata
    install -Dm644 "${srcdir}/agent.json" "${pkgdir}/usr/lib/${pkgname}/agent.json"

    # Install license
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
