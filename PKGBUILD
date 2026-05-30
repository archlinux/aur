# Maintainer: logan_reed <liulingzhang.work@icloud.com>
# Maintainer: Purofle <purofle@gmail.com>
# Contributor: Integral <integral@member.fsf.org>

_pkgname=linuxqq
pkgname=linuxqq-nt
install=linuxqq-nt.install
pkgver=3.2.29_260528
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
source_x86_64=('https://qqdl.gtimg.cn/qqfile/QQNT/9.9.31/release/00e6a3e7/QQ_3.2.29_260528_amd64_01.deb')
source_aarch64=('https://qqdl.gtimg.cn/qqfile/QQNT/9.9.31/release/00e6a3e7/QQ_3.2.29_260528_arm64_01.deb')
source_loong64=('https://qqdl.gtimg.cn/qqfile/QQNT/9.9.31/release/00e6a3e7/QQ_3.2.29_260528_loongarch64_01.deb')
source=("${_pkgname}.sh")
sha512sums=('e38b83e5e37534d07f3fde11e30f6cfddc2c8faee6e9ee0c1108d003347de66e68a0eb23412a353bd007c196c4fb8f47a4d62d9ee9b3843ef606c5de2be383bf')
sha512sums_x86_64=('3e214621b34b5eb3706451c94d19d4a09a59ad6b415e9a719db8d635bcb0900445cd6d468ffdb293b9b2c032e6b551d8d8090b390979ce782db5de30791f467d')
sha512sums_aarch64=('a0e7773b111ffb76f403fb322d4bd7e865b5b10ce70b2b3163b7db42218d960d212a585fe2ac9b09f4dcdeb783013d29fd9e2d534bff4c5414e63bf49e789648')
sha512sums_loong64=('0b15317df8cbd7f600b08b3fff88edf88bd1cd52908790366ba52a36b1bb27326b5f88e7bf0a4d910b79077ba96c6a3b72f3518c7952b790b28554fac79b0408')
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
