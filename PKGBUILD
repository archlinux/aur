# Maintainer: Nitin Shankar Madhu <nitin@jaseci.org>
# A binary package for the self-contained native `jac` tool from Jaseci.
# This follows the same install path as the upstream installer:
#   curl -fsSL https://raw.githubusercontent.com/jaseci-labs/jaseci/main/scripts/install.sh | bash
# but installs the prebuilt binary to /usr/bin instead of ~/.local/bin.

pkgname=jaclang
pkgver=0.38.2
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
sha256sums_x86_64=('c712b056820f67e3035d962a547c7eaea1908a497b63b4b89093fecb9b533ed4')
sha256sums_aarch64=('9294212ec6ad6e8d2b772f535344e190484b2a53751cc1576218e0f09c13d40f')

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
