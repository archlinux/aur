# Maintainer: Eugene Lebedev <satanych13+dev@gmail.com>

_pkgname=laigter
pkgname=${_pkgname}-appimage
pkgver=1.9
pkgrel=1
pkgdesc="Automatic normal/specular/parallax/occlussion map generator for sprites!"
arch=('x86_64')
url="https://github.com/azagaya/laigter"
license=('GPL3')
depends=('zlib' 'hicolor-icon-theme')
provides=('laigter')
conflicts=('laigter')
source=("https://github.com/azagaya/${_pkgname}/releases/download/$pkgver/${_pkgname}-${pkgver}-${arch}.AppImage"
        "https://raw.githubusercontent.com/azagaya/${_pkgname}/master/LICENSE"
        )
sha256sums=(
	681af17219a1570ea3a149146e1ebc1f9465fce23c6b41641eb2ba2d15f0880a
	5576a91fe9ee4b3ebc0c6e527144449711e497594a93830e2bd7206424910d7b
	)

options=(!strip)
_appimage="${_pkgname}-${pkgver}-${arch}.AppImage"
noextract=("${_appimage}")


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

