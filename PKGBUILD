# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=claude-p-bin
pkgver=0.1.0
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
sha256sums=('d9454c6c475bc88eb65f4c5d3fc23fad1a4dc99f137ec43bbf90787303acc90d')
sha256sums_x86_64=('954090b658a63b4ca82ebce25996edde16077f3455fa533a410be03e675e687f')
sha256sums_aarch64=('f90e18bcdc807b25fc2939b5ced75c82bac17458c73a4a2d08aecb55505d77d4')
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
