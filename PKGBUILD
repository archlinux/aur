# Maintainer: logan_reed <liulingzhang.work@icloud.com>
# Maintainer: Purofle <purofle@gmail.com>
# Contributor: Integral <integral@member.fsf.org>

_pkgname=linuxqq
pkgname=linuxqq-nt
install=linuxqq-nt.install
pkgver=3.2.23_260108
pkgrel=1
epoch=5
pkgdesc="New Linux QQ based on Electron"
arch=('x86_64' 'aarch64' 'loong64')
url="https://im.qq.com/${_pkgname}"
license=('LicenseRef-QQ')
conflicts=("${pkgname}-nt-bwrap" "linuxqq")
depends=('nss' 'alsa-lib' 'gtk3' 'gjs' 'at-spi2-core' 'libvips' 'openjpeg2' 'openslide')
optdepends=('libappindicator-gtk3: Allow QQ to extend a menu via Ayatana indicators in Unity, KDE or Systray (GTK+ 3 library).')
source_x86_64=('https://dldir1v6.qq.com/qqfile/qq/QQNT/Linux/QQ_3.2.23_260108_amd64_01.deb')
source_aarch64=('https://dldir1v6.qq.com/qqfile/qq/QQNT/Linux/QQ_3.2.23_260108_arm64_01.deb')
source_loong64=('https://dldir1v6.qq.com/qqfile/qq/QQNT/Linux/QQ_3.2.23_260108_loongarch64_01.deb')
source=("${_pkgname}.sh")
sha512sums=('e06676ac2297cba5d20877ac82ef506a9596980bc66257952f37d45ef9810953aedb789655d004b3fd0ac548f2f085e1be406081d9c8d5321622567431c7b3da')
sha512sums_x86_64=('acb42d676bdb9c64da4aa3f8ed1a2a4eaac73de75eac45928923f734fd34a2da00e90829b9a91d9d4c18fca3ee459c168b4217a2a462ce6aa32f95712cee87fe')
sha512sums_aarch64=('47f020739344d356f7f2807ba9bdc97def5a1b92307fc868a854d9abe4345f0bdffa6c156c76d85ff498d9fec97390acf21d7849eb13917fa8a44bf98e960a30')
sha512sums_loong64=('029c09790b3fb3c246646f5053859eada8543abf80c8aaf8895fd643f23f9df853b4cbd27a06433ce947b1ea90032f93642f3642ab09db2dcee50b99307c3d89')
options=('!strip' '!debug')

package() {
	echo "  -> Extracting the data.tar.xz..."
	bsdtar -xf data.tar.xz -C "${pkgdir}/"

	echo "  -> Installing..."
	# Launcher
	install -Dm755 "${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"

	# Launcher Fix
	sed -i '3s!/opt/QQ/qq!linuxqq!' "${pkgdir}/usr/share/applications/qq.desktop"

	# Icon Fix
	sed -i '6s!/usr/share/icons/hicolor/512x512/apps/qq.png!qq!' "${pkgdir}/usr/share/applications/qq.desktop"

	# License
	install -Dm644 "${pkgdir}/opt/QQ/LICENSE.electron.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dm644 "${pkgdir}/opt/QQ/LICENSES.chromium.html" -t "${pkgdir}/usr/share/licenses/${pkgname}/"

	# Temporary Solution: Remove libvips and libssh2 which comes from package "linuxqq" itself
	rm -fv ${pkgdir}/opt/QQ/resources/app/{sharp-lib/libvips-cpp.so.42,{,avsdk/bugly/}libssh2.so.1}
}