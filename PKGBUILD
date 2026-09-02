# Maintainer: logan_reed <liulingzhang.work@icloud.com>
# Maintainer: Purofle <purofle@gmail.com>
# Contributor: Integral <integral@member.fsf.org>
# Contributor: SDCOM-0415
# Contributor: Kevin Li <qingtian805>

_pkgname=linuxqq
pkgname=linuxqq-nt
install=linuxqq-nt.install
pkgver=3.2.33_260902
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
source_x86_64=("https://qqdl.gtimg.cn/qqfile/QQNTV2/9.9.35/release/1763096b/QQ_3.2.33_260902_amd64_01.deb")
source_aarch64=("https://qqdl.gtimg.cn/qqfile/QQNTV2/9.9.35/release/1763096b/QQ_3.2.33_260902_arm64_01.deb")
source_loong64=("https://qqdl.gtimg.cn/qqfile/QQNTV2/9.9.35/release/1763096b/QQ_3.2.33_260902_loongarch64_01.deb")
b2sums=('714b68e91bdb5a24b5d92e9dd94490b32e0fb136de840fc87331f91ec5517db491c49dcf3f376083f4be79ed9da8795f60c0de34fb95ea868ae6130004b02991'
         '4b91ac5dcab7b2f92084bab0c81573efcc00b4c2b006be7abb9d6a35bdfcfe640b3a48e79008a08534571598f17f999533941b1a0529531468d48a3d5fbb70df')
b2sums_x86_64=('6b853b0f110de61ea7661637d9cd120423c794c0a1431314762cb83769900d5c1935dd28e9bbcd1bdf4a266aa4e8b1ab7a2e8d6681df6250280a540560be0fb1')
b2sums_aarch64=('c9b4caf81886b08d6cec8f9f40d0c54c5ed723d287f1c90f11fc61ca49959ee585e6f55b8d9711c5426f3f316dbae1c8d343b29ffb0216d99f3f1248863226e2')
b2sums_loong64=('442870b54a2f071a2370a13bc3de8a1d677933e2678ad6b496516097e15efd1200e08c93d233fee87b3010b6dbb88f53a83625c4a1754f4e41307a7931860803')
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
