# Maintainer: mcpp-community <speak-agent@users.noreply.github.com>
#
# mcpp-bin — prebuilt release binaries from GitHub, the same artifacts the
# upstream `install.sh` one-liner downloads. See scripts/aur/README.md for
# how this is published to the AUR and how to bump it (scripts/aur/update.sh).

pkgname=mcpp-bin
pkgver=2026.9.29.2
pkgrel=1
pkgdesc="Modern C++ build & package management tool (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/mcpp-community/mcpp"
license=('Apache-2.0')
# mcpp/xlings are statically linked; git is used for package-index sync.
depends=('git')
# mcpp-m = same tool (mutually exclusive); mcpp = Matsui's C preprocessor
# (extra/mcpp), which also owns /usr/bin/mcpp. No `provides=mcpp` — that name
# is the preprocessor, not us.
conflicts=('mcpp-m' 'mcpp')
# Prebuilt upstream binaries — do not strip/repackage them.
options=('!strip')

_relbase="https://github.com/mcpp-community/mcpp/releases/download/v${pkgver}"

source_x86_64=("mcpp-${pkgver}-linux-x86_64.tar.gz::${_relbase}/mcpp-${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("mcpp-${pkgver}-linux-aarch64.tar.gz::${_relbase}/mcpp-${pkgver}-linux-aarch64.tar.gz")
# Shared, arch-independent local file (the per-user launcher).
source=("mcpp.sh")

sha256sums=('SKIP')
sha256sums_x86_64=('58263fa09edf16ed09f1613b12522f6c4a9229cbe21a7a5a590bd64467a02227')
sha256sums_aarch64=('a629a1dc36aa0671c36fff7ec395997756c8ceee84e3dad975f1940a59c500b3')

package() {
    local _src="${srcdir}/mcpp-${pkgver}-linux-${CARCH}"

    # Self-contained tree, read-only and shared by all users, under /opt.
    # Ship only the two binaries the runtime needs:
    #   bin/mcpp              — the static mcpp executable
    #   registry/bin/xlings   — bundled xlings, seeded per-user via the wrapper
    install -Dm755 "${_src}/bin/mcpp"            "${pkgdir}/opt/mcpp/bin/mcpp"
    install -Dm755 "${_src}/registry/bin/xlings" "${pkgdir}/opt/mcpp/registry/bin/xlings"

    # Per-user launcher on PATH (sets MCPP_HOME / MCPP_VENDORED_XLINGS).
    install -Dm755 "${srcdir}/mcpp.sh" "${pkgdir}/usr/bin/mcpp"

    install -Dm644 "${_src}/LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${_src}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
