# Maintainer: logan_reed <liulingzhang.work@icloud.com>
# Maintainer: Purofle <purofle@gmail.com>
# Contributor: Integral <integral@member.fsf.org>
# Contributor: SDCOM-0415
# Contributor: Kevin Li <qingtian805>

_pkgname=linuxqq
pkgname=linuxqq-nt
install=linuxqq-nt.install
pkgver=3.2.35_54395
pkgrel=3
epoch=6
pkgdesc="New Linux QQ based on Electron"
arch=('x86_64' 'aarch64' 'loong64')
url="https://im.qq.com/${_pkgname}"
license=('LicenseRef-QQ')
conflicts=('linuxqq-nt-bwrap' 'linuxqq')
provides=("linuxqq=$pkgver")
depends=('nss' 'alsa-lib' 'gtk3' 'at-spi2-core' 'pulse-native-provider')
optdepends=('libappindicator-gtk3: System tray support'
            'gjs: Screen sharing support')
source=("${_pkgname}.sh" "linuxqq-get-url.sh")
source_x86_64=("https://qqdl.gtimg.cn/qqfile/QQNTV2/9.9.37/release/816b3c79/QQ_3.2.35_261103_amd64_01.deb")
source_aarch64=("https://qqdl.gtimg.cn/qqfile/QQNTV2/9.9.37/release/816b3c79/QQ_3.2.35_261103_arm64_01.deb")
source_loong64=("https://qqdl.gtimg.cn/qqfile/QQNTV2/9.9.37/release/816b3c79/QQ_3.2.35_261103_loongarch64_01.deb")
b2sums=('714b68e91bdb5a24b5d92e9dd94490b32e0fb136de840fc87331f91ec5517db491c49dcf3f376083f4be79ed9da8795f60c0de34fb95ea868ae6130004b02991'
         '4b91ac5dcab7b2f92084bab0c81573efcc00b4c2b006be7abb9d6a35bdfcfe640b3a48e79008a08534571598f17f999533941b1a0529531468d48a3d5fbb70df')
b2sums_x86_64=('1f4c16bac9fee6ebb2d23395822a20c0c6ed4a6d206ebf2b3623c7141789d39dbf171b49c3a5824577ce62d4b2205cf6a432724e1f400176eda4e170cd284169')
b2sums_aarch64=('8d09c561ba9348b4a0b79001726cb45c9b9f466552ac6dba73c86d83483450bcccf0b6c6cc7501de31bdb84129efa095c593ade062938817488659121b89d2d1')
b2sums_loong64=('68abc59d432c151019b944eb8fb2185644c6a8a8b140ee682e24c3bd6369580176f653cde73f88b7a75b87fc26f1316d63a3a1c76622d2f26f027a57758191e9')
options=('!strip' '!debug')

# QQ 的 deb 包下载需先经 im.qq.com 的 GetSign 签名，直接请求 qqdl.gtimg.cn 上的原始 URL 会被拒绝。
DLAGENTS=('https::/usr/bin/bash linuxqq-get-url.sh --dlagent %u %o')

package() {
	bsdtar -xf data.tar.xz -C "${pkgdir}/"

	# Launcher
	install -Dm755 "${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"

	# Desktop entry fixes
	sed -i 's|Exec=/opt/QQ/qq|Exec=linuxqq|' "${pkgdir}/usr/share/applications/qq.desktop"
	sed -i 's|Icon=/usr/share/icons/hicolor/512x512/apps/qq.png|Icon=qq|' "${pkgdir}/usr/share/applications/qq.desktop"

	# License
	install -Dm644 "${pkgdir}/opt/QQ/LICENSE.electron.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dm644 "${pkgdir}/opt/QQ/LICENSES.chromium.html" -t "${pkgdir}/usr/share/licenses/${pkgname}/"

	# SUID sandbox
	chmod 4755 "${pkgdir}/opt/QQ/chrome-sandbox"

	# Remove macOS files
	rm -fv "${pkgdir}/opt/QQ/resources/app/"*.dylib
}
