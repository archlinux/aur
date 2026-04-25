# Maintainer: Purofle <purofle@gmail.com>
# Contributor: Integral <integral@member.fsf.org>

pkgname=linuxqq
pkgver=3.2.28_48517
pkgrel=2
epoch=5
pkgdesc="New Linux QQ based on Electron"
arch=('x86_64' 'aarch64' 'loong64')
url="https://im.qq.com/${pkgname}"
license=('LicenseRef-QQ')
conflicts=("${pkgname}-nt-bwrap")
depends=('nss' 'alsa-lib' 'gtk3' 'gjs' 'at-spi2-core' 'openjpeg2' 'openslide')
optdepends=('libappindicator-gtk3: Allow QQ to extend a menu via Ayatana indicators in Unity, KDE or Systray (GTK+ 3 library).')
_md5_prefix=f9cbaab2
_src_prefix="${pkgname}_${pkgver/_/-}"
source_x86_64=("https://dldir1.qq.com/qqfile/qq/QQNT/${_md5_prefix}/${_src_prefix}_amd64.deb")
source_aarch64=("https://dldir1.qq.com/qqfile/qq/QQNT/${_md5_prefix}/${_src_prefix}_arm64.deb")
source_loong64=("https://dldir1.qq.com/qqfile/qq/QQNT/${_md5_prefix}/${_src_prefix}_loongarch64.deb")
source=("${pkgname}.sh")
sha512sums=('bd89ea20f9e540b37073db6a147b74db7ef706fbd77940c8c9d383a637d139077ccd9266612400c465c128ebe84a3c9a1b28b3e6681df52dae6e378c51399fe7')
sha512sums_x86_64=('0f91db286b25915adfd57dbd66365f11f4e8d0614a5ce4eef659ee757e3c6464cefa8b290a1f74fa3c875e8c03d94a8fa873e88fe3b1b26c59e02fec5a8daeab')
sha512sums_aarch64=('5b5e776ea60bba750bb6ef6426e7089d54719056ab9acec85415c28238123caf23074a3e57e8354a64af75fb58ed4c3be56b6f1d3fef84bc0268489466dbc7b2')
sha512sums_loong64=('e0a3ac489b6ac681184df23f3127a34bf776b92a0ffa4739213a754fbf66c32893a1799d823c6e7f57743d895a9056a5ffb85bac5ee5b528a9af3d71b1755a64')
options=('!strip' '!debug')

package() {
	echo "  -> Extracting the data.tar.xz..."
	bsdtar -xf data.tar.xz -C "${pkgdir}/"

	echo "  -> Installing..."
	# Launcher
	install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

	# Launcher Fix
	sed -i '3s!/opt/QQ/qq!linuxqq!' "${pkgdir}/usr/share/applications/qq.desktop"

	# Icon Fix
	sed -i '6s!/usr/share/icons/hicolor/512x512/apps/qq.png!qq!' "${pkgdir}/usr/share/applications/qq.desktop"

	# License
	install -Dm644 "${pkgdir}/opt/QQ/LICENSE.electron.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dm644 "${pkgdir}/opt/QQ/LICENSES.chromium.html" -t "${pkgdir}/usr/share/licenses/${pkgname}/"

	# Temporary Solution: Remove libssh2 which comes from package "linuxqq" itself
	rm -fv ${pkgdir}/opt/QQ/resources/app/{,avsdk/bugly/}libssh2.so.1
}
