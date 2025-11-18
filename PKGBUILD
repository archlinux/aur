# Maintainer: Cortex
# Forked from Vesktop
_pkgname=Equibop
pkgname=equibop-bin
_appname=equibop-desktop
pkgver=3.1.3
_electronversion=39
pkgrel=1
pkgdesc="A Vesktop fork cross platform electron-based desktop app aiming to give you a snappier Discord experience with Equicord pre-installed"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/Equicord/Equibop"
license=('GPL-3.0-only')
install=equibop.install
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
        "equibop.install"
        "icon.png::${url}/raw/v${pkgver}/static/icon.png")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-arm64.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.tar.gz")
sha256sums=('28e852632bc479a8c9bb84c2d9b629c35a621618448fbc1e0bbea21dfaef19a1'
            'e11aa0a6bebe23f473ccb8e7d5577e05e7b9287381de91223f86c79d6729caae'
            '280156676d268d80f65ea3e592bacdd0df5bd78e69872211c624fa07ea062cb8')
sha256sums_aarch64=('eaa911e5767141cea1a5cf584f3a85fbc3d3bd8ae0c3d5f4b374ee4da64b59ae')
sha256sums_x86_64=('06e79bd76d52787ea2e5e3bee17a61f9f83872f8c4b541f23c50ab4d80fdfb32')
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

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/org.equicord.${pkgname%-bin}.desktop" << END
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
