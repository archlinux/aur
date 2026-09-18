# Maintainer: musqz <gummy-fang-deputy@duck.com>
# Based on enpass-bin from the AUR

pkgname='enpass-x11-bin'
_pkgname='enpass'
pkgver=6.12.6.2255
pkgrel=1
pkgdesc='A multiplatform password manager (X11 build from the upstream x11 channel)'
arch=('x86_64')
url='https://www.enpass.io/'
# Full terms: https://www.enpass.io/terms-of-use/ (vendor prohibits redistributing the text,
# so no license file is shipped)
license=('custom')
depends=('libxss' 'lsof' 'curl' 'libxkbcommon-x11' 'libxcb' 'xcb-util-wm'
         'xcb-util-image' 'xcb-util-keysyms' 'xcb-util-renderutil' 'gtk3' 'glib2'
         'dbus' 'freetype2' 'fontconfig' 'pango' 'gdk-pixbuf2' 'xcb-util-cursor'
         'libsm' 'libice' 'libglvnd' 'hicolor-icon-theme')
optdepends=('libxdg-basedir: Open links in the default browser.'
            'libqtxdg: Open links in the default browser (Qt implementation)')
provides=("${_pkgname}")
conflicts=("${_pkgname}" 'enpass-bin')
install="${pkgname}.install"
source=("https://apt.enpass.io/pool/main/e/enpass/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('716fbae54d52ccd807a6bd53f4cf2d359f6c7f0892ad8491f3a1bf5d8d37b099')

# Disable strip as otherwise the browser extension will not work
options=('!strip')

# Upstream x11 channel index (for checking new versions):
# https://apt.enpass.io/dists/x11/main/binary-amd64/Packages

package() {
    # Extract data (handles gz/xz/zst)
    tar xf "${srcdir}"/data.tar.* -C "${pkgdir}"

    # Upstream .deb embeds non-root ownership on extracted files; correct it
    chown -R root:root "${pkgdir}"

    # Match default system permissions
    chmod -R go-w "${pkgdir}/opt/"
    chmod 755 "${pkgdir}/opt/"
    find "${pkgdir}/usr/" -type d -exec chmod 755 {} \;

    # CLI launcher
    mkdir -p "${pkgdir}/usr/bin"
    ln -s '/opt/enpass/Enpass' "${pkgdir}/usr/bin/enpass"
}

# vim: set syntax=sh:
