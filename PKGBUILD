# Maintainer: Vedant K <gamemaker0042 at gmail dot com>

_pkgname=beaker

pkgname="${_pkgname}"-appimage
pkgver=1.1.0
pkgrel=1
pkgdesc="An experimental peer-to-peer Web browser"
arch=("x86_64" "i686")
url="https://github.com/beakerbrowser/beaker"
license=("MIT")
depends=("zlib" "hicolor-icon-theme")
provides=("beaker")
conflicts=("beaker" "beaker-git" "beaker-browser-bin" "beaker-browser-git")
options=(!strip)

_appimage="${pkgname}-${pkgver}.AppImage"
source=("${_appimage}::https://github.com/beakerbrowser/beaker/releases/download/${pkgver}/Beaker.Browser-${pkgver}.AppImage"
				"https://raw.githubusercontent.com/beakerbrowser/beaker/${pkgver}/LICENSE")
noextract=("${_appimage}")
sha256sums=('77b6707ac32b5fe3fcc38f0f86159bb2f8eda42c1b88c077dea846bf4df60c1e'
            '161de6e06ddccad672765bc824b75990f554a9cb1d23f6193b63bc514399179c')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|"\
        "squashfs-root/beaker-browser.desktop"
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/opt/${pkgname}/LICENSE"

    install -Dm644 "${srcdir}/squashfs-root/beaker-browser.desktop"\
            "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"

    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -s "/opt/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
