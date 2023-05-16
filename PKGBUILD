# Based off of: https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html
# Maintainer: fengcheng <fengcheng@lidig.com>

_pkgname=linuxqq
_Pkgname=Linuxqq
_disname=qq

pkgname="${_pkgname}"-appimage-fix
pkgver=3.1.1_11223
pkgrel=3
pkgdesc="New Linux QQ based on Electron"
arch=('x86_64' 'aarch64')
url="https://im.qq.com/linuxqq/"
license=('custom')
options=(!strip)
depends=('zlib' 'hicolor-icon-theme' 'fuse2')
makedepends=('appimagetool')
provides=('qq' 'linuxqq')
conflicts=('linuxqq' 'linuxqq-nt-bwrap')

source_x86_64=("${_Pkgname}-${pkgver}-x86_64.AppImage::https://dldir1.qq.com/qqfile/qq/QQNT/2355235c/${_pkgname}_${pkgver//_/-}_x86_64.AppImage")
source_aarch64=("${_Pkgname}-${pkgver}-aarch64.AppImage::https://dldir1.qq.com/qqfile/qq/QQNT/2355235c/${_pkgname}_${pkgver//_/-}_arm64.AppImage")
sha256sums_x86_64=('27f15ae01973ef2216d84fa8755e949abc535fce11f5214e2f902c9027baeb0f')
sha256sums_aarch64=('b2cc69ee832addc697d9dd08730cd97f0aa085060dcc419d4c08b656b19d5703')

_appimage="${_Pkgname}-${pkgver}-${arch}.AppImage"
noextract=("${_appimage}")

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Fix AppImage
    rm -r squashfs-root/resources/app/sharp-lib
    sed -i \
        -e "s|Icon=.*|Icon=/usr/share/icons/hicolor/512x512/apps/qq|" \
        "${srcdir}/squashfs-root/${_disname}.desktop"

    # save and unset SOURCE_DATE_EPOCH for appimagetool
    _SOURCE_DATE_EPOCH=$SOURCE_DATE_EPOCH
    unset SOURCE_DATE_EPOCH

    appimagetool ${srcdir}/squashfs-root ${srcdir}/${pkgname}.AppImage

    # restore SOURCE_DATE_EPOCH
    export SOURCE_DATE_EPOCH=$_SOURCE_DATE_EPOCH

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
    install -Dm755 "${srcdir}/${pkgname}.AppImage" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
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