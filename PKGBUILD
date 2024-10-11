# Maintainer: Chris Speck  <chris.speck(at)annalise(dot)ai>

pkgname=slack-desktop-wayland
_original_pkgname=slack-desktop
pkgver=4.40.128
pkgrel=1
pkgdesc="Slack Desktop (Beta) for Linux with Wayland Support"
arch=('x86_64')
url="https://slack.com/downloads"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'pipewire' 'xdg-utils' 'xdg-desktop-portal')
optdepends=('libappindicator-gtk3: Systray indicator support'
    'org.freedesktop.secrets: Keyring password store support'
    'xdg-desktop-portal-gnome: xdg-desktop-portal support for GNOME'
    'xdg-desktop-portal-gtk: xdg-desktop-portal support for GNOME and GTK'
    'xdg-desktop-portal-kde: xdg-desktop-portal support for KDE'
    'xdg-desktop-portal-lxqt: xdg-desktop-portal support for LXQt'
    'xdg-desktop-portal-wlr: xdg-desktop-portal support for wlroots-based Wayland compositors'
)
source=(
    "https://downloads.slack-edge.com/desktop-releases/linux/x64/${pkgver}/${_original_pkgname}-${pkgver}-amd64.deb"
    "${_original_pkgname}.patch"
)
noextract=("${_original_pkgname}-${pkgver}-amd64.deb")
b2sums=('5fb6a8889ff5246e11a837849e87c4cbf711642650864d340ebc3dc70abc622489913a5e5a2258475c13d10c5bdcf49d6dcfbde8868bd88e7880b4e44591e109'
        'e257ce4fce28ea970b1dedef1c5cacac53c630ca1ace16de4efa1edf024b022f20532fce7b0a95565420a33c85b40e4636e3b2d78251a8a67a1bae29bd7011df')
provides=('slack-desktop')
conflicts=('slack-desktop' 'slack-electron')

package() {
    bsdtar -O -xf "slack-desktop-${pkgver}"*.deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

    # Fix hardcoded icon path in .desktop file
    patch -d "${pkgdir}" -p1 <"${_original_pkgname}".patch

    # Permission fix
    find "${pkgdir}" -type d -exec chmod 755 {} +

    # Remove all unnecessary stuff
    rm -rf "${pkgdir}/etc"
    rm -rf "${pkgdir}/usr/lib/slack/src"
    rm -rf "${pkgdir}/usr/share/lintian"
    rm -rf "${pkgdir}/usr/share/doc"

    # Move license
    install -dm755 "${pkgdir}/usr/share/licenses/${_original_pkgname}"
    mv "${pkgdir}/usr/lib/slack/LICENSE" "${pkgdir}/usr/share/licenses/${_original_pkgname}"
    ln -s "/usr/share/licenses/${_original_pkgname}/LICENSE" "${pkgdir}/usr/lib/slack/LICENSE"

    # patch the asar file to fix/enable pipewire
    # see https://github.com/flathub/com.slack.Slack/issues/101#issuecomment-1807073763
    sed -i -e 's/,"WebRTCPipeWireCapturer"/,"_ebRTCPipeWireCapturer"/' "${pkgdir}/usr/lib/slack/resources/app.asar"
}
