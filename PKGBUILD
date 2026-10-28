pkgname=termius-deb
pkgver=10.2.1
pkgrel=1
pkgdesc='Desktop SSH Client'
arch=('x86_64')
url='https://www.termius.com/'
license=('custom')
conflicts=('termius')
depends=('alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'gcc-libs'
         'glib2' 'glibc' 'gtk3' 'libcups' 'libdrm' 'libnotify' 'libsecret'
         'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes'
         'libxkbcommon' 'libxrandr' 'libxss' 'libxtst' 'mesa' 'nspr' 'nss'
         'pango' 'systemd-libs' 'util-linux-libs' 'xdg-utils')
optdepends=('libappindicator-gtk3: system tray integration'
            'org.freedesktop.secrets: credential storage service')
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}-amd64.deb::https://deb.termius.com/pool/main/t/termius-app/termius-app_${pkgver}_amd64.deb"
        'termius.desktop'
        'tos.html')
sha256sums=('e24024d7d13c39bed9a9dfd97d8cb8718cd275ce0ccc9d3e084b6726f5b53078'
            'd97e5258351d06107a0d0816542841d1d61609c0308a5074695dc5c5de0a6268'
            '51978a30942b337918e18690f9c93dc28eb06d54eafc21bb6b29e6ef428083cb')

prepare() {
    mkdir -p "${srcdir}/upstream"
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${srcdir}/upstream"
    test -x "${srcdir}/upstream/opt/Termius/termius-app"
    test -f "${srcdir}/upstream/opt/Termius/chrome-sandbox"
}

package() {
    install -d "${pkgdir}/opt" "${pkgdir}/usr/bin"
    cp -a --reflink=never "${srcdir}/upstream/opt/Termius" "${pkgdir}/opt/termius"

    chmod 755 "${pkgdir}/opt/termius/termius-app"
    chmod 755 "${pkgdir}/opt/termius/chrome_crashpad_handler"
    chmod 4755 "${pkgdir}/opt/termius/chrome-sandbox"
    ln -s /opt/termius/termius-app "${pkgdir}/usr/bin/termius"

    install -Dm644 "${srcdir}/termius.desktop" \
        "${pkgdir}/usr/share/applications/termius.desktop"
    local icon size
    for icon in "${srcdir}"/upstream/usr/share/icons/hicolor/*/apps/termius-app.png; do
        size=${icon%/apps/*}
        size=${size##*/}
        install -Dm644 "$icon" \
            "${pkgdir}/usr/share/icons/hicolor/${size}/apps/termius.png"
    done
    install -Dm644 "${srcdir}/tos.html" \
        "${pkgdir}/usr/share/licenses/${pkgname}/tos.html"
    install -Dm644 "${srcdir}/upstream/opt/Termius/LICENSE.electron.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
}
