# Maintainer: prolletto64 <github@prolletto64.eu>

_pkgname=OpenNOW
pkgname="opennow-appimage"
_pkgver=0.2.4
_nightly=60030b626b57914e9e4d538aba1d4ed954a82653
pkgver="${_pkgver}.${_nightly}"
pkgrel=3
pkgdesc="Custom GeForce Now Client Named OpenNOW"
arch=('x86_64' 'aarch64')
url="https://github.com/OpenCloudGaming/OpenNOW"
license=('MIT-0')
depends=('zlib' 'hicolor-icon-theme')
makedepends=('unzip')
options=(!strip)
_appimage="${_pkgname}-${_nightly}.AppImage"
source_x86_64=("${_appimage}::https://github.com/OpenCloudGaming/OpenNOW/releases/download/nightly-${_nightly}/${_pkgname}-v${_pkgver}-linux-x86_64.AppImage")
source_aarch64=("${_appimage}::https://github.com/OpenCloudGaming/OpenNOW/releases/download/nightly-${_nightly}/${_pkgname}-v${_pkver}-linux-arm64.AppImage")
source=("https://raw.githubusercontent.com/OpenCloudGaming/OpenNOW/refs/heads/main/LICENSE"
	 "icons.zip")
noextract=("${_appimage}")
sha256sums_x86_64=('dab371a6b3675bb06388f0de552abace34e1de220a028c46f4fc9806df529524')
sha256sums_aarch64=('8a7e0d683d9420e9b2520deaa5666eb02219dfa909c88e519ae8f597c844e0c6')
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
