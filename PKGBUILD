# Maintainer: Folf <folf@folf.me>

pkgname=osmium
pkgver=0.0.12
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
_pkgver=0.0.12
_suffix=alpha
source=("https://updater.osmium.chat/Osmium-${_pkgver}-${_suffix}-x64.tar.gz")
sha512sums=('ab7ee00b635f544d43b74a43ec7247d41c587f3a8075a0410f252b1b0b6ab0ddd25d4c8a397e910c6179d18a7c7569786419ad4e99dac248e4d90e725cdf51b9')

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