# Maintainer: Ulises Jeremias Cornejo Fandos <ulisescf.24@gmail.com>
# Native V binary plus its SHA-256-pinned offline resources from GitHub Releases.
pkgname=agent-toolkit-bin
pkgver=1.50.0
pkgrel=1
pkgdesc="Composable AI agent toolkit — native V CLI (prebuilt GitHub Release binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/ulises-jeremias/agent-toolkit"
license=('MIT')
provides=('agent-toolkit')
conflicts=('agent-toolkit')
options=('!strip')
resource_bundle_required=1
source_x86_64=("agent-toolkit-1.50.0-linux-x86_64.tar.gz::https://github.com/ulises-jeremias/agent-toolkit/releases/download/v1.50.0/agent-toolkit-1.50.0-linux-x86_64.tar.gz")
source_aarch64=("agent-toolkit-1.50.0-linux-arm64.tar.gz::https://github.com/ulises-jeremias/agent-toolkit/releases/download/v1.50.0/agent-toolkit-1.50.0-linux-arm64.tar.gz")
sha256sums_x86_64=('0390bcc90dd195d69c46ce5cba53dc43285d5a071334e8d9ed285d7b376c2fe4')
sha256sums_aarch64=('8b84e0ca93c0b169bed0ada0e935b32998115a634cbeccb6449daf185e382f33')

package() {
    install -Dm755 "${srcdir}/agent-toolkit" "${pkgdir}/usr/bin/agent-toolkit"
    if [[ "${resource_bundle_required}" == "1" && ! -f "${srcdir}/embedded_data.bundle.gz" ]]; then
        echo "standalone release archive is missing its offline resource bundle" >&2
        return 1
    fi
    if [[ -f "${srcdir}/embedded_data.bundle.gz" ]]; then
        install -Dm644 "${srcdir}/embedded_data.bundle.gz" \
            "${pkgdir}/usr/share/agent-toolkit/data/embedded_data.bundle.gz"
        install -Dm644 "${srcdir}/LICENSE" \
            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
