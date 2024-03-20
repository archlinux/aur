# Maintainer: Purofle <purofle@gmail.com>
# Contributor: Integral <luckys68@126.com>

pkgname=linuxqq
pkgver=3.2.6_22165
pkgrel=1
epoch=2
pkgdesc='New Linux QQ based on Electron'
arch=('x86_64' 'aarch64' 'loong64')
url="https://im.qq.com/linuxqq/"
license=('LicenseRef-QQ')
conflicts=('linuxqq-nt-bwrap')
depends=('nss' 'alsa-lib' 'gtk3' 'gjs' 'at-spi2-core' 'libvips' 'openjpeg2')
optdepends=('libappindicator-gtk3: Allow QQ to extend a menu via Ayatana indicators in Unity, KDE or Systray (GTK+ 3 library).')
source_x86_64=("https://dldir1.qq.com/qqfile/qq/QQNT/e619e933/linuxqq_${pkgver/_/-}_amd64.deb")
source_aarch64=("https://dldir1.qq.com/qqfile/qq/QQNT/e619e933/linuxqq_${pkgver/_/-}_arm64.deb")
source_loong64=("https://dldir1.qq.com/qqfile/qq/QQNT/e619e933/linuxqq_${pkgver/_/-}_loongarch64.deb")
source=("linuxqq.sh")
sha512sums=('8c92a5dcc2651a4ffb73425abbd8a567c4f043ec5b0614505273511260560a25ce8db30c6848977378921d860dc0a73eca083299706a585461587a48949e175c')
sha512sums_x86_64=('21dd987639b4d5b4d1d8ac5b56495939b992cccc9f974d5af5d705b6fcda85e8c5ef539346bf6b685da3f7b9fcbae92a1b0d850c046a920097f44bcb0b40b622')
sha512sums_aarch64=('d5efa2e0e1d574c7bd71b9c333fd2f5a72f0029be4b40e756a5d9d1eb381bf3cbaf14e9a1119aea222f679d7e3f27febc4c5f479cf8fd8821a647573ae6984d1')
sha512sums_loong64=('7de360704987bd0f9b5b117f335d1ab0d25ae2fe00b5d50f97d4e43495c20dd7dbe55aa0ed450eaf8713c20f31121a8ef11771f08e6567c7744067ee3a904e30')

package() {
	echo "  -> Extracting the data.tar.xz..."
	bsdtar -xf data.tar.xz -C "${pkgdir}/"
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
