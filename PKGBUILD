# Maintainer: Purofle <purofle@gmail.com>
# Contributor: Integral <luckys68@126.com>

pkgname=linuxqq
pkgver=3.2.5_21453
pkgrel=2
epoch=2
pkgdesc='New Linux QQ based on Electron'
arch=('x86_64' 'aarch64' 'loong64')
url="https://im.qq.com/linuxqq/"
license=('LicenseRef-QQ')
conflicts=('linuxqq-nt-bwrap')
depends=('nss' 'alsa-lib' 'gtk3' 'gjs' 'at-spi2-core' 'libvips' 'openjpeg2')
optdepends=('libappindicator-gtk3: Allow QQ to extend a menu via Ayatana indicators in Unity, KDE or Systray (GTK+ 3 library).')
source_x86_64=("https://dldir1.qq.com/qqfile/qq/QQNT/852276c1/${pkgname}_${pkgver//_/-}_amd64.deb")
source_aarch64=("https://dldir1.qq.com/qqfile/qq/QQNT/852276c1/${pkgname}_${pkgver//_/-}_arm64.deb")
source_loong64=("https://dldir1.qq.com/qqfile/qq/QQNT/852276c1/${pkgname}_${pkgver//_/-}_loongarch64.deb")
source=("linuxqq.sh")
sha512sums=('8c92a5dcc2651a4ffb73425abbd8a567c4f043ec5b0614505273511260560a25ce8db30c6848977378921d860dc0a73eca083299706a585461587a48949e175c')
sha512sums_x86_64=('453eb6093a69840e4282ce8400b7be7d78147618e3279f6dab135536facb097a169d328c142b319ffc33b8e29297d491d63628ca55f32fbe5453ef4305a62095')
sha512sums_aarch64=('8343f5034332557803755378e06501bb16d477b02b8fbccd6d2c4b61ef425b1b1130514b72d2411f7470d6d5f9d02e453429e66b33d3804d49b70c65a01c5e5c')
sha512sums_loong64=('a1e70dff98ea3c7e3268fd5362f15b8fb2691ccc5b4cbe6004389ce818c2c519618e65b9635d013fafc8b815dacd3e3078ced30e30083d8d5f1a6b72c68fdd5e')

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
