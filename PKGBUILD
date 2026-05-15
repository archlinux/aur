# Maintainer: me02329 <github@martial.aleeas.com>
pkgname=facegate-bin
_pkgname=facegate
pkgver=0.3.1
pkgrel=1
pkgdesc="Native facial authentication for Linux PAM (upstream binary release)"
arch=('x86_64')
url="https://github.com/me02329/facegate"
license=('GPL-3.0-or-later')
depends=('onnxruntime' 'v4l-utils' 'systemd')
optdepends=(
    'bash-completion: shell completions'
    'zsh-completions: shell completions'
)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}" "${_pkgname}-git")
# Upstream binaries are already stripped by `cargo build --release` +
# debian's dh_strip; skip Arch's strip pass and the auto-generated
# -debug package (which would be empty anyway).
options=('!debug' '!strip')
install="${_pkgname}.install"
# We pull the .deb that the upstream Release workflow publishes — it is
# the same payload as the .pkg.tar.zst but without pacman metadata, so we
# install only the file tree and let our own .install hook own the
# user/systemd setup.
source=(
    "${_pkgname}_${pkgver}_amd64.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb"
    "checksums.sha256-v${pkgver}::${url}/releases/download/v${pkgver}/checksums.sha256"
)
# Run `updpkgsums` after bumping pkgver to refresh these. SKIP is a
# placeholder — never publish with SKIP if you care about supply chain.
sha256sums=('16be0bd3e002c1873a658399b73e113dea487b974b9638faf5ca88065664d3bd'
            'eac5315f644056863d8d56664ea6f6963afa241b53b67f465eb7e2f7d3a56656')

package() {
    cd "${srcdir}"
    # Unpack the outer .deb (ar archive) then the inner data tarball.
    bsdtar -xf "${_pkgname}_${pkgver}_amd64.deb"
    bsdtar -xf data.tar.* -C "${pkgdir}"

    # The upstream .deb installs the PAM module under /usr/lib/security/,
    # which is where Arch's pam package looks too, so no relocation is
    # needed. We just strip a couple of files that the Debian package
    # ships but Arch does not want in /usr.
    rm -rf "${pkgdir}/usr/share/doc/${_pkgname}" 2>/dev/null || true
}
