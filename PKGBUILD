# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=deepseek-reasonix-tui-bin
pkgver=1.25.1
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

source=()
sha256sums_x86_64=('b6806b8cda3f031ebfc0426aedc6ebc6d01421662d144007e4343be183f10609')
sha256sums_aarch64=('bd6d288a293166c173f817d702fa7ddd5ac46433bb017f2cbb425742e8baa77d')

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

}
