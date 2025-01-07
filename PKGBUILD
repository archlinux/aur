# Maintainer: Pranav Sharma <pranav.sharma.ama@gmail.com>
# Contributor: nakrule <riedosamuel@gmail.com>
# Contributor: Laurynas Kerežius <gitlab@kerezius.lt>
# Contributor: bitdivision <aur@rfwebb.com>

# Based on the template from https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html
# Based on https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=todoist-appimage

pkgname=mochi-appimage
pkgver=1.18.3
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
sha512sums=(
    '09aa076a0715145c5284d815e278752bb06b1b72e37e47f2646ba4db50cef7dc3647dd7dbdb5bbd6767898aed2fcc00a4a863d3a738adbf5ed04b481336f7dea'
    'SKIP'
)
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
    cp -a "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/" "${pkgdir}/usr/share/icons/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${_appname}.AppImage" "${pkgdir}/usr/bin/${_binname}"

    # Install LICENSE
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
