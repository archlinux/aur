# Maintainer: logan_reed <liulingzhang.work@icloud.com>
# Maintainer: Purofle <purofle@gmail.com>
# Contributor: Integral <integral@member.fsf.org>

_pkgname=linuxqq
pkgname=linuxqq-nt
install=linuxqq-nt.install
pkgver=3.2.19_250820
pkgrel=1
epoch=5
pkgdesc="New Linux QQ based on Electron"
arch=('x86_64' 'aarch64' 'loong64')
url="https://im.qq.com/${_pkgname}"
license=('LicenseRef-QQ')
conflicts=("${pkgname}-nt-bwrap" "linuxqq")
depends=('nss' 'alsa-lib' 'gtk3' 'gjs' 'at-spi2-core' 'libvips' 'openjpeg2' 'openslide')
optdepends=('libappindicator-gtk3: Allow QQ to extend a menu via Ayatana indicators in Unity, KDE or Systray (GTK+ 3 library).')
source_x86_64=('https://dldir1v6.qq.com/qqfile/qq/QQNT/Linux/QQ_3.2.19_250820_amd64_01.deb')
source_aarch64=('https://dldir1v6.qq.com/qqfile/qq/QQNT/Linux/QQ_3.2.19_250820_arm64_01.deb')
source_loong64=('https://dldir1v6.qq.com/qqfile/qq/QQNT/Linux/QQ_3.2.19_250820_loongarch64_01.deb')
source=("${_pkgname}.sh")
sha512sums=('e06676ac2297cba5d20877ac82ef506a9596980bc66257952f37d45ef9810953aedb789655d004b3fd0ac548f2f085e1be406081d9c8d5321622567431c7b3da')
sha512sums_x86_64=('018b1f22a95c4f065fdd4cc081080703a81beb97d91b07dcc1052be20005667d9159ff598e319376549d11e26a4f3c05af6a7954a56e3c7b7a9ff2fb2c33835f')
sha512sums_aarch64=('e3fc94712c8feb84191bdcf4f053bdc89af87c56395276c2aa7eabe1bb21819c00cf4c642c8e1114b7b925805af1789749ed061ff90182a6b53fb942deb22d7c')
sha512sums_loong64=('40a8215499c3aa7c6088c0137f18b134da9ccc519f9a0cbfcb6908b0143d2ef1fceeb6f109b8faa6bb99f8e40bed94702a75e91a50ba119daf6831b431d2114c')
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