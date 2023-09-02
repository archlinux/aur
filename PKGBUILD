# Maintainer: Purofle <purofle@gmail.com>
# Contributor: Integral <luckys68@126.com>
pkgname=linuxqq
pkgver=3.2.0_16605
pkgrel=1
epoch=2
pkgdesc='New Linux QQ based on Electron'
arch=('x86_64' 'aarch64')
url="https://im.qq.com/linuxqq/"
license=('custom')
conflicts=('linuxqq-nt-bwrap')
depends=('nss' 'alsa-lib' 'gtk3' 'gjs' 'at-spi2-core' 'libvips' 'openjpeg2')
optdepends=('libappindicator-gtk3: Allow QQ to extend a menu via Ayatana indicators in Unity, KDE or Systray (GTK+ 3 library).')
source_x86_64=("https://dldir1.qq.com/qqfile/qq/QQNT/1776936e/${pkgname}_${pkgver//_/-}_amd64.deb")
source_aarch64=("https://dldir1.qq.com/qqfile/qq/QQNT/1776936e/${pkgname}_${pkgver//_/-}_arm64.deb")
source=("linuxqq.sh")
sha512sums=('796cd017fcd8305c0db08dcb99c53720d86669c5269a1c0cde39769a4b977e25dd4e3d405f34b232072dc117b87384a17d0e729c09ba6dbf3f643f717bcbcb3b')
sha512sums_x86_64=('d1668f9ef06f064203265cf6d27724d6a7b5f8ed171b8d3ab4c11019f923e6455115f10decfcde9586104bf811193b05c8ff57265fb7d7ee3966106c09c7e035')
sha512sums_aarch64=('eb18de0795b5c1eb43d5cc30883258b4e83332a5be1f2761152bb1571399dea1a499b3fd100f2a5c2a4fba3af2e241a1962a4c4c89841dfbd0c739bec41358e9')

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
