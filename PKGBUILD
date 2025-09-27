# Maintainer: snowking98 <cfxb000 at gmail dot com>
pkgname="fntv-electron-bin"
_pkgver=2.4.2
_subver=0
_release_tag="${_pkgver}"
pkgver="${_pkgver}"
pkgrel=1
pkgdesc="A fntv app built with Electron.飞牛影视PC版 electron封装"
arch=('x86_64' 'aarch64')
url="https://github.com/QiaoKes/fntv-electron"
license=('GPL-3.0-only')
options=(!strip)
conflicts=("${pkgname%-bin}")
depends=('hicolor-icon-theme' 'fuse2' 'mpv')
_install_path="/opt/${pkgname}"
source_x86_64=("${pkgname}_${pkgver}_x86_64.AppImage::${url}/releases/download/v${_release_tag}/FNMedia_${pkgver}_linux_x86_64.AppImage")
source_aarch64=("${pkgname}_${pkgver}_arm64.AppImage::${url}/releases/download/v${_release_tag}/FNMedia_${pkgver}_linux_arm64.AppImage")
source=("LICENSE::https://raw.githubusercontent.com/QiaoKes/fntv-electron/refs/heads/release/LICENSE")
sha256sums_x86_64=('b96b18a6bcf1a8b9068e9f95e2d1250e2bb9b9ad81c8c4d15399f68022adfedb')
sha256sums_aarch64=('20e7368c1574ef1da49f364c0d31a238272e1279787a8e421b569999a5e114ea')
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

_appimage="${pkgname}_${pkgver}_${CARCH}.AppImage"

prepare() {
    chmod a+x "${_appimage}"
    "./${_appimage}" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/fntv.AppImage|g" -i "${srcdir}/squashfs-root/${pkgname%-electron-bin}.desktop"
}
package() {
    install -Dm755 "${_appimage}" "${pkgdir}/${_install_path}/${pkgname%-electron-bin}.AppImage"
    for _icons in 256x256;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-electron-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-electron-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
