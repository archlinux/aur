# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

pkgname=beardrive-bin
_pkgname=beardrive
pkgver=0.14.0
pkgrel=3
pkgdesc='Synced file system for AI agents to mount, sync, and track folders'
arch=('x86_64' 'aarch64')
url='https://github.com/runbear-io/beardrive'
license=('AGPL-3.0-only')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
depends=('ca-certificates')
optdepends=(
    'git: detect the author email from Git configuration'
    'xdg-utils: open the browser during login'
)

_base="${url}/releases/download/v${pkgver}"
source=('beardrive.service' 'beardrive-remain-after-exit.conf')
sha256sums=(
    '7bd8a9e2991f8147876dee346ada1b2d995c2d2022a8b9819583f1e2d3e06402'
    '6049595dbfb241227294395bdc5dda50082946ced6d60adba723fd639e1fd77b'
)
source_x86_64=("${_base}/beardrive_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${_base}/beardrive_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('981c9c9c043db8060299adc37880cc8763f0333b1ce0c274976ec315a5d8ced0')
sha256sums_aarch64=('1a552ac3d288c5e36f5b82da56c49ba427d903ada607546b4906e386eda4f19f')

package() {
    install -Dm755 bdrive "${pkgdir}/usr/bin/bdrive"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
    install -Dm644 "${srcdir}/beardrive.service" \
        "${pkgdir}/usr/lib/systemd/user/beardrive.service"
    install -Dm644 "${srcdir}/beardrive-remain-after-exit.conf" \
        "${pkgdir}/usr/lib/systemd/user/beardrive.service.d/10-remain-after-exit.conf"

    "${srcdir}/bdrive" completion bash | install -Dm644 /dev/stdin \
        "${pkgdir}/usr/share/bash-completion/completions/bdrive"
    "${srcdir}/bdrive" completion zsh | install -Dm644 /dev/stdin \
        "${pkgdir}/usr/share/zsh/site-functions/_bdrive"
    "${srcdir}/bdrive" completion fish | install -Dm644 /dev/stdin \
        "${pkgdir}/usr/share/fish/vendor_completions.d/bdrive.fish"
}
