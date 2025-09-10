# Maintainer: xycloud <xycldw@gmail.com>

pkgname=ticktick-cn
pkgver=6.0.40
pkgrel=1
pkgdesc='Official TickTick desktop application (Chinese edition)'
arch=('x86_64' 'aarch64')
url='https://www.dida365.com/download'
license=('custom:Proprietary')
install=${pkgname}.install
conflicts=('ticktick' 'ticktick-nativefier')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'libatspi.so'
	'util-linux-libs' 'libappindicator-gtk3' 'libsecret')
source=("${pkgname}.sh" 'LICENSE')
source_x86_64=("dida-${pkgver}-amd64.deb::https://cdn.dida365.cn/download/linux/linux_deb_x64/dida-${pkgver}-amd64.deb")
source_aarch64=("dida-${pkgver}-arm64.deb::https://cdn.dida365.cn/download/linux/linux_deb_arm64/dida-${pkgver}-arm64.deb")
sha256sums=('SKIP'
            'SKIP')
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
	tar -xf data.tar.xz -C "${pkgdir}"

	# Replace default path to system symlink
	sed -i "s|^Exec=.*|Exec=/usr/bin/${pkgname} --uri=%U|" "${pkgdir}/usr/share/applications/dida.desktop"

	# Copy launch script to allow custom flags
	install -Dm 755 ${pkgname}.sh "${pkgdir}/usr/bin/${pkgname}"

	# Install license from upstream ToS
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	mv "${pkgdir}/opt/dida/LICENSE.electron.txt" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
	mv "${pkgdir}/opt/dida/LICENSES.chromium.html" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"

	# SUID chrome-sandbox for Electron 5+
	chmod 4755 "${pkgdir}/opt/dida/chrome-sandbox"
}

