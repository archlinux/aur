# Maintainer: czyt <czytcn@gmail.com>

pkgname=ducter-bin
pkgver=0.0.57
pkgrel=1
pkgdesc="Personal AI that dispatches work to coding agents on your own machines and reports back"
arch=('x86_64' 'aarch64')
url="https://ducter.ai"
license=('Apache-2.0')
# `ducter doctor` treats git as a requirement; the AI backends are what it
# hands work to, and are signed in separately by the user.
depends=('git')
optdepends=(
    'claude-code: an AI for tasks to run on, after `claude auth login`'
    'codex: alternative AI backend, after `codex login`'
)
provides=('ducter')
conflicts=('ducter')
# The binary is a Bun single-file executable: the JavaScript bundle is
# appended after the ELF. Stripping rewrites the file and breaks it
# (verified: "error: Script not found"), so it must be left alone.
options=('!strip' '!debug')

_repo="https://github.com/wey-gu/ducter"
_tar_x86_64="ducter-${pkgver}-linux-x64.tar.gz"
_tar_aarch64="ducter-${pkgver}-linux-arm64.tar.gz"
source_x86_64=(
    "${_tar_x86_64}::${_repo}/releases/download/v${pkgver}/${_tar_x86_64}"
    "LICENSE::${_repo}/raw/v${pkgver}/LICENSE"
)
source_aarch64=(
    "${_tar_aarch64}::${_repo}/releases/download/v${pkgver}/${_tar_aarch64}"
    "LICENSE::${_repo}/raw/v${pkgver}/LICENSE"
)
sha256sums_x86_64=('5dc95262b5084a3be5e182177732df6df861bd2f09e80f6c23dcc3f3712b419c'
                   'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_aarch64=('128475dab55f28c641d583a1d772a193652e68bd43a8a3dbb4b2872b651859a0'
                    'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')

package() {
    # Both archives hold a single directory named after the version and
    # architecture; makepkg only fetches the one for $CARCH.
    local _arch="x64"
    [[ "${CARCH}" == "aarch64" ]] && _arch="arm64"
    local _src="${srcdir}/ducter-${pkgver}-linux-${_arch}"

    install -Dm755 "${_src}/ducter" "${pkgdir}/usr/bin/ducter"

    install -Dm644 "${srcdir}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
