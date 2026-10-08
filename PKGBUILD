# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=codewhale-bin
pkgver=0.10.1
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
provides=('codewhale' 'codewhale-tui' 'deepseek' 'deepseek-tui')
conflicts=('codewhale' 'codewhale-tui' 'deepseek' 'deepseek-tui' 'deepseek-tui-bin')
replaces=('deepseek-tui-bin')
options=(!strip)

_relurl="${url}/releases/download/v${pkgver}"

source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/codewhale-hq/Codewhale/v${pkgver}/LICENSE")
sha256sums=('25b5d5a7553af7604772f65aac936540d7e9f5562a9e6a8ca9d02e4f628e9d51')
sha256sums_x86_64=('ed2d83b3853de803ee39f574c745d1e1c9f6f8bf99ed3aec3835425e0c26993b')
sha256sums_aarch64=('efe702a5083fe78a7e09676b129dedba4f595a12b4c824c7f1a794da9ca6d6da')

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
