# Maintainer: italoghost <eduprodive at posteo dot me>
pkgname=bb_launcher-bin
pkgver=16.04
_pkgname=bb_launcher
_pkgid=BB_Launcher
pkgrel=1
pkgdesc="Dedicated launcher/mod manager combo app for Bloodborne on shadPS4 (binary version)"
arch=('x86_64')
license=('GPL-3.0-only')
url="https://github.com/rainmakerv3/${_pkgid}"
depends=(
        'glibc' 
        'libgcc' 
        'libgpg-error' 
        'gmp' 
        'e2fsprogs' 
        'expat' 
        'zlib' 
        'bash'
        'libstdc++'
        )
makedepends=('curl' 'unzip')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip' '!zipman' '!emptydirs' '!debug')
_appimage=${_pkgid}-qt-Downloader.AppImage
_archive=${pkgver}-${_appimage}
noextract=("${_appimage}")
source=(${pkgver}-${_appimage}::${url}/releases/download/Release${pkgver}/${_appimage})
sha256sums=('8b10dbb04585f88c3444eaa01106a944f6cc7778d92b9778c117498e662bfffc')

prepare() {
    chmod +x "${_archive}"
    ./"${_archive}" --appimage-extract
}

build() {
    cd "${srcdir}/squashfs-root"
    # Patch AppRun to point to the fixed installation directory in /opt,
    sed -i "s|appdir=\$(readlink -f \${APPDIR:-\$(dirname \"\$0\")})|appdir=\"/opt/${_pkgname}\"|" "$srcdir/squashfs-root/AppRun"
    # Patch .desktop file
    mv "BBLauncher.desktop" "${_pkgname}.desktop"
    mv "BBIcon.png" "${_pkgname}.png"
    sed -i -e "s/Exec=${_pkgid}/Exec=${_pkgname}/" "${_pkgname}.desktop"
    sed -i -e "s/Icon=BBIcon/Icon=${_pkgname}/" "${_pkgname}.desktop"
    # Remove .DirIcon file
    rm ".DirIcon"
    # Patch the executable name
    mv "${srcdir}/squashfs-root/usr/bin/${_pkgid}" "${srcdir}/squashfs-root/usr/bin/${_pkgname}"
}

package() {
    # Create directory structure
    install -dm755 "${pkgdir}/opt/${_pkgname}"
    install -dm755 "${pkgdir}/usr/bin"
    # Move extracted content to /opt
    cp -rp "${srcdir}/squashfs-root/." "${pkgdir}/opt/${_pkgname}/"
    # Install the .desktop file and the icon
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.png" "$pkgdir/usr/share/pixmaps/${_pkgname}.png"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "$pkgdir/usr/share/applications/${_pkgname}.desktop"
    # Create a symbolic link for the AppRun
    ln -s "/opt/${_pkgname}/AppRun" "${pkgdir}/usr/bin/${_pkgname}"
    # Permissions
    chmod -R u+rwX,go+rX,go-w "${pkgdir}/opt/${_pkgname}"
}
