# Maintainer: italoghost <eduprodive at posteo dot me>
pkgname=duckstation-preview-latest-bin
_pkgname="duckstation-qt"
_pkgid=org.duckstation.DuckStation
pkgver=0.1.11752
pkgrel=1
pkgdesc="Fast PlayStation 1 emulator for PC and Android"
arch=('x86_64')
url='https://github.com/stenzek/duckstation'
license=('CC-BY-NC-4.0')
depends=('glibc' 'gmp' 'e2fsprogs' 'libgpg-error' 'libstdc++' 'libgcc')
makedepends=('yq')
provides=("$_pkgname" 'duckstation')
conflicts=("$_pkgname" 'duckstation')
options=('!strip' '!emptydirs' '!debug')
_appimage="DuckStation-x64.AppImage"
noextract=("${_appimage}")
source=("https://github.com/stenzek/duckstation/releases/download/preview/${_appimage}")
sha256sums=('SKIP')

prepare() {
    # Extract AppImage
    cd "${srcdir}"
    chmod +x "${_appimage}"

    msg2 "Extracting AppImage content..."
    ./"${_appimage}" --appimage-extract

    # Adjust the Icon path in the .desktop file
    sed -i "s|Icon=${_pkgid}|Icon=${_pkgname}|" "${srcdir}/squashfs-root/${_pkgid}.desktop"
}

pkgver() {
    # Extract the version from the metainfo file
    xq -r '.component.releases.release["@version"]' < squashfs-root/usr/share/metainfo/org.duckstation.DuckStation.metainfo.xml | awk -F '[-]' -v OFS='.' '{print $1,$2}'
}

package() {
    # Create directory structure
    install -dm755 "${pkgdir}/opt/${_pkgname}"
    install -dm755 "${pkgdir}/usr/bin"

    # Move extracted content to /opt
    cp -ar "${srcdir}/squashfs-root/." "${pkgdir}/opt/${_pkgname}/"

    # Install the .desktop file and the icon
    install -Dm644 "${srcdir}/squashfs-root/${_pkgid}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgid}.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"

    # Create a symbolic link for the AppRun
    ln -s "/opt/${_pkgname}/AppRun" "${pkgdir}/usr/bin/${_pkgname}"

    # Permissions
    chmod -R u+rwX,go+rX,go-w "${pkgdir}/opt/${_pkgname}"
}
