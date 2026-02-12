# Maintainer: Folf <folf@folf.me>

pkgname=osmium
pkgver=0.0.7
pkgrel=1
pkgdesc="A globally distributed community messaging and voice/video platform"
arch=('x86_64')
url='https://osmium.chat/'
license=('custom')
depends=('alsa-lib' 'gtk3' 'libnotify' 'libxss' 'nspr' 'nss')
optdepends=(
    'libpulse: Pulseaudio support'
    'xdg-utils: Open files'
)
options=('!strip')
_pkgver=0.0.7
_suffix=alpha
source=("https://updater.osmium.chat/Osmium-${_pkgver}-${_suffix}-x64.tar.gz")
sha512sums=('601a57ad61e992ec1c6eb2be02bfc3b0ebad557ea91fe2bd03419541c945d02f3f1c90d0ca0e51dccadaa0a3abda0ff53fc1feb2aa8d34625f2422bc30d2e74a')

prepare() {
    cd "Osmium-${_pkgver}-${_suffix}-x64"

    sed -i \
        -e "s|Exec=.*|Exec=/usr/bin/${pkgname} --enable-features=UseOzonePlatform --ozone-platform-hint=auto %U|" \
        Osmium.desktop
    echo 'Path=/usr/bin' >> Osmium.desktop
}

package() {
    cd "Osmium-${_pkgver}-${_suffix}-x64"

    install -dm755 "${pkgdir}/opt/${pkgname}"
    cp -a . "${pkgdir}/opt/${pkgname}"

    chmod 755 "${pkgdir}/opt/${pkgname}/${pkgname}"
    chmod u+s "${pkgdir}/opt/${pkgname}/chrome-sandbox"

    install -d "${pkgdir}"/usr/{bin,share/{pixmaps,applications}}
    ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    ln -s "/opt/${pkgname}/Osmium.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    ln -s "/opt/${pkgname}/resources/assets/icon-1024.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

    install -Dm644 LICENSE.electron.txt \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
    install -Dm644 LICENSES.chromium.html \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}