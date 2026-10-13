# Maintainer: Folf <folf@folf.me>

pkgname=osmium
pkgver=0.1.1
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
source=("https://updater.osmium.chat/Osmium-${pkgver}-x64.tar.gz")
sha512sums=('fa863ea04308e0f3b3fbabff9a09b779b6cb3a095d3efd014387a2b257f73ada48e3dca3b00862a23eed19adc2932fab2212ab3d8fd54afd1efa782e3546ae88')

prepare() {
    cd "Osmium-${pkgver}-x64"

    sed -i \
        -e "s|Exec=.*|Exec=/usr/bin/${pkgname} --enable-features=UseOzonePlatform --ozone-platform-hint=auto %U|" \
        chat.osmium.Osmium.desktop
    echo 'Path=/usr/bin' >> chat.osmium.Osmium.desktop
}

package() {
    cd "Osmium-${pkgver}-x64"

    install -dm755 "${pkgdir}/opt/${pkgname}"
    cp -a . "${pkgdir}/opt/${pkgname}"

    chmod 755 "${pkgdir}/opt/${pkgname}/${pkgname}"
    chmod u+s "${pkgdir}/opt/${pkgname}/chrome-sandbox"

    install -d "${pkgdir}"/usr/{bin,share/{pixmaps,applications}}
    ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    ln -s "/opt/${pkgname}/chat.osmium.Osmium.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    ln -s "/opt/${pkgname}/resources/assets/icon-1024.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

    install -Dm644 LICENSE.electron.txt \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
    install -Dm644 LICENSES.chromium.html \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}
