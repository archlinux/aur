# Maintainer: Kimiblock Zhou <pn3535 at icloud dot com>
pkgname=stapxs-qq-lite-bin
_pkgname="Stapxs QQ Lite"
pkgver=2.7.12
_electronversion=27
pkgrel=1
epoch=
pkgdesc="一个兼容 oicq-http 的非官方网页版 QQ 客户端, 使用 Vue 重制的全新版本."
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
sha256sums=('2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
sha256sums_aarch64=('1c6be4eada7bf0dd5fd436b41509d43befc0785e0f997559e06275e59b92aa47')
sha256sums_x86_64=('4fd475e5b6fe445f2500e53fe365fc6563c3c6a295bd514f528d69a6c599d65d')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@cfgdirname@|${pkgname%-bin}|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|\"\/opt\/${_pkgname}\/${pkgname%-bin}\"|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
	for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
    	install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
			-t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
	done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/changelog.gz" -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
}