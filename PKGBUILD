# Maintainer: agilob <archlinux@agilob.net>
# Maintainer: Mario Ortiz Manero <marioortizmanero@gmail.com>
_pkgname=nault
pkgname="${_pkgname}-bin"
pkgver=1.10.0
pkgrel=1
pkgdesc='Official Nault AppImage client'
arch=('x86_64')
url='https://github.com/Nault/Nault'
license=('MIT')
provides=("$pkgname")
depends=('fuse2')
conflicts=("$pkgname")
options=(!strip)
_appimage="nault.AppImage"
source=("${url}/releases/download/v${pkgver}/Nault-${pkgver}-Linux.AppImage")
noextract=("$_appimage")
sha512sums=('2b7dec90f17062d272d1778e2fdf43950374a9caa3342a986f4edf42c7ee92547dbbc237a3ce34f4a5fb5a2283400c2f6124af3032ea86ecdf269647168d04aa')

prepare() {
    mv "Nault-${pkgver}-Linux.AppImage" "$_appimage"
    chmod +x "$_appimage"
    "./$_appimage" --appimage-extract

    # Fixing the desktop file
    sed -i -E "s:Exec=AppRun:Exec=/opt/${_pkgname}/${_appimage}:" "squashfs-root/${_pkgname}.desktop"
}

package() {
    # Appimage and symlink
    install -Dpm755 "${_appimage}" "${pkgdir}/opt/${_pkgname}/${_appimage}"
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/${_appimage}" "${pkgdir}/usr/bin/${_pkgname}"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icons
    install -dm755 "${pkgdir}/usr/share/"
    cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
}
