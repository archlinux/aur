# Based off of: https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html
# Maintainer: fengcheng <fengcheng@lidig.com>

_pkgname=linuxqq
_Pkgname=Linuxqq
_disname=qq
_version=3.2.32
_update_date=2026-08-12
_image_url_x86_64=https://qqdl.gtimg.cn/qqfile/QQNT/9.9.33/release/3f89efc5/QQ_3.2.32_260812_x86_64_01.AppImage
_image_sha256sums_x86_64=311043510d64fc006ed252ce8ae7f133660f1f678eff01cf255e2907c1f42d7f
_image_url_aarch64=https://qqdl.gtimg.cn/qqfile/QQNT/9.9.33/release/3f89efc5/QQ_3.2.32_260812_arm64_01.AppImage
_image_sha256sums_aarch64=2b00d8c543b71ecd349942d840207ef9de34a16d783298a20577e369e1d1e8ed

pkgname="${_pkgname}"-appimage
pkgver="${_version}_${_update_date//-/}"
pkgrel=1
pkgdesc="New Linux QQ based on Electron"
arch=('x86_64' 'aarch64')
url="https://im.qq.com/linuxqq/"
license=('custom')
options=(!strip !debug)
depends=('zlib' 'hicolor-icon-theme' 'fuse2')
makedepends=('curl' 'jq')
provides=('qq' 'linuxqq')
conflicts=('linuxqq' 'linuxqq-nt-bwrap')

source=('download.sh')
sha256sums=('20b969d4f4fd4298ed8f4130f05a16084b29417d24f41a72e37d4237d7dc4b85')

_appimage="${_Pkgname}-${pkgver}-${CARCH}.AppImage"
_image_url="_image_url_${CARCH}"
_sha256sums="_image_sha256sums_${CARCH}"

prepare() {
    [ -f ${startdir}/${_appimage} ] || ./download.sh ${!_image_url} -sS -o ${startdir}/${_appimage}
    [ -f ${_appimage} ] || ln -s ${startdir}/${_appimage} ${_appimage}
    echo "${!_sha256sums} ${_appimage}" | sha256sum --check

    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract ${_disname}.desktop
    ./"${_appimage}" --appimage-extract ${_disname}.png
    ./"${_appimage}" --appimage-extract LICENSE.electron.txt
    ./"${_appimage}" --appimage-extract usr/share/icons/hicolor/512x512/apps/qq.png
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
