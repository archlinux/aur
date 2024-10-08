# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Ariel Abreu <facekapow@outlook.com>
pkgname=gitify-bin
_pkgname=Gitify
pkgver=5.15.0
_electronversion=32
pkgrel=1
pkgdesc="GitHub notifications on your menu bar.Prebuilt version.Use system-wide electron."
arch=('x86_64')
url="https://www.gitify.io/"
_ghurl="https://github.com/gitify-app/gitify"
license=('MIT')
depends=(
	"electron${_electronversion}"
)
source=(
	"${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
	"LICENSE-${pkgver}::https://raw.githubusercontent.com/gitify-app/gitify/v$pkgver/LICENSE"
	"${pkgname%-bin}.sh"
)
sha256sums=('65eff395da127bc00daf08b4f719a3fe61894abd9cfdad52643688088ff7ec24'
            'e3583a920d79b28287ca8bf4b021c6cbeba746a75073c0c68b0aa64ff0b38961'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
build() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
	sed -i "s/\/opt\/${_pkgname}\/${pkgname%-bin}/${pkgname%-bin}/g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
    	install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
			-t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
	done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}