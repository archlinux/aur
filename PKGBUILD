# Maintainer: logan_reed <liulingzhang.work@icloud.com>
# Maintainer: Purofle <purofle@gmail.com>
# Contributor: Integral <integral@member.fsf.org>
# Contributor: SDCOM-0415
# Contributor: Kevin Li <qingtian805>

_pkgname=linuxqq
pkgname=linuxqq-nt
install=linuxqq-nt.install
pkgver=3.2.29_260528
pkgrel=3
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
source_x86_64=('https://qqdl.gtimg.cn/qqfile/QQNT/9.9.31/release/00e6a3e7/QQ_3.2.29_260528_amd64_01.deb')
source_aarch64=('https://qqdl.gtimg.cn/qqfile/QQNT/9.9.31/release/00e6a3e7/QQ_3.2.29_260528_arm64_01.deb')
source_loong64=('https://qqdl.gtimg.cn/qqfile/QQNT/9.9.31/release/00e6a3e7/QQ_3.2.29_260528_loongarch64_01.deb')
source=("${_pkgname}.sh")
b2sums=('bc9b456b857447a011f0bfb1571e41b4cd6e804ce12019f812f65dbc8a6d4ffea6099a951386129eafd2d1451313c09c49222ffe7fa90d65e02260e3a4e0f6dd')
b2sums_x86_64=('548803444e83529368d8a0c176a817367b3244a2e874391a9683be48608b11572f047d5f8ecd3b5ef94c6bc4ecdb1cd35afe3fae78f85ff40b2107e764fa498a')
b2sums_aarch64=('1eaf84ba5c6387d697f2f995f769b01f970de7e1cc29239cf6ec47b3a0f492509c29178ebfcadba58d3583a30770d2a38b8e9cff1bb4c06f554c2f2b4248ca62')
b2sums_loong64=('3f07a534f500b242fda9fc4bf8ac559e9c6699fe2f63aa936cf2e9727ad3e3b5805cdab446f502b74f6239592f767c8ef593b7aefea5f2da41a9ea48efc74a8c')
options=('!strip' '!debug')

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
