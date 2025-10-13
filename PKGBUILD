# Maintainer: Pranav Sharma <pranav.sharma.ama@gmail.com>
# Contributor: nakrule <riedosamuel@gmail.com>
# Contributor: Laurynas Kerežius <gitlab@kerezius.lt>
# Contributor: bitdivision <aur@rfwebb.com>

# Based on the template from https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html
# Based on https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=todoist-appimage

pkgname=mochi-appimage
pkgver=1.19.6
pkgrel=1
pkgdesc="Flash cards / spaced repetition using markdown"
arch=('x86_64')
url="https://mochi.cards"
license=('LicenseRef-MochiTOU')
depends=(
    'fuse2'
    'glibc'
    'hicolor-icon-theme' 
    'zlib'
)
optdepends=('gearlever: appimage integration')
options=('!strip' '!debug')
_appname="Mochi"
_binname="mochi"
_appimage="${_appname}-${pkgver}.AppImage"

source=(
    "https://mochi.cards/releases/${_appimage}"
    "LICENSE"
)
sha512sums=('5f48b670af47a1a11d201cb5d5e25f4faafe827406dbf3d19e3bb23b1410bbe500111791bc66916ac243b913070ea965b18481f6cb0da9909a7697047c3c9b8d'
            '9a5639982c3181ebb45a90756ec08ed7b2174dce0342abaf8377587d29fe1733e31394b09b87483ded952a467dc2707d1461045f62e5928fdc48490d69d0c3ff')
noextract=("${_appimage}")

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_binname} %u|"\
        "squashfs-root/${_binname}.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${_appname}.AppImage"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_binname}.desktop"\
            "${pkgdir}/usr/share/applications/${_binname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons/hicolor/2048x2048/apps/" "${pkgdir}/usr/share/icons/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${_appname}.AppImage" "${pkgdir}/usr/bin/${_binname}"

    # Install LICENSE
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
