# Maintainer: Joop Kiefte <ikojba at gmail dot com>

_pkgname=dolt-workbench
_pkgname_uppercase=Dolt-Workbench

pkgname="${_pkgname}"-appimage
pkgver=0.3.20
pkgrel=3
pkgdesc="A full database tool for working with MySQL and Postgres or their git-style versioned alternatives Dolt and Doltgres"
arch=('x86_64')
url="https://dolthub.com"
license=('Apache-2.0')
depends=('zlib' 'fuse2')
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://github.com/dolthub/dolt-workbench/releases/download/v${pkgver}/${_pkgname_uppercase}-linux-${arch}.AppImage"
               "https://raw.githubusercontent.com/dolthub/dolt-workbench/refs/tags/v${pkgver}/LICENSE"
              )
noextract=("${_appimage}")
sha256sums_x86_64=('4e06e0db0adf130c99bddc928f4ff094de32e0fcfff786e87823e4d0e4b7e240'
                   'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')

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
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/opt/${pkgname}/LICENSE"

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
