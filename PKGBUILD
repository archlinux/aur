# Maintainer: Purofle <purofle@gmail.com>
# Contributor: Integral <luckys68@126.com>

pkgname=linuxqq
pkgver=3.2.3_19189
pkgrel=1
epoch=2
pkgdesc='New Linux QQ based on Electron'
arch=('x86_64' 'aarch64' 'loong64')
url="https://im.qq.com/linuxqq/"
license=('custom')
conflicts=('linuxqq-nt-bwrap')
depends=('nss' 'alsa-lib' 'gtk3' 'gjs' 'at-spi2-core' 'libvips' 'openjpeg2')
optdepends=('libappindicator-gtk3: Allow QQ to extend a menu via Ayatana indicators in Unity, KDE or Systray (GTK+ 3 library).')
source_x86_64=("https://dldir1.qq.com/qqfile/qq/QQNT/06d558c3/${pkgname}_${pkgver//_/-}_amd64.deb")
source_aarch64=("https://dldir1.qq.com/qqfile/qq/QQNT/06d558c3/${pkgname}_${pkgver//_/-}_arm64.deb")
source_loong64=("https://dldir1.qq.com/qqfile/qq/QQNT/06d558c3/${pkgname}_${pkgver//_/-}_loong64.deb")
source=("linuxqq.sh")
sha512sums=('8c92a5dcc2651a4ffb73425abbd8a567c4f043ec5b0614505273511260560a25ce8db30c6848977378921d860dc0a73eca083299706a585461587a48949e175c')
sha512sums_x86_64=('5cc9477034510739623eb2288d1e35e4fcb4396c22e70d6adada879f4053d0684fc8a84e33f24a49ffb414ca3658ccb1cd2992e1814411aa60f14de4d0c18559')
sha512sums_aarch64=('8d8e8b70ecb9e1092fd6734b752e632f6a20ecde1060f3b89abf5c3ab819598f79ad4092c5e76299b80e35c6625848dbc67f2bdddd8612114ff7f343f83ea1ea')
sha512sums_loong64=('ae7b11374efd02ba290cc19b00b07a98200da6034dc2e34188e63c2132d76dfa986f601825a713263194691f2b44600194dd7ebd80cf3e4fcf7095868217af61')

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
