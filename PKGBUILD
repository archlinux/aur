# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Co-maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Based on extra/electron* by
# Bruno Pagani <archange@archlinux.org>
# Caleb Maclennan <caleb@alerque.com>
pkgname=electron43-bin
pkgver=43.8.13
pkgrel=1
pkgdesc="Build cross platform desktop apps with web technologies — prebuilt"
arch=(
	'aarch64'
	'armv7h'
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
source_armv7h=(
	"${pkgname%-bin}-chromedriver-${pkgver}-armv7h.zip::${_ghurl}/releases/download/v${pkgver}/chromedriver-v${pkgver}-linux-armv7l.zip"
	"${pkgname%-bin}-${pkgver}-armv7h.zip::${_ghurl}/releases/download/v${pkgver}/electron-v${pkgver}-linux-armv7l.zip"
)
source_x86_64=(
	"${pkgname%-bin}-chromedriver-${pkgver}-x86_64.zip::${_ghurl}/releases/download/v${pkgver}/chromedriver-v${pkgver}-linux-x64.zip"
	"${pkgname%-bin}-${pkgver}-x86_64.zip::${_ghurl}/releases/download/v${pkgver}/electron-v${pkgver}-linux-x64.zip"
)
sha256sums=('3fc91f3cbd94eeff7f37420454a13fc30b5f6caaaa4c338bc9d63530c4dcc728')
sha256sums_aarch64=('609acbcf7eefcffd7a58c81f7f632141ba640b860f8293bb3c9c304f967cb949'
                    '06480a3348efe145c02069b3469ff93f295802bd0a714a341ee67039091bf810')
sha256sums_armv7h=('29643dfb08fa4ef55be4b4fe0a7e47aa1ae2f1cb97587f585249d7debd85a3c4'
                   '3fa724976ad99d97719e5fba25e1c792b6b81cec0bf8329c52068bf8446dc8eb')
sha256sums_x86_64=('ec28de8f39cdad5125da42ce61ec1a15f4a20dbd9bef09dca9eb4c62ed038249'
                   'eeffe4c07910744a3548adf718e54a8275c067c66d734901788967466830ad11')
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
