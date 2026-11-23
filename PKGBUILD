# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Co-maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Based on extra/electron* by
# Bruno Pagani <archange@archlinux.org>
# Caleb Maclennan <caleb@alerque.com>
pkgname=electron46-bin
_mainver=46.0.0
_betaver=alpha.12
pkgver="${_mainver}${_betaver//./}"
pkgrel=1
pkgdesc="Build cross platform desktop apps with web technologies — prebuilt"
arch=(
	'aarch64'
	'x86_64'
)
url='https://electronjs.org'
_ghurl="https://github.com/electron/electron"
license=(
	'MIT'
	'LicenseRef-custom'
)
provides=(
	"${pkgname%-bin}=${pkgver}"
)
conflicts=("${pkgname%-bin}")
depends=(
	'alsa-lib'
	'gtk3'
	'nss'
)
optdepends=(
	'kde-cli-tools: file deletion support (kioclient5)'
	'pipewire: WebRTC desktop sharing under Wayland'
	'qt6-base: enable Qt6 with --enable-features=AllowQt'
	'gtk4: for --gtk-version=4 (GTK4 IME might work better on Wayland)'
	'trash-cli: file deletion support (trash-put)'
	"xdg-utils: open URLs with desktop's default (xdg-email, xdg-open)"
)
noextract=(
	"${pkgname%-bin}-chromedriver-${pkgver}-${CARCH}.zip"
	"${pkgname%-bin}-${pkgver}-${CARCH}.zip"
)
source=("${pkgname%-bin}.sh")
source_aarch64=(
	"${pkgname%-bin}-chromedriver-${pkgver}-aarch64.zip::${_ghurl}/releases/download/v${_mainver}-${_betaver}/chromedriver-v${_mainver}-${_betaver}-linux-arm64.zip"
	"${pkgname%-bin}-${pkgver}-aarch64.zip::${_ghurl}/releases/download/v${_mainver}-${_betaver}/electron-v${_mainver}-${_betaver}-linux-arm64.zip"
)
source_x86_64=(
	"${pkgname%-bin}-chromedriver-${pkgver}-x86_64.zip::${_ghurl}/releases/download/v${_mainver}-${_betaver}/chromedriver-v${_mainver}-${_betaver}-linux-x64.zip"
	"${pkgname%-bin}-${pkgver}-x86_64.zip::${_ghurl}/releases/download/v${_mainver}-${_betaver}/electron-v${_mainver}-${_betaver}-linux-x64.zip"
)
sha256sums=('3721240f57668b7ed7970b7fc2dcb9a548acf4956a5b1406d0193af296b8ffad')
sha256sums_aarch64=('90e35f8d248a186367d58ebba97a6955b7eb10ddd3cf266f5a81fa5ab76d9fbd'
                    'dbf40a4ac2489ee77930f1bfb52f1232e6737a7dc992fb91b6cf8b966658cfda')
sha256sums_x86_64=('388e76a8327fd224115fdb743fd2ca344b0fa93fe9c47e9381a6258fd1453569'
                    '6be2bdd1b23dec6aed85a853524b76f7949df84326933f2de661a650cad54c34')
prepare() {
	sed -i "s/@ELECTRON@/${pkgname%-bin}/g" "${srcdir}/${pkgname%-bin}.sh"
	install -Dm755 -d "${srcdir}/${pkgname%-bin}"
	bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.zip" -C "${srcdir}/${pkgname%-bin}"
	bsdtar -xf "${srcdir}/${pkgname%-bin}-chromedriver-${pkgver}-${CARCH}.zip" -C "${srcdir}/${pkgname%-bin}"
	rm -rf "${srcdir}/${pkgname%-bin}/"{gen,chromedriver.debug}
	chmod u+s "${srcdir}/${pkgname%-bin}/chrome-sandbox"
}
package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
	install -Dm755 -d "${pkgdir}/usr/lib"
	cp -a "${srcdir}/${pkgname%-bin}" "${pkgdir}/usr/lib"
	rm -rf "${pkgdir}/usr/lib/${pkgname%-bin}/LICENSE"*
	install -Dm644 "${srcdir}/${pkgname%-bin}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}