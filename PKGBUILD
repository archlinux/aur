# Maintainer: logan_reed <liulingzhang.work@icloud.com>
# Maintainer: Purofle <purofle@gmail.com>
# Contributor: Integral <integral@member.fsf.org>
# Contributor: SDCOM-0415
# Contributor: Kevin Li <qingtian805>

_pkgname=linuxqq
pkgname=linuxqq-nt
install=linuxqq-nt.install
pkgver=3.2.31_260710
pkgrel=2
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
source_x86_64=("https://qqdl.gtimg.cn/qqfile/QQNTV2/9.9.32/release/c390e792/QQ_3.2.31_260710_amd64_01.deb")
source_aarch64=("https://qqdl.gtimg.cn/qqfile/QQNTV2/9.9.32/release/c390e792/QQ_3.2.31_260710_arm64_01.deb")
source_loong64=("https://qqdl.gtimg.cn/qqfile/QQNTV2/9.9.32/release/c390e792/QQ_3.2.31_260710_loongarch64_01.deb")
b2sums=('bc9b456b857447a011f0bfb1571e41b4cd6e804ce12019f812f65dbc8a6d4ffea6099a951386129eafd2d1451313c09c49222ffe7fa90d65e02260e3a4e0f6dd'
         '502ee4db4a97bb6c08a153f1d04d79b609b0b90c2fda5b0bb93b839f84f0c9e57e2354a1dec5898038476f48bcd1d81160176f6dc1f9e5c849742eb4d2f7591a')
b2sums_x86_64=('234a0f338d47e952995a1d4cf1dc782e5266623f878b92af264753b8c032fd31450169e1e25c8d10d37e26848c28dbb0302732874bbfce1566f8ad2b89e0337b')
b2sums_aarch64=('e31096831099d3a9285443e62344d7ec451a9b991283f803e568ae61ab578b3de79ffd6d2bfbf69923a62715428a13cfcd33e2682d4d873d38add44e66ddf135')
b2sums_loong64=('ef51070de26b8f33fedb1f70abe3d348aef90b47405ac74f181dd696ce4288fcf657e4c13014807a1069b56a547ca4be64673cd05f9e7ddf62df2d445af8bb9d')
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
