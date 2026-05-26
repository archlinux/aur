# Maintainer: Yoann Laissus <yoann.laissus@gmail.com>
_pkgname=musescore
pkgname=musescore-bin
pkgver=4.7.2
pkgrel=1
pkgdesc='Create, play and print beautiful sheet music / AppImage version'
arch=(x86_64)
url=https://musescore.org/
license=(GPL)
groups=(pro-audio)
_appimage="MuseScore-Studio-${pkgver}.260525085-x86_64.AppImage"
noextract=("${_appimage}")
depends=(zlib fuse2)
optdepends=('lame: MP3 export')
provides=('musescore')
conflicts=(
    'musescore'
    'musescore-git'
)
options=(!strip !debug)
source=("${_appimage}::https://github.com/musescore/MuseScore/releases/download/v${pkgver}/${_appimage}")
sha256sums=('9c1c2c2db1a7dc830b1bccf530f392de9bff47022826596b3b2117fc19cd73f5')
appname="mscore"

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=.*|Exec=env DESKTOPINTEGRATION=false /usr/bin/${appname} %U|"\
        "squashfs-root/org.musescore.MuseScore4portable.desktop"
    # Remove "Portable" from the application name
    sed -i -E "s|Name=MuseScore Studio.*|Name=MuseScore Studio ${pkgver}|"\
        "squashfs-root/org.musescore.MuseScore4portable.desktop"
    # We need to match the WMClass of the AppImage which is different from the provided desktop file
    sed -i -E "s|StartupWMClass=.*|StartupWMClass=mscore4portable|"\
        "squashfs-root/org.musescore.MuseScore4portable.desktop"

    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/org.musescore.MuseScore4portable.desktop"\
            "${pkgdir}/usr/share/applications/${appname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${appname}"
}

