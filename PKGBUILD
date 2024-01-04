# Maintainer: ThatOneCalculator <kainoa@t1c.dev>
# Based off of: https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html

_pkgname=texts

pkgname="${_pkgname}-appimage"
pkgver=0.82.6
pkgrel=1
pkgdesc="All of your messages in one inbox"
arch=('x86_64')
url="https://texts.com/"
license=('Proprietary')
depends=('libnotify' 'libappindicator-gtk3' 'fuse2' 'fuse3' 'fuse-common' 'libsecret')
sha512sums_x86_64=('fa5f182cfbfa60887ef1976a3539ee39a5ed6b6fab1b5cbe6a90768d1ea864efe179ea05dc45d094200dd45438d46f03748dd76aa6eef93ddcb52a9b477a23d8')
hash=$(echo ${sha512sums_x86_64} | head -c 10)
_appimage="Texts-Linux-x64-v${pkgver}-${hash}.AppImage"
source_x86_64=("${_appimage}::https://texts-binaries.texts.com/builds/${_appimage}")
noextract=("${_appimage}")
options+=('!strip')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|"\
        "squashfs-root/jack.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/jack.desktop"\
            "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}
