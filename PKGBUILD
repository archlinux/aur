# Maintainer: Purofle <purofle@gmail.com>
# Contributor: Integral <luckys68@126.com>
pkgname=linuxqq
pkgver=3.1.0_9572
pkgrel=2
epoch=2
pkgdesc='New Linux QQ based on Electron'
arch=('x86_64' 'aarch64')
url="https://im.qq.com/linuxqq/"
license=('custom')
conflicts=('linuxqq-nt-bwrap')
depends=('nss' 'alsa-lib' 'gtk3' 'gjs' 'at-spi2-core' 'libvips')
optdepends=('libappindicator-gtk3: Allow QQ to extend a menu via Ayatana indicators in Unity, KDE or Systray (GTK+ 3 library).')
source_x86_64=("https://dldir1.qq.com/qqfile/qq/QQNT/4b2e3220/${pkgname}_${pkgver//_/-}_amd64.deb")
source_aarch64=("https://dldir1.qq.com/qqfile/qq/QQNT/4b2e3220/${pkgname}_${pkgver//_/-}_arm64.deb")
sha512sums_x86_64=('f109f8533d351bd31609c7766dc9fd7e86682769c7c48fc640a5b457d9cb0ea25fe5dea03cb1d2d97b7c381c3ddb2680549f8b1e8bd523c4efe98bee91f5933f')
sha512sums_aarch64=('223ac51bdc96412d211398fa50d02111cd171f7ccec4b2975b53899ae918d567dec61873760bb6de3942846b8c5606d7eae465bef5695dd440c9da67798bdaa4')

package() {
	echo "  -> Extracting the data.tar.xz..."
	bsdtar -xvf data.tar.xz -C "${pkgdir}/"

	echo "  -> Installing..."
	# Launcher
	install -d "${pkgdir}/usr/bin/"
	ln -s "/opt/QQ/qq" "${pkgdir}/usr/bin/${pkgname}"

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
