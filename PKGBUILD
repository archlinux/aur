# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=codewhale-bin
pkgver=0.10.2
pkgrel=1
# Upstream renamed DeepSeek-TUI → CodeWhale on 2026-05-24 and removed the
# legacy `deepseek`/`deepseek-tui` stub binaries in v0.8.54.
# This package replaces deepseek-tui-bin; `provides` keeps the old names
# satisfied so users with `deepseek` / `deepseek-tui` in dep lists migrate
# cleanly to codewhale-* binaries.
pkgdesc="CodeWhale (formerly DeepSeek-TUI) - DeepSeek-first agentic terminal for open-source coding models"
arch=('x86_64' 'aarch64')
# Upstream moved from Hmbown/CodeWhale to the codewhale-hq organization.
url="https://github.com/codewhale-hq/Codewhale"
license=('MIT')
depends=('glibc' 'gcc-libs' 'dbus')
# The experimental extension host ([features] extension_host) runs the embedded
# TypeScript bundle in Node; Bun is only qualified on macOS.
# Shell commands and extension host code are sandboxed with bubblewrap when
# /usr/bin/bwrap is installed and works; without it they run unsandboxed.
optdepends=('nodejs: run plugins through the experimental extension host'
            'bubblewrap: sandbox shell commands and extension host code')
provides=('codewhale' 'codewhale-tui' 'deepseek' 'deepseek-tui')
conflicts=('codewhale' 'codewhale-tui' 'deepseek' 'deepseek-tui' 'deepseek-tui-bin')
replaces=('deepseek-tui-bin')
options=(!strip)

_relurl="${url}/releases/download/v${pkgver}"

source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/codewhale-hq/Codewhale/v${pkgver}/LICENSE")
sha256sums=('25b5d5a7553af7604772f65aac936540d7e9f5562a9e6a8ca9d02e4f628e9d51')
sha256sums_x86_64=('28ac984a2f145bf99b29933498a3f951a591283c22782933ce933861dda6c70b')
sha256sums_aarch64=('b7c55e36f7ef30c8fae4b8741bfaf9e0177220a9d4d6d3e26650609b4d9ffe90')

# v0.9.5 folded the TUI into the CLI: upstream now uploads one 60 MB binary and
# publishes it under all three release names (codewhale / codewhale-tui /
# codew), byte-identical, with codewhale-tui kept only as a compatibility
# command (crates/cli/src/update.rs refreshes it "from the same binary").
# Fetch it once and symlink the alias instead of shipping the same 60 MB twice.
source_x86_64=("codewhale-${pkgver}-x86_64::${_relurl}/codewhale-linux-x64")
source_aarch64=("codewhale-${pkgver}-aarch64::${_relurl}/codewhale-linux-arm64")


package() {
    install -Dm755 "${srcdir}/codewhale-${pkgver}-${CARCH}" \
        "${pkgdir}/usr/bin/codewhale"
    ln -s codewhale "${pkgdir}/usr/bin/codewhale-tui"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
