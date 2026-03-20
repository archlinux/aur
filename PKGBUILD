# Maintainer: Felipe Pires Morandini <felipepiresmorandini@gmail.com>
# https://github.com/felipemorandini/smartlog

pkgname=smartlog-bin
pkgver=0.6.3
pkgrel=1
pkgdesc="A high-performance TUI for log tailing with JSON auto-detection and real-time filtering"
arch=('x86_64' 'aarch64')
url="https://github.com/felipemorandini/smartlog"
license=('MIT')
provides=('smartlog')
conflicts=('smartlog')

source_x86_64=("${url}/releases/download/v${pkgver}/smartlog-x86_64-unknown-linux-musl.tar.gz"
               "${url}/raw/v${pkgver}/LICENSE")
source_aarch64=("${url}/releases/download/v${pkgver}/smartlog-aarch64-unknown-linux-musl.tar.gz"
                "${url}/raw/v${pkgver}/LICENSE")

sha256sums_x86_64=('9e4908d9f50c922864a7ddcb103b60a67795863652d53874f1e31fb720703056' 'f6074ff849dc5ec6ac8e7b8cf8b9a5f92c3cf459bedb1927a0c29345e1831945')
sha256sums_aarch64=('7acfc17a82eb4f5903cef69ef891c3b62267575d75a7a920d3f5f1a5dd25fdc1' 'f6074ff849dc5ec6ac8e7b8cf8b9a5f92c3cf459bedb1927a0c29345e1831945')

package() {
    install -Dm755 smartlog "${pkgdir}/usr/bin/smartlog"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Generate and install shell completions
    "${srcdir}/smartlog" completions bash > smartlog.bash || echo "WARNING: bash completions generation failed"
    "${srcdir}/smartlog" completions zsh > _smartlog || echo "WARNING: zsh completions generation failed"
    "${srcdir}/smartlog" completions fish > smartlog.fish || echo "WARNING: fish completions generation failed"

    if [ -s smartlog.bash ]; then
        install -Dm644 smartlog.bash "${pkgdir}/usr/share/bash-completion/completions/smartlog"
    fi
    if [ -s _smartlog ]; then
        install -Dm644 _smartlog "${pkgdir}/usr/share/zsh/site-functions/_smartlog"
    fi
    if [ -s smartlog.fish ]; then
        install -Dm644 smartlog.fish "${pkgdir}/usr/share/fish/vendor_completions.d/smartlog.fish"
    fi
}
