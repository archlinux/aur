# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=claude-p-bin
pkgver=0.0.4
pkgrel=1
pkgdesc='Drop-in replacement for claude -p using an in-process PTY session'
arch=('x86_64' 'aarch64')
url='https://github.com/smithersai/claude-p'
license=('MIT')
depends=('claude-code')
provides=('claude-p')
conflicts=('claude-p')
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('47bd792185d36058ce90ae4f38442cab00e037bee23f4945ed77e94d22b3a8fa')
sha256sums_x86_64=('7feb13e07fc1a1892c7855cf300d084f441acb8d5e30bad37e14aef351f153f9')
sha256sums_aarch64=('a69eba0ef99b2c83f6fc596cdb17189f01cc80a9637d54aebc86e200fc0ffdb4')
source_x86_64=("claude-p-${pkgver}-linux-x64.gz::${url}/releases/download/v${pkgver}/claude-p-linux-x64.gz")
source_aarch64=("claude-p-${pkgver}-linux-arm64.gz::${url}/releases/download/v${pkgver}/claude-p-linux-arm64.gz")
noextract=("claude-p-${pkgver}-linux-x64.gz"
           "claude-p-${pkgver}-linux-arm64.gz")

latestver() {
    gh api --paginate repos/smithersai/claude-p/releases --jq \
        '.[] | select(.prerelease == false and .draft == false) | .tag_name' |
        sed -nE 's/^v([0-9]+(\.[0-9]+)*)$/\1/p' | sort -V | tail -1
}

package() {
    local _asset

    case "${CARCH}" in
        x86_64) _asset="claude-p-${pkgver}-linux-x64.gz" ;;
        aarch64) _asset="claude-p-${pkgver}-linux-arm64.gz" ;;
    esac

    gzip -dc "${_asset}" > claude-p
    install -Dm755 claude-p "${pkgdir}/usr/bin/claude-p"
    strip "${pkgdir}/usr/bin/claude-p"
    install -Dm644 "claude-p-${pkgver}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
