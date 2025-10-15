# Maintainer: alstruit <alsturit at gmail.com>
# Contributor: Jake <ja.ke@posteo.de>
# Contributor: Vincent van Donselaar <vincent@van-donselaar.nl>

_pkgname=fiddler-everywhere
_pkgname2=fiddler
pkgname=fiddler-appimage
pkgver=7.3.0
pkgrel=1
pkgdesc="The free web debugging proxy by Telerik"
arch=('x86_64')
url="https://www.telerik.com/fiddler"
license=('custom')
makedepends=('zlib' 'fuse2')
_appimage="${pkgname}-${pkgver}.AppImage"
source=("${_appimage}::https://downloads.getfiddler.com/linux/${_pkgname}-${pkgver}.AppImage" "fiddler.sh")
noextract=("${_appimage}")
sha256sums=('33548c5ad21d818a42f9cc2b37c67a4feeed8f8cb4ee1868dda92ecbd8ff97df'
            '6cd281632814cba5d51c29e8a67d4920498c6e99b31709aa94cf5f83000db7c0')
conflicts=('fiddler-everywhere')
options=(!strip)


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
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${_pkgname2}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/LICENSE.txt" "${pkgdir}/opt/${pkgname}/LICENSE"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop"\
            "${pkgdir}/usr/share/applications/${_pkgname2}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink wrapper to run on terminal.
    install -dm755 "${pkgdir}/usr/bin"
    install -m755 "../fiddler.sh" "${pkgdir}/usr/bin/${_pkgname2}"

    # Symlink license
    install -dm755 "${pkgdir}/usr/share/licenses/${_pkgname2}/"
    ln -s "/opt/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname2"
}
