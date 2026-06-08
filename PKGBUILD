# Maintainer: Folf <folf@folf.me>

pkgname=osmium
pkgver=0.0.28
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
_pkgver=0.0.28
_suffix=alpha
source=("https://updater.osmium.chat/Osmium-${_pkgver}-${_suffix}-x64.tar.gz")
sha512sums=('88e3b0b6e9a098896538b6d9643c6b835adcb0dd8eb40d66d30d95b3736c849322cef58bbc11133e533571a43b4f0360fb6f6f141dd921c5cdc77b44505064f0')

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