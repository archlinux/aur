# Maintainer: Chris Speck  <chris.speck(at)annalise(dot)ai>

pkgname=slack-desktop-wayland
_original_pkgname=slack-desktop
pkgver=4.36.134
pkgrel=2
pkgdesc="Slack Desktop (Beta) for Linux with Wayland Support"
arch=('x86_64')
url="https://slack.com/downloads"
license=('custom')
depends=(
    'electron'
    'gtk3'
    'libsecret'
    'libxss'
    'nss'
    'pipewire'
    'xdg-desktop-portal'
    'xdg-utils'
)
optdepends=(
    'libappindicator-gtk3: Systray indicator support'
    'org.freedesktop.secrets: Keyring password store support'
    'xdg-desktop-portal-gnome: xdg-desktop-portal support for GNOME'
    'xdg-desktop-portal-gtk: xdg-desktop-portal support for GNOME and GTK'
    'xdg-desktop-portal-kde: xdg-desktop-portal support for KDE'
    'xdg-desktop-portal-lxqt: xdg-desktop-portal support for LXQt'
    'xdg-desktop-portal-wlr: xdg-desktop-portal support for wlroots-based Wayland compositors'
)

source=(
    "$pkgname-$pkgver.deb::https://downloads.slack-edge.com/releases/linux/$pkgver/prod/x64/slack-desktop-$pkgver-amd64.deb"
    'slack.sh'
)

noextract=("${_original_pkgname}-${pkgver}-amd64.deb")
b2sums=('d24e5ad17c4a340bf57c341e67f31d515cc516277fab021e9a7dd2deea02464230aacb72dff56af971df2f5d08ba2881694a9faa559a70bb53ad7d3edb944a1f'
        '67beffd735db6b2d9067e0a14a8bca47deb70535b5eb1ec4727a1398d2e34fbbb23eb16b377d7b22eff7ecb3e5dbcada31f412f703c673db62b7886db710a150')
provides=('slack-desktop')
conflicts=('slack-desktop' 'slack-electron')

prepare() {
    bsdtar -xf data.tar.xz

    # Enable slack silent mode and fix icon
    sed -ri \
        -e 's|^(Exec=.+/slack)(.+)|\1 -s\2|' \
        -e 's/^Icon=.+slack\.png/Icon=slack/' \
        "usr/share/applications/slack.desktop"

    # patch the asar file to fix/enable pipewire
    # see https://github.com/flathub/com.slack.Slack/issues/101#issuecomment-1807073763
    sed -i -e 's/,"WebRTCPipeWireCapturer"/,"_ebRTCPipeWireCapturer"/' usr/lib/slack/resources/app.asar
}

package() {
    install -Dv "slack.sh" "$pkgdir/usr/bin/slack"
    install -dv "$pkgdir/usr/lib/slack/"
    cp -av --no-preserve=ownership usr/lib/slack/resources/* "$pkgdir/usr/lib/slack/"
    install -Dvm644 "usr/share/applications/slack.desktop" -t "$pkgdir/usr/share/applications"
    install -Dvm644 "usr/share/pixmaps/slack.png" -t "$pkgdir/usr/share/pixmaps"
    install -Dvm644 "usr/lib/slack/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
