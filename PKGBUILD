# Maintainer: Firestar <zhang_zhijun@pku.edu.cn>
# Using the template from https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html

_pkgname=lovelive-music-player

pkgname="${_pkgname}"-appimage
pkgver=1.5.0
pkgrel=1
pkgdesc="A LoveLiver Music Player"
arch=('x86_64')
url="https://github.com/LoveLiveMusicPlayer/LoveLiveMusicPlayer"
license=('MIT')
depends=('zlib' 'hicolor-icon-theme' 'fuse2')
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://picbed-cdn.zhushenwudi.top/llmp-oss/LLMP/version/${pkgver}/LoveLive%E9%9F%B3%E4%B9%90%E6%92%AD%E6%94%BE%E5%99%A8-${pkgver}.AppImage")
noextract=("${_appimage}")
sha256sums_x86_64=('1262189eb9e47c6263ac7150f45a1368ec075f25d9b7c6d9601b2fbb42173c10')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|"\
        "squashfs-root/${_pkgname}.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop"\
            "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}
