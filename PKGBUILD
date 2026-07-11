# Maintainer: logan_reed <liulingzhang.work@icloud.com>
# Maintainer: Purofle <purofle@gmail.com>
# Contributor: Integral <integral@member.fsf.org>
# Contributor: SDCOM-0415
# Contributor: Kevin Li <qingtian805>

_pkgname=linuxqq
pkgname=linuxqq-nt
install=linuxqq-nt.install
pkgver=3.2.31_260710
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
source_x86_64=("https://qqdl.gtimg.cn/qqfile/QQNTV2/9.9.32/release/c390e792/QQ_3.2.31_260710_amd64_01.deb")
source_aarch64=("https://qqdl.gtimg.cn/qqfile/QQNTV2/9.9.32/release/c390e792/QQ_3.2.31_260710_arm64_01.deb")
source_loong64=("https://qqdl.gtimg.cn/qqfile/QQNTV2/9.9.32/release/c390e792/QQ_3.2.31_260710_loongarch64_01.deb")
b2sums=('bc9b456b857447a011f0bfb1571e41b4cd6e804ce12019f812f65dbc8a6d4ffea6099a951386129eafd2d1451313c09c49222ffe7fa90d65e02260e3a4e0f6dd'
         '502ee4db4a97bb6c08a153f1d04d79b609b0b90c2fda5b0bb93b839f84f0c9e57e2354a1dec5898038476f48bcd1d81160176f6dc1f9e5c849742eb4d2f7591a')
b2sums_x86_64=('23f43dc3540aea5f80dd003fcb68ec2cb0ccd0c22f160749221b0a66565ae0292480bc22b47101f243ec7676392482a9e698e7b7ef4c364859611a02188935f8')
b2sums_aarch64=('b41f80c58eb38ba8087584a28b17f27dd68b1ee61ecde783a3e7ae905afff35f31426cfb8593a8e07820674df07a2ac28ddd56d8cacace7d6aea387d4dda059c')
b2sums_loong64=('b484cdbb559e342f5c0d4ef2a123bb13afdb6de28be3afa9f072e5bde906a2c66c6db0aea60d7ee1f5041f96c73b9dc72ca4b27c75ea5cd4b19c9b48bff82a3e')
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
