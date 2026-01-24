# Maintainer: creations
# Forked from Vesktop
_pkgname=Equibop
pkgname=equibop-bin
_appname=equibop-desktop
pkgver=3.1.7
_electronversion=40
pkgrel=1
pkgdesc="A custom Discord desktop app with Equicord pre-installed (binary release)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/Equicord/Equibop"
license=('GPL-3.0-only')
provides=(
    "${pkgname%-bin}=${pkgver}"
    "${_appname}=${pkgver}"
)
conflicts=(
    "${pkgname%-bin}"
    "${_appname}"
)
depends=(
    "electron${_electronversion}"
)
options=('!strip')
source=("${pkgname%-bin}.sh"
        "icon.png::https://raw.githubusercontent.com/Equicord/Equibop/v${pkgver}/static/icon.png")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-arm64.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.tar.gz")
sha256sums=('28e852632bc479a8c9bb84c2d9b629c35a621618448fbc1e0bbea21dfaef19a1'
            '280156676d268d80f65ea3e592bacdd0df5bd78e69872211c624fa07ea062cb8')
sha256sums_aarch64=('4f9b00329f5180c24e94c994d93de335184061993a87a8d4b11832d1325c876b')
sha256sums_x86_64=('1dbbe8cbc2082b241c3535c804abe5ddc3baa2002515e8c6c2b94acb150080e2')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@|env ELECTRON_OZONE_PLATFORM_HINT=auto|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"

    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}/resources/app-update.yml" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/${pkgname%-bin}-${pkgver}/resources/arrpc" "${pkgdir}/usr/lib/${pkgname%-bin}/"

    install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop" << END
[Desktop Entry]
Name=Equibop
GenericName=Internet Messenger
Type=Application
Categories=Network;InstantMessaging;Chat;
Keywords=discord;vencord;electron;chat;equibop
MimeType=x-scheme-handler/discord
Exec=${pkgname%-bin}
Icon=${pkgname%-bin}
StartupWMClass=equibop
END
}
