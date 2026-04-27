# Maintainer: prolletto64 <github@prolletto64.eu>

_pkgname=OpenNOW
pkgname="opennow-appimage"
pkgver="0.3.8"
pkgrel=1
pkgdesc="Custom GeForce Now Client Named OpenNOW"
arch=('x86_64' 'aarch64')
url="https://github.com/OpenCloudGaming/OpenNOW"
license=('MIT-0')
depends=('zlib' 'hicolor-icon-theme')
makedepends=('unzip')
options=(!strip)
_appimage="${_pkgname}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://github.com/OpenCloudGaming/OpenNOW/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-x86_64.AppImage")
source_aarch64=("${_appimage}::https://github.com/OpenCloudGaming/OpenNOW/releases/download/v${pkgver}/${_pkgname}-v${pkver}-linux-arm64.AppImage")
source=("https://raw.githubusercontent.com/OpenCloudGaming/OpenNOW/refs/heads/main/LICENSE"
	 "icons.zip")
noextract=("${_appimage}")
sha256sums_x86_64=('2229124dbf8bb41ab3874d5b688a7c1ee8cfa7d81d4254c6eeee1580126041c0')
sha256sums_aarch64=('460c11cfc7361dd0581597d701c46dbe981566c50de21d93f176804d7abdcd6f')
sha256sums=('5d00339c6bcca47bc7db1412fb3abda80918ee631d7abe7609045754307a97e3'
	'bbea1359b8b6df700d471cbca5aff54f72860c6c1f8786e8b42cd0f6900bf058')
_binary="opennow-stable"
prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
    unzip -o icons.zip
}

build() {
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_binary}|"\
        "squashfs-root/${_binary}.desktop"
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/opt/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/squashfs-root/${_binary}.desktop"\
            "${pkgdir}/usr/share/applications/${_binary}.desktop"
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_binary}"
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -s "/opt/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
