# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Co-maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Based on extra/electron* by
# Bruno Pagani <archange@archlinux.org>
# Caleb Maclennan <caleb@alerque.com>
pkgname=electron45-bin
pkgver=45.4.1
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
	"${pkgname%-bin}-chromedriver-${pkgver}-aarch64.zip::${_ghurl}/releases/download/v${pkgver}/chromedriver-v${pkgver}-linux-arm64.zip"
	"${pkgname%-bin}-${pkgver}-aarch64.zip::${_ghurl}/releases/download/v${pkgver}/electron-v${pkgver}-linux-arm64.zip"
)
source_x86_64=(
	"${pkgname%-bin}-chromedriver-${pkgver}-x86_64.zip::${_ghurl}/releases/download/v${pkgver}/chromedriver-v${pkgver}-linux-x64.zip"
	"${pkgname%-bin}-${pkgver}-x86_64.zip::${_ghurl}/releases/download/v${pkgver}/electron-v${pkgver}-linux-x64.zip"
)
sha256sums=('cea9f99f6d0a9a8bab239ffd2192dca3adf4f769b3123a2f366983c82d572ac9')
sha256sums_aarch64=('61256e9c154a83232289f2993b85bc279b08080c332f5eeae6da8d6565183c57'
					'3da04c450fa682e3b80961e92a918a1c2a1a10796527a7e63dec7b8e466b6334')
sha256sums_x86_64=('6d46447609d5ede261ba068ecacca87ed40ae4a8aa6cc50445cd9ea341e260d1'
					'e1d077c7a087d7e344350ea0c5cd2b7dc5af3d9bf7979474f38e0fc1a560b875')
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