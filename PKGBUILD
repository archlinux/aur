# Maintainer: Purofle <purofle@gmail.com>
# Contributor: Integral <luckys68@126.com>
pkgname=linuxqq
pkgver=3.2.0_16449
pkgrel=1
epoch=2
pkgdesc='New Linux QQ based on Electron'
arch=('x86_64' 'aarch64')
url="https://im.qq.com/linuxqq/"
license=('custom')
conflicts=('linuxqq-nt-bwrap')
depends=('nss' 'alsa-lib' 'gtk3' 'gjs' 'at-spi2-core' 'libvips' 'openjpeg2')
optdepends=('libappindicator-gtk3: Allow QQ to extend a menu via Ayatana indicators in Unity, KDE or Systray (GTK+ 3 library).')
source_x86_64=("https://dldir1.qq.com/qqfile/qq/QQNT/464d27bd/${pkgname}_${pkgver//_/-}_amd64.deb")
source_aarch64=("https://dldir1.qq.com/qqfile/qq/QQNT/464d27bd/${pkgname}_${pkgver//_/-}_arm64.deb")
source=("linuxqq.sh")
sha512sums=('796cd017fcd8305c0db08dcb99c53720d86669c5269a1c0cde39769a4b977e25dd4e3d405f34b232072dc117b87384a17d0e729c09ba6dbf3f643f717bcbcb3b')
sha512sums_x86_64=('af71f6ecf9a1a85fe3a6349b7f0ec82f8043739f04174856551e967854210cf2c84c146e10c588a4695ca42a446ceefa6750dabc432b0b84718284a86354bdcd')
sha512sums_aarch64=('e4ddd3c99d33f26be2f4b1c39b0b5c3280d9afebd21c22e4c5bdf09910bff140bc0b83f519c6f4f815601252c088cddcff118047c411241c4a9ed276f00bb1a7')

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
