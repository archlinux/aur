# Maintainer: logan_reed <liulingzhang.work@icloud.com>
# Maintainer: Purofle <purofle@gmail.com>
# Contributor: Integral <integral@member.fsf.org>
# Contributor: SDCOM-0415
# Contributor: Kevin Li <qingtian805>

_pkgname=linuxqq
pkgname=linuxqq-nt
install=linuxqq-nt.install
pkgver=3.2.32_260812
pkgrel=1
epoch=5
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
source_x86_64=("https://qqdl.gtimg.cn/qqfile/QQNT/9.9.33/release/3f89efc5/QQ_3.2.32_260812_amd64_01.deb")
source_aarch64=("https://qqdl.gtimg.cn/qqfile/QQNT/9.9.33/release/3f89efc5/QQ_3.2.32_260812_arm64_01.deb")
source_loong64=("https://qqdl.gtimg.cn/qqfile/QQNT/9.9.33/release/3f89efc5/QQ_3.2.32_260812_loongarch64_01.deb")
b2sums=('714b68e91bdb5a24b5d92e9dd94490b32e0fb136de840fc87331f91ec5517db491c49dcf3f376083f4be79ed9da8795f60c0de34fb95ea868ae6130004b02991'
         '4b91ac5dcab7b2f92084bab0c81573efcc00b4c2b006be7abb9d6a35bdfcfe640b3a48e79008a08534571598f17f999533941b1a0529531468d48a3d5fbb70df')
b2sums_x86_64=('1185004eb2c9539bde5feea59c8902a2f6f997cb0d215918bfd8b16b26000c6425529ea7309c54659e1dc00e022f7afc4feea16237f21ab6995900479eab1054')
b2sums_aarch64=('b39bfa2d8e25fd4f85e17011a474cccd8b55a4ea2beb4f8582bcf9b2f3b889d5c393979abdfde80e224cfa5d73a5cfe7f5895051177113c4b8d40999f737d92d')
b2sums_loong64=('636ca3472f33ec170c8aa77de1405f973eb8c29fab1101828318266958ff1f988e11f7cfda89998bb4b7278c12d9d71ee5953d6f6b7a136e890effb53ffe6706')
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
