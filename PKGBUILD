# Maintainer: Felix Stubner <felix.stubner@gmail.com>
#
# These values are a template, not what users install.
#
# publish.yml's `aur-gui` job renders this file on every release; the
# sha256sums lines below hold placeholder names rather than real-looking
# digests, and the render step refuses to push a file with one left in it.
# See the sibling packaging/aur/PKGBUILD for the full reasoning, including
# why the literal marker must stay out of these comments.
#
# Sibling package to netscli-bin (the CLI/TUI). Ships the Tauri desktop
# app as a self-contained .AppImage rather than the .deb, since pacman
# users typically prefer not to depend on dpkg/Debian conventions for
# system integration.

pkgname=netscli-gui-bin
_appname=netscli-gui
pkgver=0.3.1
pkgrel=1
pkgdesc="NetsCLI desktop app for reviewing network scans, DNS, ARP, and local inventory"
arch=('x86_64')
url="https://netscli.com"
license=('MIT')
provides=("${_appname}")
conflicts=("${_appname}")
# Tauri 2 GTK3 backend — same depends as the upstream Tauri AppImage
# expects on the host (webkit2gtk-4.1, gtk3, ayatana-appindicator).
# AppImage is largely self-contained but these are the runtime libs
# Tauri's window manager needs that aren't always pre-installed.
depends=('gcc-libs' 'glibc' 'webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator')
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/fstubner/netscli/v${pkgver}/LICENSE"
        "${_appname}.png::https://raw.githubusercontent.com/fstubner/netscli/v${pkgver}/apps/netscli-gui/src-tauri/icons/128x128.png")
source_x86_64=("${pkgname}-${pkgver}.AppImage::https://github.com/fstubner/netscli/releases/download/v${pkgver}/netscli-gui-linux-x86_64.AppImage")
sha256sums=(6f035a96b0da6e99589b2a1656f59bee8c6519686d8a94627301e074746041d3 021f1d939fe496033ef90a47d29e7a1bd11ea83cfe0ffc445cb5b88418240882)
sha256sums_x86_64=('f583839440358296bfe05949826c34c2a133e1df836101626c41fe39a6dddec2')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" \
    "${pkgdir}/usr/bin/${_appname}"
  install -Dm644 "${srcdir}/${_appname}.png" \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_appname}.png"
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${_appname}.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=NetsCLI
Comment=Review network scans, DNS, ARP, and local inventory
Exec=${_appname}
Icon=${_appname}
Terminal=false
Categories=Network;Utility;
StartupWMClass=NetsCLI
EOF
  install -Dm644 "${srcdir}/LICENSE-${pkgver}" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
