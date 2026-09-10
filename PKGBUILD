# Maintainer: Nitin Shankar Madhu <nitin@jaseci.org>
# A binary package for the self-contained native `jac` tool from Jaseci.
# This follows the same install path as the upstream installer:
#   curl -fsSL https://raw.githubusercontent.com/jaseci-labs/jaseci/main/scripts/install.sh | bash
# but installs the prebuilt binary to /usr/bin instead of ~/.local/bin.

pkgname=jaclang
pkgver=0.37.11
pkgrel=1
pkgdesc="The Jac programming language"
arch=('x86_64' 'aarch64')
url="https://github.com/jaseci-labs/jaseci"
license=('MIT')
provides=('jac' 'jac-bin')
conflicts=('jac' 'jac-bin')
options=('!strip')  # upstream binary may already be stripped; avoid unnecessary work

# One source per architecture. The asset name carries the jaclang version,
# which currently matches the release tag but is allowed to diverge upstream.
source_x86_64=("jac-${pkgver}-linux-x86_64::${url}/releases/download/v${pkgver}/jac-${pkgver}-linux-x86_64")
source_aarch64=("jac-${pkgver}-linux-aarch64::${url}/releases/download/v${pkgver}/jac-${pkgver}-linux-aarch64")

# sha256 from the release's .sha256 sidecars (https://.../<asset>.sha256)
sha256sums_x86_64=('e6502788ab8b6bd668c8535895e5a51715f0b0840cb21a96bf0bca5ed9b7f4ac')
sha256sums_aarch64=('2a7ecaec4df5a03220003144e02058ba3dceb5eec76c3ff46737b75996ed3219')

package() {
    # makepkg downloads exactly one architecture-specific asset; find it.
    local asset
    for asset in "jac-${pkgver}-linux-x86_64" "jac-${pkgver}-linux-aarch64"; do
        if [[ -f "${srcdir}/${asset}" ]]; then
            install -Dm755 "${srcdir}/${asset}" "${pkgdir}/usr/bin/jac"
            return
        fi
    done
    error "No jac binary asset found in srcdir for arch ${CARCH}"
    return 1
}
