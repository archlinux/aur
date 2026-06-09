# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=deepseek-reasonix-tui-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="DeepSeek-Reasonix CLI - Reasonix TUI client for DeepSeek models (terminal UI)"
arch=('x86_64' 'aarch64')
url="https://github.com/esengine/DeepSeek-Reasonix"
license=('MIT')
depends=('glibc' 'gcc-libs')
provides=('deepseek-reasonix-tui' 'reasonix-tui' 'reasonix')
conflicts=('deepseek-reasonix-tui' 'reasonix-tui' 'reasonix')
options=('!strip')

_relurl="https://github.com/esengine/DeepSeek-Reasonix/releases/download/v${pkgver}"

source=("LICENSE::https://raw.githubusercontent.com/esengine/DeepSeek-Reasonix/main-v2/LICENSE")
sha256sums=('SKIP')
sha256sums_x86_64=('7aba5699beded993264244577d5e1c961891539c5a4cd027e9e94a15b229d9b1')
sha256sums_aarch64=('545621fc1b52a619ec9b26f6afef8daf6d0d1a4db2ef55e9916aed95a5bdbaf4')

source_x86_64=(
    "reasonix-${pkgver}-linux-amd64.tar.gz::${_relurl}/reasonix-linux-amd64.tar.gz"
)
source_aarch64=(
    "reasonix-${pkgver}-linux-arm64.tar.gz::${_relurl}/reasonix-linux-arm64.tar.gz"
)

package() {
    # makepkg auto-extracts tar.gz sources into srcdir.
    # The upstream release tarball may contain the binary directly
    # or inside a directory — try the common layouts.
    if [[ -f "${srcdir}/reasonix" ]]; then
        install -Dm755 "${srcdir}/reasonix" "${pkgdir}/usr/bin/reasonix"
    elif [[ -f "${srcdir}/reasonix-${pkgver}/reasonix" ]]; then
        install -Dm755 "${srcdir}/reasonix-${pkgver}/reasonix" \
            "${pkgdir}/usr/bin/reasonix"
    else
        # Fallback: find the first reasonix binary
        local _bin
        _bin=$(find "${srcdir}" -maxdepth 3 -name 'reasonix' -type f 2>/dev/null | head -1)
        if [[ -n "${_bin}" ]]; then
            install -Dm755 "${_bin}" "${pkgdir}/usr/bin/reasonix"
        else
            error "Could not find reasonix binary in ${srcdir}"
            return 1
        fi
    fi

    install -Dm644 "${srcdir}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
