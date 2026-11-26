# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=claude-p-bin
pkgver=0.1.3
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
sha256sums=('30cbfb19515581ed709906654593b168c3a8ee9bfc97f892bb7f233a86161fd3')
sha256sums_x86_64=('9a902fe6dcc2ba1dbbb8a0eee91be84298620295d1ee5a9994438ee78d8ff2c4')
sha256sums_aarch64=('ae2908ac3c70d73743e22d22f6d5249beaeeca67ca3c2f72b6f16bd66bbd4306')
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
