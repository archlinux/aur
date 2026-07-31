# Maintainer: logan_reed <liulingzhang.work@icloud.com>
# Maintainer: Purofle <purofle@gmail.com>
# Contributor: Integral <integral@member.fsf.org>
# Contributor: SDCOM-0415
# Contributor: Kevin Li <qingtian805>

_pkgname=linuxqq
pkgname=linuxqq-nt
install=linuxqq-nt.install
pkgver=3.2.32_260730
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
source_x86_64=("https://qqdl.gtimg.cn/qqfile/QQNT/9.9.33/release/c97651b2/QQ_3.2.32_260730_amd64_01.deb")
source_aarch64=("https://qqdl.gtimg.cn/qqfile/QQNT/9.9.33/release/c97651b2/QQ_3.2.32_260730_arm64_01.deb")
source_loong64=("https://qqdl.gtimg.cn/qqfile/QQNT/9.9.33/release/c97651b2/QQ_3.2.32_260730_loongarch64_01.deb")
b2sums=('bc9b456b857447a011f0bfb1571e41b4cd6e804ce12019f812f65dbc8a6d4ffea6099a951386129eafd2d1451313c09c49222ffe7fa90d65e02260e3a4e0f6dd'
         '502ee4db4a97bb6c08a153f1d04d79b609b0b90c2fda5b0bb93b839f84f0c9e57e2354a1dec5898038476f48bcd1d81160176f6dc1f9e5c849742eb4d2f7591a')
b2sums_x86_64=('d13ee2873b86d68e6b1fb65836debfcc3c79627510dd6c83f85218ecaf1a6387373eb44cd74fe8d8bc4f8347a4decfd38ec7332a6252e809694f079068be08b3')
b2sums_aarch64=('35474676dd624e2431d5dcc28295355d62968905a085b1c4e8340c5985500678889628109d6d719c53d3718dd870de2c02a1dea306943e76aca1822767021687')
b2sums_loong64=('55c34a9e3b832a2d0a4839879bf57a0a7e9e9f65e7a5701bdd09a2fcf06bc1505a6da76ec4073ddf71800f6548e94d3e736e304c8df95d627be083493c3be96e')
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
