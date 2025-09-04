# Based off of: https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html
# Maintainer: fengcheng <fengcheng@lidig.com>

_pkgname=linuxqq
_Pkgname=Linuxqq
_disname=qq
_version=3.2.19
_update_date=2025-09-04
_image_url_x86_64=https://dldir1v6.qq.com/qqfile/qq/QQNT/Linux/QQ_3.2.19_250904_x86_64_01.AppImage
_image_url_aarch64=https://dldir1v6.qq.com/qqfile/qq/QQNT/Linux/QQ_3.2.19_250904_arm64_01.AppImage

pkgname="${_pkgname}"-appimage
pkgver="${_version}_${_update_date//-/}"
pkgrel=1
pkgdesc="New Linux QQ based on Electron"
arch=('x86_64' 'aarch64')
url="https://im.qq.com/linuxqq/"
license=('custom')
options=(!strip !debug)
depends=('zlib' 'hicolor-icon-theme' 'fuse2')
provides=('qq' 'linuxqq')
conflicts=('linuxqq' 'linuxqq-nt-bwrap')

source_x86_64=("${_Pkgname}-${pkgver}-x86_64.AppImage::${_image_url_x86_64}")
source_aarch64=("${_Pkgname}-${pkgver}-aarch64.AppImage::${_image_url_aarch64}")
sha256sums_x86_64=('4a3e9c932442daa243090cb0acb833ae416b5b4c542ebe5994ea5a23c0bad3b9')
sha256sums_aarch64=('07093de738f3fcee36df54cd71b65f0a40645fca6f1881a210b55d98a5f20714')

_appimage="${_Pkgname}-${pkgver}-${CARCH}.AppImage"
noextract=("${_appimage}")

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i \
        -e "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|" \
        -e "s|Icon=.*|Icon=/usr/share/icons/${_pkgname}.png|" \
        "squashfs-root/${_disname}.desktop"

    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/LICENSE.electron.txt" "${pkgdir}/opt/${pkgname}/LICENSE"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_disname}.desktop"\
            "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
    ln -s "$(realpath ${srcdir}/squashfs-root/${_disname}.png  --relative-to ${srcdir}/squashfs-root/usr/share/icons)"\
        "${pkgdir}/usr/share/icons/${_pkgname}.png"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"

    # Symlink license
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -s "/opt/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
