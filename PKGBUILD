# Maintainer: logan_reed <liulingzhang.work@icloud.com>
# Maintainer: Purofle <purofle@gmail.com>
# Contributor: Integral <integral@member.fsf.org>

_pkgname=linuxqq
pkgname=linuxqq-nt
install=linuxqq-nt.install
pkgver=3.2.22_251203
pkgrel=1
epoch=5
pkgdesc="New Linux QQ based on Electron"
arch=('x86_64' 'aarch64' 'loong64')
url="https://im.qq.com/${_pkgname}"
license=('LicenseRef-QQ')
conflicts=("${pkgname}-nt-bwrap" "linuxqq")
depends=('nss' 'alsa-lib' 'gtk3' 'gjs' 'at-spi2-core' 'libvips' 'openjpeg2' 'openslide')
optdepends=('libappindicator-gtk3: Allow QQ to extend a menu via Ayatana indicators in Unity, KDE or Systray (GTK+ 3 library).')
source_x86_64=('https://dldir1v6.qq.com/qqfile/qq/QQNT/Linux/QQ_3.2.22_251203_amd64_01.deb')
source_aarch64=('https://dldir1v6.qq.com/qqfile/qq/QQNT/Linux/QQ_3.2.22_251203_arm64_01.deb')
source_loong64=('https://dldir1v6.qq.com/qqfile/qq/QQNT/Linux/QQ_3.2.22_251203_loongarch64_01.deb')
source=("${_pkgname}.sh")
sha512sums=('e06676ac2297cba5d20877ac82ef506a9596980bc66257952f37d45ef9810953aedb789655d004b3fd0ac548f2f085e1be406081d9c8d5321622567431c7b3da')
sha512sums_x86_64=('9a3ec87476c6c1e0ac088f5e734fda2e40680e34c33f7713af0118182e6cc0b2cd4b304d02a1959389543b11da290840a3455a19d1654779fa3abdf3d2365d9d')
sha512sums_aarch64=('5bcf48a0b33cca26d9c300cdc2ebbcd251bbac5f4d25cd2d8fa172ade324cc4db3bdb7d991fc0d9b7834d96d6b66f2d392deb5389c84cd13d7ce0313977ebf81')
sha512sums_loong64=('afcc013d29eb850be332e9405b063e98c8b361f21a19ac5a69ed955013cf691a9535d740acfd11f5ee4e060098f931645b547d36e27678e9e51f8ed9eb890ab8')
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