# Based  on the template from https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html
# Maintainer : pbek https://aur.archlinux.org/account/pbek
# Contributor : Anagastes

pkgname=qownnotes-qt5-bin
pkgver=22.3.1
pkgrel=1
pkgdesc="Plain-text file markdown note taking with Nextcloud/ownCloud integration - qt5-bin"
arch=('x86_64')
url='https://www.qownnotes.org/'
license=('GPL2')
groups=('qownnotes')
depends=('qt5-base' 'qt5-svg' 'qt5-declarative' 'openssl' 'qt5-xmlpatterns' 'qt5-websockets' 'qt5-x11extras' 'aspell')
conflicts=('qownnotes')
options=(!strip)
_appimage="QOwnNotes-x86_64.AppImage"
source=("https://github.com/pbek/QOwnNotes/releases/download/v$pkgver/QOwnNotes-x86_64.AppImage")
noextract=("${_appimage}")
sha256sums=('f17bdbc8aab57952eaf5874b4412b8f908d7a3caed2ee696d04268f6011235de')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=QOwnNotes|Exec=env DESKTOPINTEGRATION=false /usr/bin/${pkgname}.AppImage %u|"\
        "squashfs-root/PBE.QOwnNotes.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/PBE.QOwnNotes.desktop"\
            "${pkgdir}/usr/share/applications/PBE.QOwnNotes.desktop"

    # Icon 
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
    mkdir -p "${pkgdir}/usr/share/pixmaps/"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/QOwnNotes.png" "${pkgdir}/usr/share/pixmaps"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}
