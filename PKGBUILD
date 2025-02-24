# Maintainer: Kimiblock Zhou <pn3535 at icloud dot com>
pkgname=stapxs-qq-lite-bin
_pkgname='Stapxs QQ Lite'
pkgver=3.1.0
_electronversion=31
pkgrel=1
epoch=
pkgdesc="A compatible OneBot protocol unofficial version of the web QQ client, electron client.(Prebuilt version.Use system-wide electron)一个兼容 oicq-http 的非官方网页版 QQ 客户端, 使用 Vue 重制的全新版本."
arch=(
    'aarch64'
    'x86_64'
)
url="https://stapxs.github.io/Stapxs-QQ-Lite-2.0/"
_ghurl="https://github.com/Stapxs/Stapxs-QQ-Lite-2.0"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_aarch64=('4589183730b1c6bf7267809d0c2ef6009b4c87dc85856159f4df71d21a069bcf')
sha256sums_x86_64=('ffd86a90e4193b60d14351fbe4c94efe45244f0c13d35052bc6e98990e9ca0db')
prepare() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@//g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i "s/\"\/opt\/${_pkgname}\/${pkgname%-bin}\"/${pkgname%-bin}/g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
    	install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
			-t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
	done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/changelog.gz" -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
}