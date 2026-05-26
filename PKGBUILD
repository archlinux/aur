# Maintainer: arthurwhitlock <codewithillusion@gmail.com>
pkgname=ethereal-appimage
pkgver=1.4.8
pkgrel=1
pkgdesc="Focus timer with workspace enforcement and friend presence"
arch=('x86_64')
url="https://github.com/quetrea/ethereal-releases"
license=('MIT')
depends=('hicolor-icon-theme' 'fuse2')
options=('!strip')

# Note: on hardened kernels that restrict user namespaces (some CachyOS configs),
# run with: ethereal --appimage-extract-and-run

# Release tag format: v${pkgver}+${_buildnum}  (e.g. v1.4.8+33)
# GitHub requires + URL-encoded as %2B in release asset URLs.
# Asset filenames use semver only (no +N suffix).
_buildnum=33
_tagver="v${pkgver}%2B${_buildnum}"
_baseurl="https://github.com/quetrea/ethereal-releases/releases/download/${_tagver}"

# Bootstrap note (v1.4.8+33 only): LICENSE is not in the v1.4.8 tar.gz.
# It was added to build-release.sh after this release (commit 051f0e9).
# For this bootstrap version, LICENSE is a local file committed alongside PKGBUILD.
# Starting with v1.4.9+:
#   - Remove "LICENSE" from source array
#   - Change the install line in package() to:
#       install -Dm644 "${_pkgdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
source=(
    "LICENSE"
    "Ethereal-${pkgver}-x86_64.AppImage::${_baseurl}/Ethereal-${pkgver}-x86_64.AppImage"
    "ethereal-${pkgver}-linux-x86_64.tar.gz::${_baseurl}/ethereal-${pkgver}-linux-x86_64.tar.gz"
)
sha256sums=('3644a4f9ab28a1a83a93a10ebcd388308e193c15f7ca5890ba7412496db7073c'
            '38b1f28252ba2a8ca9d7408e51a55ad7643fbe69eba2f2eca1fcbbc23f29edf2'
            '21a0dc5c2563bf4760d1597c57b3e1d28c063a4168a3420b573b3edf7f5d4c8a')

package() {
    local _pkgdir="ethereal-${pkgver}-linux-x86_64"

    # --- AppImage ---
    install -Dm755 "Ethereal-${pkgver}-x86_64.AppImage" \
        "${pkgdir}/opt/ethereal/Ethereal.AppImage"

    # Symlink to /usr/bin (NOT ~/.local/bin — AUR packages must not write to $HOME)
    install -dm755 "${pkgdir}/usr/bin"
    ln -sf /opt/ethereal/Ethereal.AppImage "${pkgdir}/usr/bin/ethereal"

    # --- License ---
    # Bootstrap: local file. For v1.4.9+, use "${_pkgdir}/LICENSE" instead.
    install -Dm644 LICENSE \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # --- Polkit policies (extracted from tar.gz) ---
    install -Dm644 "${_pkgdir}/polkit/app.ethereal.hosts.policy" \
        "${pkgdir}/usr/share/polkit-1/actions/app.ethereal.hosts.policy"
    install -Dm644 "${_pkgdir}/polkit/app.ethereal.workspace.bypass.policy" \
        "${pkgdir}/usr/share/polkit-1/actions/app.ethereal.workspace.bypass.policy"
    install -Dm644 "${_pkgdir}/polkit/app.ethereal.netguard.policy" \
        "${pkgdir}/usr/share/polkit-1/actions/app.ethereal.netguard.policy"

    # --- Icon (128px from tar.gz) ---
    install -Dm644 "${_pkgdir}/icons/com.ethereal.Ethereal-128.png" \
        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/com.ethereal.Ethereal.png"

    # --- Desktop entry (from tar.gz, Exec line patched to absolute path) ---
    # Use canonical reverse-DNS filename to match upstream and avoid duplicate
    # launcher entries alongside any pre-existing com.ethereal.Ethereal.desktop.
    install -Dm644 "${_pkgdir}/com.ethereal.Ethereal.desktop" \
        "${pkgdir}/usr/share/applications/com.ethereal.Ethereal.desktop"
    sed -i 's|^Exec=.*|Exec=/opt/ethereal/Ethereal.AppImage|' \
        "${pkgdir}/usr/share/applications/com.ethereal.Ethereal.desktop"

    # --- netguardd systemd service: NOT installed in this PKGBUILD ---
    # The service file references binary paths under the AppImage mount point
    # or tar.gz layout, which differ from where this AUR package places things.
    # Including the unpatched service file would produce a broken unit.
    # See post_install for manual setup instructions.
}

post_install() {
    echo ""
    echo "  Ethereal installed."
    echo "  Run: ethereal"
    echo ""
    echo "  Polkit policies are active — enforcement features work on first run."
    echo ""
    echo "  Website blocking (nftables/netguardd) is NOT automatically configured."
    echo "  The netguardd systemd service is not installed by this package."
    echo "  For manual setup, see:"
    echo "  https://github.com/quetrea/ethereal#linux-polkit-setup"
    echo ""
}

post_upgrade() {
    post_install
}
