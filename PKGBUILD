# Maintainer: Purofle <purofle@gmail.com>
# Contributor: Integral <luckys68@126.com>

pkgname=linuxqq
pkgver=3.2.5_21159
pkgrel=1
epoch=2
pkgdesc='New Linux QQ based on Electron'
arch=('x86_64' 'aarch64' 'loong64')
url="https://im.qq.com/linuxqq/"
license=('custom')
conflicts=('linuxqq-nt-bwrap')
depends=('nss' 'alsa-lib' 'gtk3' 'gjs' 'at-spi2-core' 'libvips' 'openjpeg2')
optdepends=('libappindicator-gtk3: Allow QQ to extend a menu via Ayatana indicators in Unity, KDE or Systray (GTK+ 3 library).')
source_x86_64=("https://dldir1.qq.com/qqfile/qq/QQNT/feb78c41/${pkgname}_${pkgver//_/-}_amd64.deb")
source_aarch64=("https://dldir1.qq.com/qqfile/qq/QQNT/feb78c41/${pkgname}_${pkgver//_/-}_arm64.deb")
source_loong64=("https://dldir1.qq.com/qqfile/qq/QQNT/feb78c41/${pkgname}_${pkgver//_/-}_loongarch64.deb")
source=("linuxqq.sh")
sha512sums=('8c92a5dcc2651a4ffb73425abbd8a567c4f043ec5b0614505273511260560a25ce8db30c6848977378921d860dc0a73eca083299706a585461587a48949e175c')
sha512sums_x86_64=('4cd87c2f60bfcab1859f50e0b407e451e5ed20ed152f3dcdce0b550d5d25820b471a9e55564b2f7e22a02ae741c0dcb9f44911d1964115146f6ac674441d6fc0')
sha512sums_aarch64=('e7844b335474270b345d7343ce7867afda5b8ac7fa7b8df2b0b01bcd4da429c16100e14ef94ba7e2f16f23ecbbf89367e740383f117aca8e2b31d4a800ec67dc')
sha512sums_loong64=('42637b26f5277094990c4dd7fd23f5cabaff5d1ce2bf6aff65e93aa4b873e990fec4188e77f204dfa966c69e378e68d2440b20b63d5aa0651f6b28f6e190a011')

package() {
	echo "  -> Extracting the data.tar.xz..."
	bsdtar -xvf data.tar.xz -C "${pkgdir}/"
	rm -f "${pkgdir}/opt/QQ/resources/app/libssh2.so.1" # Temporary Fix

	echo "  -> Installing..."
	# Launcher
	install -Dm755 "${srcdir}/linuxqq.sh" "${pkgdir}/usr/bin/${pkgname}"

	# Launcher Fix
	sed -i '3s!/opt/QQ/qq!linuxqq!' "${pkgdir}/usr/share/applications/qq.desktop"

	# Icon Fix
	sed -i '6s!/usr/share/icons/hicolor/512x512/apps/qq.png!qq!' "${pkgdir}/usr/share/applications/qq.desktop"

	# License
	install -Dm644 "${pkgdir}/opt/QQ/LICENSE.electron.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dm644 "${pkgdir}/opt/QQ/LICENSES.chromium.html" -t "${pkgdir}/usr/share/licenses/${pkgname}/"

	# Temporary Solution: Remove libvips which comes from package "linuxqq" itself
	rm -f "${pkgdir}/opt/QQ/resources/app/sharp-lib/libvips-cpp.so.42"
}
