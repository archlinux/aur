# Maintainer: Firestar <zhang_zhijun@pku.edu.cn>
# Using the template from https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html

_pkgname=lovelive-music-player

pkgname="${_pkgname}"-appimage
pkgver=1.6.4
pkgrel=1
pkgdesc="A LoveLiver Music Player"
arch=('x86_64')
url="https://github.com/LoveLiveMusicPlayer/LoveLiveMusicPlayer"
license=('MIT')
depends=('zlib' 'hicolor-icon-theme' 'fuse2')
options=(!strip)
_appimage="LLMP-${pkgver}-x86-linux.AppImage"
source_x86_64=("${_appimage}::https://github.com/LoveLiveMusicPlayer/LoveLiveMusicPlayer/releases/download/${pkgver}/LLMP-${pkgver}-x86-linux.AppImage"
"https://raw.githubusercontent.com/LoveLiveMusicPlayer/LoveLiveMusicPlayer/${pkgver}/LICENSE")
noextract=("${_appimage}")
sha256sums_x86_64=("6ecaf9a16ded726c6da099a5a55018e9bfbbfd4e0427a4d1375a36ab06f93925"
                   "5e98c15fe806a18f79422d2cd0c4587129f4e03081b5ab4c030627d6f6840d68")

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

    # Symlink license
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -s "/opt/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
