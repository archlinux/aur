# Maintainer: Purofle <purofle@gmail.com>
# Contributor: Integral <luckys68@126.com>

pkgname=linuxqq
pkgver=3.2.5_21217
pkgrel=1
epoch=2
pkgdesc='New Linux QQ based on Electron'
arch=('x86_64' 'aarch64' 'loong64')
url="https://im.qq.com/linuxqq/"
license=('LicenseRef-QQ')
conflicts=('linuxqq-nt-bwrap')
depends=('nss' 'alsa-lib' 'gtk3' 'gjs' 'at-spi2-core' 'libvips' 'openjpeg2')
optdepends=('libappindicator-gtk3: Allow QQ to extend a menu via Ayatana indicators in Unity, KDE or Systray (GTK+ 3 library).')
source_x86_64=("https://dldir1.qq.com/qqfile/qq/QQNT/8fddf4ad/${pkgname}_${pkgver//_/-}_amd64.deb")
source_aarch64=("https://dldir1.qq.com/qqfile/qq/QQNT/8fddf4ad/${pkgname}_${pkgver//_/-}_arm64.deb")
source_loong64=("https://dldir1.qq.com/qqfile/qq/QQNT/8fddf4ad/${pkgname}_${pkgver//_/-}_loongarch64.deb")
source=("linuxqq.sh")
sha512sums=('8c92a5dcc2651a4ffb73425abbd8a567c4f043ec5b0614505273511260560a25ce8db30c6848977378921d860dc0a73eca083299706a585461587a48949e175c')
sha512sums_x86_64=('00aaa343d32898e3dc0f8f147310121a637b900841a284bc48edc09ed0ca876b9b007ee26354ad1d74de3d0a299d2eedf47eb393ea78e66fd3bf219cc2bb2541')
sha512sums_aarch64=('2dfe9a43423ca9f3b7fd8efd0db3a331c6dbf03fcdcfaaaeab275bacc70ebd19bfe88c9f6ea9d2ba6378409249ae6b5c23dd3861b3066a128f6a50c22cf310d9')
sha512sums_loong64=('4f8f778eec7a750d4c5000f51a3639ac5c555ff80e73d4372cd33c6ed8fee2fcae66df4fce5196b94cc9b7ce863538af01f505bcb3f487b1580df325aa9131d0')

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
