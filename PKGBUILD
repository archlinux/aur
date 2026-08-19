# Maintainer: mcpp-community <speak-agent@users.noreply.github.com>
#
# mcpp-bin — prebuilt release binaries from GitHub, the same artifacts the
# upstream `install.sh` one-liner downloads. See scripts/aur/README.md for
# how this is published to the AUR and how to bump it (scripts/aur/update.sh).

pkgname=mcpp-bin
pkgver=2026.8.19.4
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
sha256sums_x86_64=('6f6ddec523daeff5a3fe94648b55796826af485296b0d417d982304b27484e8e')
sha256sums_aarch64=('3d5a2c114ab65a8ab2e5f2194e473c8d329e94591dedabcdd0bf95d798496e8f')

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
