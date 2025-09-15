# Maintainer: snowking98 <cfxb000 at gmail dot com>
pkgname="fntv-electron-bin"
_pkgver=2.1.0
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
depends=('hicolor-icon-theme' 'fuse2' 'mpv') # 已移除 'glibc' 和 'zlib'
_install_path="/opt/${pkgname}"
source_x86_64=("${pkgname}_${pkgver}_x86_64.AppImage::${url}/releases/download/v${_release_tag}/FNMedia_${pkgver}_linux_x86_64.AppImage")
source_aarch64=("${pkgname}_${pkgver}_arm64.AppImage::${url}/releases/download/v${_release_tag}/FNMedia_${pkgver}_linux_arm64.AppImage")
source=("LICENSE::https://raw.githubusercontent.com/QiaoKes/fntv-electron/refs/heads/release/LICENSE")
sha256sums_x86_64=('fc6c0fc70c1342ee00eddcc9531e2885ca1848e7b1408081a32496a9750bfde5')
sha256sums_aarch64=('5e2e8e1506befb5d10cc544179b92e029507baca56a7e5e06b64a96e026f5dd7')
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
