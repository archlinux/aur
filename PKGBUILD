# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=codewhale-bin
pkgver=0.9.7
pkgrel=1
# Upstream renamed DeepSeek-TUI → CodeWhale on 2026-05-24 and removed the
# legacy `deepseek`/`deepseek-tui` stub binaries in v0.8.54.
# This package replaces deepseek-tui-bin; `provides` keeps the old names
# satisfied so users with `deepseek` / `deepseek-tui` in dep lists migrate
# cleanly to codewhale-* binaries.
pkgdesc="CodeWhale (formerly DeepSeek-TUI) - DeepSeek-first agentic terminal for open-source coding models"
arch=('x86_64' 'aarch64')
url="https://github.com/Hmbown/CodeWhale"
license=('MIT')
depends=('glibc' 'gcc-libs' 'dbus')
provides=('codewhale' 'codewhale-tui' 'deepseek' 'deepseek-tui')
conflicts=('codewhale' 'codewhale-tui' 'deepseek' 'deepseek-tui' 'deepseek-tui-bin')
replaces=('deepseek-tui-bin')
options=(!strip)

_relurl="https://github.com/Hmbown/CodeWhale/releases/download/v${pkgver}"

source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/Hmbown/CodeWhale/v${pkgver}/LICENSE")
sha256sums=('91873e17f073f4dcddc63799a0a6fdeb44a281440b6c5e0b9d8ea2aa7f7ffd95')
sha256sums_x86_64=('74bcfb52b5b513fae608adbb8ed3d0303ef02714cc7836f5b7fd4704a2039891')
sha256sums_aarch64=('a4104e097920540a76b824050b14bdb07eb8347da26069e3c34388e3178efb13')

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
