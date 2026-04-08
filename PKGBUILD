# Maintainer: nukiyoam <329748113[at]qq[dot]com>

# 参考 https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=visual-studio-code-bin

pkgname=trae-cn-desktop-bin
_pkgname=trae-cn
pkgver=2.3.18550
pkgrel=1
pkgdesc="字节跳动推出的AI编程IDE（Trae CN）"
arch=('x86_64' 'aarch64')
url="https://www.trae.cn/"
license=('custom')
# Upstream has signature verification for extensions and stripping breaks it
# See https://github.com/microsoft/vscode/issues/223455#issuecomment-2610001754
options=('!strip')
install=$pkgname.install

# lsof: needed for terminal splitting, see https://github.com/Microsoft/vscode/issues/62991
# xdg-utils: needed for opening web links with xdg-open
depends=(libxkbfile gnupg gtk3 libsecret nss gcc-libs libnotify libxss glibc lsof shared-mime-info xdg-utils alsa-lib)

optdepends=(
    'glib2: Needed for move to trash functionality'
    'libdbusmenu-glib: Needed for KDE global menu'
    'org.freedesktop.secrets: Needed for settings sync'
    # See https://github.com/MicrosoftDocs/live-share/issues/4650
    'icu69: Needed for live share'
)

provides=("trae-cn=${pkgver}")
conflicts=('trae-cn' 'trae-cn-bin')

source_x86_64=(
    "${_pkgname}-${pkgver}-${CARCH}.tar.gz::https://lf-cdn.trae.com.cn/obj/trae-com-cn/pkg/app/releases/stable/${pkgver}/linux/Trae%20CN-linux-x64.tar.gz"
    "${_pkgname}.desktop"
    "${_pkgname}-startup.sh"
)

source_aarch64=(
    "${_pkgname}-${pkgver}-${CARCH}.tar.gz::https://lf-cdn.trae.com.cn/obj/trae-com-cn/pkg/app/releases/stable/${pkgver}/linux/Trae%20CN-linux-arm64.tar.gz"
    "${_pkgname}.desktop"
    "${_pkgname}-startup.sh"
)

sha256sums_x86_64=('991cada3104ae5c46b8a722b23a7cb89d07a6592daa4c44f67874d660c5f515f'
                   'bb29c808c432f05d1611a4064fa958560f91c64e55aebc03e3dd9d08f9659de6'
                   'cd3a00a606b14d2ab494ad98b1c3926ceaf0c46f226b258f7e79c55b61dbd395')
sha256sums_aarch64=('991cada3104ae5c46b8a722b23a7cb89d07a6592daa4c44f67874d660c5f515f'
                    'bb29c808c432f05d1611a4064fa958560f91c64e55aebc03e3dd9d08f9659de6'
                    'cd3a00a606b14d2ab494ad98b1c3926ceaf0c46f226b258f7e79c55b61dbd395')


package() {
    install -d "${pkgdir}/opt/${_pkgname}"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/"{applications,pixmaps,mime/packages,licenses/${_pkgname}}
    bsdtar -xf "${srcdir}/${_pkgname}-${pkgver}-${CARCH}.tar.gz" -C "${pkgdir}/opt/${_pkgname}"
    chmod 4755 "${pkgdir}/opt/${_pkgname}/chrome-sandbox"
    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/resources/app/resources/linux/code.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
    install -Dm644 "${srcdir}/resources/app/licenses/LICENSE-TRAE-CN.rtf"  "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-TRAE-CN.rtf"
    install -Dm644 "${srcdir}/resources/completions/bash/${_pkgname}"  "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
    install -Dm644 "${srcdir}/resources/completions/zsh/_${_pkgname}"  "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
    install -m755 "${srcdir}/${_pkgname}-startup.sh" "${pkgdir}/usr/bin/${_pkgname}"
}
