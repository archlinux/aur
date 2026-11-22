# Maintainer: Joop Kiefte <ikojba at gmail dot com>

_pkgname=dolt-workbench
_pkgname_uppercase=Dolt-Workbench

pkgname="${_pkgname}"-appimage
pkgver=0.3.77
pkgrel=1
pkgdesc="A full database tool for working with MySQL and Postgres or their git-style versioned alternatives Dolt and Doltgres"
arch=('x86_64' 'aarch64')
url="https://dolthub.com"
license=('Apache-2.0')
depends=('zlib' 'fuse2' 'hicolor-icon-theme')
options=(!strip)
_appimage="${pkgname}-${pkgver}-${CARCH}.AppImage"
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/dolthub/dolt-workbench/refs/tags/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.AppImage::https://github.com/dolthub/dolt-workbench/releases/download/v${pkgver}/${_pkgname_uppercase}-linux-x86_64.AppImage")
source_aarch64=("${pkgname}-${pkgver}-aarch64.AppImage::https://github.com/dolthub/dolt-workbench/releases/download/v${pkgver}/${_pkgname_uppercase}-linux-arm64.AppImage")
noextract=("${pkgname}-${pkgver}-x86_64.AppImage" "${pkgname}-${pkgver}-aarch64.AppImage")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('2454f9919d3918c5512a875ea0b06762b4c5d3aa49d4a436b1caad178254bb89')
sha256sums_aarch64=('3da20b3d2e99b79ba7d01c45a010e4d8c3d1409428b1cc488770cd7a3e7ebd08')

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
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/opt/${pkgname}/LICENSE"

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
