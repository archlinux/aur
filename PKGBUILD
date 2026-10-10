# Maintainer: fr0stb1rd <fr0stb1rd@proton.me>
# Old Maintainer: iamawacko <iamawacko@protonmail.com>
# Contributor: Trevor Bergeron <mal@sec.gd>
# Upstream: https://git.openprivacy.ca/cwtch.im/cwtch-ui/releases

_pkgname=cwtch
pkgname=$_pkgname-bin
pkgver=1.17.2
pkgrel=1
pkgdesc="Decentralized, privacy-preserving, multi-party messaging protocol client (binary distribution)"
arch=('x86_64')
url='https://cwtch.im'
license=('MIT')
provides=('cwtch')
conflicts=('cwtch' 'cwtch-git' 'libcwtch-go')
depends=('gtk3' 'hicolor-icon-theme' 'tor')
optdepends=('tor: use system tor instead of bundled (required by upstream deb)')
options=('!strip')
source_x86_64=("https://git.openprivacy.ca/$_pkgname.im/$_pkgname-ui/releases/download/v$pkgver/cwtch-${pkgver}_amd64.deb")
sha256sums_x86_64=('fc696cf2880738bab2ab9aaa0c871b1f134ed337d0f50c51da7cfb94be19daaf')

package() {
    # .deb is an ar archive: debian-binary + control.tar.xz + data.tar.xz.
    # Only data.tar.xz (the /usr tree) is needed.
    cd "$srcdir"
    bsdtar -xf "cwtch-${pkgver}_amd64.deb" data.tar.xz
    bsdtar -xf data.tar.xz -C "$pkgdir"

    # Upstream templates expand PREFIX=/usr/ with trailing slash -> "/usr//bin".
    # Harmless, but normalize to single slash.
    sed -i 's|/usr//|/usr/|g' "$pkgdir/usr/bin/cwtch" "$pkgdir/usr/share/applications/cwtch.desktop"
}
