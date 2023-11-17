# Maintainer: huochenghai <huochenghai@gmail.com>

_basepkgname=chat-gpt-next-web
pkgname=${_basepkgname}-bin
pkgver=2.9.12
pkgrel=1
pkgdesc="A well-designed cross-platform ChatGPT UI (Web / PWA / Linux / Win / MacOS). 一键拥有你自己的跨平台 ChatGPT 应用。"
arch=('x86_64')
url="https://a.nextweb.fun/"
_githuburl="https://github.com/Yidadaa/ChatGPT-Next-Web"
license=('MIT')
provides=("${pkgname}-${pkgver}")
conflicts=("${pkgname}" "${_basepkgname}-bin")
depends=(webkit2gtk)
options=('!strip')
noextract=("${_basepkgname}-${pkgver}.AppImage")
source=("${pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${_basepkgname}_${pkgver}_amd64.AppImage"
        'LICENSE::https://raw.githubusercontent.com/Yidadaa/ChatGPT-Next-Web/main/LICENSE')
sha256sums=('e2767c423f4b5e79d130d922edbee7194fd176e1f9dd40341a7865e4f90519d9'
        'c840d06dc375a0003fd2a080b0d6be6afd958a1f5f637bfb00bd0c13ddfd2987')

package() {
        chmod 755 ./${pkgname}-${pkgver}.AppImage
        ./${pkgname}-${pkgver}.AppImage --appimage-extract
        install -Dm644 squashfs-root/"${pkgname%-bin}.png" "${pkgdir}/usr/share/pixmaps/chat-gpt-next-web.png"
        install -Dm644 squashfs-root/"${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
        install -d "${pkgdir}/usr/bin"
        install -d "${pkgdir}/opt"
        sed -i '8s/.*/this_dir=\"\$(dirname "\$(readlink -f \"\$0\"\)\")\"/' squashfs-root/AppRun
        sed -i 's/APPDIR/APPDIR_/g' squashfs-root/apprun-hooks/linuxdeploy-plugin-gtk.sh
        cp -avR squashfs-root/ "${pkgdir}/opt/${pkgname%-bin}"
        ln -s /opt/${pkgname%-bin}/AppRun "${pkgdir}/usr/bin/${pkgname%-bin}"
        find "${pkgdir}/opt/${pkgname%-bin}" -type d -exec chmod 755 {} +
        install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
