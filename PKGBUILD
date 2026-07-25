# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=deepseek-reasonix-tui-bin
pkgver=1.17.20
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
sha256sums=()
sha256sums_x86_64=('cdd8371a9fe4aec787282e3ead94a6d90e6be4af6b02f016ec98258afe9a2420')
sha256sums_aarch64=('1dd48d027080e684e3aa0ad9fba7950de21cdf39a531ba16ad1c2c359efbb1a1')

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
