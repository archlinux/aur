# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=codewhale-bin
pkgver=0.9.13
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
sha256sums=('25b5d5a7553af7604772f65aac936540d7e9f5562a9e6a8ca9d02e4f628e9d51')
sha256sums_x86_64=('593ae256756f969ea9f550e8733303abc85cd3ee0dd2c0899f4a76df7103fe7e')
sha256sums_aarch64=('0605271d2a343b241232966ec7ca11cf93170289d05a85ad1c513116be77307d')

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
