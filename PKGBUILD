# Based off of: https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html
# Maintainer: fengcheng <fengcheng@lidig.com>

_pkgname=linuxqq
_Pkgname=Linuxqq
_disname=qq

pkgname="${_pkgname}"-appimage
pkgver=3.2.1_16950
_pkgnum=56dd3789
pkgrel=1
pkgdesc="New Linux QQ based on Electron"
arch=('x86_64' 'aarch64')
url="https://im.qq.com/linuxqq/"
license=('custom')
options=(!strip)
depends=('zlib' 'hicolor-icon-theme' 'fuse2')
provides=('qq' 'linuxqq')
conflicts=('linuxqq' 'linuxqq-nt-bwrap')

source_x86_64=("${_Pkgname}-${pkgver}-x86_64.AppImage::https://dldir1.qq.com/qqfile/qq/QQNT/${_pkgnum}/${_pkgname}_${pkgver//_/-}_x86_64.AppImage")
source_aarch64=("${_Pkgname}-${pkgver}-aarch64.AppImage::https://dldir1.qq.com/qqfile/qq/QQNT/${_pkgnum}/${_pkgname}_${pkgver//_/-}_arm64.AppImage")
sha256sums_x86_64=('584ca01cf00bb1ecb245a58b6a27cd6f281ce20421974a9570f56bac4898c801')
sha256sums_aarch64=('23f2be5306bf08ce90a42347155f0b66143fc0540bb3a2c322c8702270760cb2')

_appimage="${_Pkgname}-${pkgver}-${arch}.AppImage"
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
