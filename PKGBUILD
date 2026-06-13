# Maintainer: Tristan <https://github.com/techtoboggan>
#
# This is the AUR-published PKGBUILD (claude-desktop-hardened-bin). Unlike
# packaging/arch/PKGBUILD.in — which our CI uses to BUILD the package from a
# locally-staged tree — this one is self-contained: it downloads the prebuilt
# Arch package from the GitHub release and installs its payload. That makes
# `makepkg`/`yay` work standalone for end users (see issue #5).
#
# 1.12603.1, pkgrel, and 75a0a08dee0ea50ccddd3e3f2e11788a04ed650003b14e0e6e6bb0e01c14f9f7 are substituted by the publish-aur
# CI step before this is pushed to the AUR.
pkgname=claude-desktop-hardened-bin
pkgver=1.12603.1
pkgrel=6
pkgdesc="Claude Desktop for Linux (hardened) — bubblewrap sandboxing, credential redaction"
arch=('x86_64')
url="https://github.com/techtoboggan/claude-desktop-hardened-linux"
license=('custom:Proprietary')
depends=('nodejs' 'npm' 'electron' 'p7zip' 'icoutils' 'imagemagick' 'xdg-utils' 'bubblewrap')
optdepends=(            'socat: IPC support'
            'gnome-keyring: credential storage'
            'wmctrl: X11 window listing for Computer Use'
            'xdotool: X11 input automation for Computer Use'
            'scrot: X11 screenshot capture for Computer Use'
            'xclip: X11 clipboard access for Computer Use'
            'xorg-xrandr: X11 display info for Computer Use'
            'grim: Wayland screenshot capture for Computer Use'
            'slurp: Wayland region selection for Computer Use'
            'wl-clipboard: Wayland clipboard access for Computer Use'
            'ydotool: Wayland input automation for Computer Use (run: sudo systemctl enable --now ydotool)'
            'wlr-randr: Wayland display info for Computer Use')
provides=('claude-desktop' 'claude-desktop-hardened')
conflicts=('claude-desktop' 'claude-desktop-bin' 'claude-desktop-hardened')
# Don't strip or compress — the payload is already a built, signed-sandbox
# Electron tree; touching it would break chrome-sandbox.
options=('!strip' '!debug')

# The release asset IS a prebuilt Arch package. We fetch it and unpack only
# its payload (usr/) in package(); noextract stops makepkg from auto-unpacking
# it (which would also dump .PKGINFO/.MTREE into srcdir).
#
# claude-desktop-hardened-bin-1.12603.1-1-x86_64.pkg.tar.zst (the exact asset filename) and v1.12603.1-6 (the release tag) are
# substituted by publish-aur from the actual release — NOT reconstructed
# from pkgver/pkgrel. They diverge: the AUR pkgrel tracks the release build
# number (e.g. 4), but the artifact's own filename carries the CI-internal
# pkgrel which is always 1 (claude-desktop-hardened-bin-<ver>-1-x86_64...),
# and the download path uses the release tag (v<ver>-4). Discovering both
# avoids guessing.
_pkgfile="claude-desktop-hardened-bin-1.12603.1-1-x86_64.pkg.tar.zst"
source=("${_pkgfile}::${url}/releases/download/v1.12603.1-6/${_pkgfile}")
noextract=("${_pkgfile}")
sha256sums=('75a0a08dee0ea50ccddd3e3f2e11788a04ed650003b14e0e6e6bb0e01c14f9f7')

package() {
    # Extract just the filesystem payload from the prebuilt package.
    bsdtar -xf "${srcdir}/${_pkgfile}" -C "${pkgdir}" usr

    # Ensure chrome-sandbox keeps its setuid bit (extraction preserves mode,
    # but re-assert it defensively).
    local sandbox="${pkgdir}/usr/lib/claude-desktop-hardened/app.asar.unpacked/node_modules/electron/dist/chrome-sandbox"
    if [ -f "$sandbox" ]; then
        chmod 4755 "$sandbox"
    fi
}
