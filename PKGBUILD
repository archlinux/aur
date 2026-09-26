# Maintainer: mcpp-community <speak-agent@users.noreply.github.com>
#
# mcpp-bin — prebuilt release binaries from GitHub, the same artifacts the
# upstream `install.sh` one-liner downloads. See scripts/aur/README.md for
# how this is published to the AUR and how to bump it (scripts/aur/update.sh).

pkgname=mcpp-bin
pkgver=2026.9.26.2
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
sha256sums_x86_64=('9040e0c1bc64b1185582555ffd0c098f83602369b2dc034e9c61c33608a8c4bf')
sha256sums_aarch64=('2f5c3edc43eab41edead1fdc783d1bd4c4b8a0b4be8a131429a3747b250bf981')

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
