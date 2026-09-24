# Maintainer: logan_reed <liulingzhang.work@icloud.com>
# Maintainer: Purofle <purofle@gmail.com>
# Contributor: Integral <integral@member.fsf.org>
# Contributor: SDCOM-0415
# Contributor: Kevin Li <qingtian805>

_pkgname=linuxqq
pkgname=linuxqq-nt
install=linuxqq-nt.install
pkgver=3.2.34_53644
pkgrel=1
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
source_x86_64=("https://qqdl.gtimg.cn/qqfile/QQNTV2/9.9.36/release/9ee04bef/QQ_3.2.34_260924_amd64_01.deb")
source_aarch64=("https://qqdl.gtimg.cn/qqfile/QQNTV2/9.9.36/release/9ee04bef/QQ_3.2.34_260924_arm64_01.deb")
source_loong64=("https://qqdl.gtimg.cn/qqfile/QQNTV2/9.9.36/release/9ee04bef/QQ_3.2.34_260924_loongarch64_01.deb")
b2sums=('714b68e91bdb5a24b5d92e9dd94490b32e0fb136de840fc87331f91ec5517db491c49dcf3f376083f4be79ed9da8795f60c0de34fb95ea868ae6130004b02991'
         '4b91ac5dcab7b2f92084bab0c81573efcc00b4c2b006be7abb9d6a35bdfcfe640b3a48e79008a08534571598f17f999533941b1a0529531468d48a3d5fbb70df')
b2sums_x86_64=('fc01456996ebd3413793159b76558c4a28ad35051ceb00592237902aca1acfb1cfb09cdba156dbf5029fcd961b8f00d9aaa229ca256f4945138fbac127b7cff0')
b2sums_aarch64=('0b155eb94093fcf7e3323d9b0df435ed709d2a2375aecf6b71786989d9a7de720400de5029aa6bd6900c645eb7eeb321923dce1fc9a0c8a55622c0e951d9bd63')
b2sums_loong64=('e31a53c74344e60f5f96d76a52e6a556c7345efc6556c8b2b846f5079aac632f23ee68da22e23c79447097235aeaf7995928c983ab6e2b421b14585c2f311068')
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
