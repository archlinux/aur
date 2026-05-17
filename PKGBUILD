# Maintainer: logan_reed <liulingzhang.work@icloud.com>
# Maintainer: Purofle <purofle@gmail.com>
# Contributor: Integral <integral@member.fsf.org>

_pkgname=linuxqq
pkgname=linuxqq-nt
install=linuxqq-nt.install
pkgver=3.2.28_260429
pkgrel=1
epoch=5
pkgdesc="New Linux QQ based on Electron"
arch=('x86_64' 'aarch64' 'loong64')
url="https://im.qq.com/${_pkgname}"
license=('LicenseRef-QQ')
conflicts=('linuxqq-nt-bwrap' 'linuxqq')
provides=("linuxqq")
depends=('nss' 'alsa-lib' 'gtk3' 'gjs' 'at-spi2-core' 'libvips' 'openjpeg2' 'openslide')
optdepends=('libappindicator-gtk3: Allow QQ to extend a menu via Ayatana indicators in Unity, KDE or Systray (GTK+ 3 library).')
source_x86_64=('https://dldir1v6.qq.com/qqfile/qq/QQNT/Linux/QQ_3.2.28_260429_amd64_01.deb')
source_aarch64=('https://dldir1v6.qq.com/qqfile/qq/QQNT/Linux/QQ_3.2.28_260429_arm64_01.deb')
source_loong64=('https://dldir1v6.qq.com/qqfile/qq/QQNT/Linux/QQ_3.2.28_260429_loongarch64_01.deb')
source=("${_pkgname}.sh")
sha512sums=('fb1cbff3484aa008d4dd9a5d57a73551d522e7d90455a046b2ef4174db959b0aa075ed2d0180d0b7300a28455323e9b4683236bbfc55f15350b710be7b08b44e')
sha512sums_x86_64=('0f91db286b25915adfd57dbd66365f11f4e8d0614a5ce4eef659ee757e3c6464cefa8b290a1f74fa3c875e8c03d94a8fa873e88fe3b1b26c59e02fec5a8daeab')
sha512sums_aarch64=('5b5e776ea60bba750bb6ef6426e7089d54719056ab9acec85415c28238123caf23074a3e57e8354a64af75fb58ed4c3be56b6f1d3fef84bc0268489466dbc7b2')
sha512sums_loong64=('e0a3ac489b6ac681184df23f3127a34bf776b92a0ffa4739213a754fbf66c32893a1799d823c6e7f57743d895a9056a5ffb85bac5ee5b528a9af3d71b1755a64')
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