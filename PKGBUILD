# Maintainer: Purofle <purofle@gmail.com>
# Contributor: Integral <integral@member.fsf.org>

pkgname=linuxqq
pkgver=3.2.35_54395
pkgrel=1
epoch=5
pkgdesc="New Linux QQ based on Electron"
arch=('x86_64' 'aarch64' 'loong64')
url="https://im.qq.com/${pkgname}"
license=('LicenseRef-QQ')
conflicts=("${pkgname}-nt-bwrap")
depends=('nss' 'alsa-lib' 'gtk3' 'gjs' 'at-spi2-core' 'openjpeg2' 'openslide')
optdepends=('libappindicator-gtk3: Allow QQ to extend a menu via Ayatana indicators in Unity, KDE or Systray (GTK+ 3 library).')
_md5_prefix=816b3c79
_src_prefix="${pkgname}_${pkgver/_/-}"
source_x86_64=("https://qqdl.gtimg.cn/qqfile/QQNT/9.9.37/beta/${_md5_prefix}/${_src_prefix}_amd64.deb")
source_aarch64=("https://qqdl.gtimg.cn/qqfile/QQNT/9.9.37/beta/${_md5_prefix}/${_src_prefix}_arm64.deb")
source_loong64=("https://qqdl.gtimg.cn/qqfile/QQNT/9.9.37/beta/${_md5_prefix}/${_src_prefix}_loongarch64.deb")
source=("${pkgname}.sh")
sha512sums=('bd89ea20f9e540b37073db6a147b74db7ef706fbd77940c8c9d383a637d139077ccd9266612400c465c128ebe84a3c9a1b28b3e6681df52dae6e378c51399fe7')
sha512sums_x86_64=('c1dc085f2b50702a7c408aa6b89754ea5588c0646cf259fdf5c34a63f9883e0617008d6503469e6ae25e85bd1fd4063b56d8479dcd86529587c21a7f7316e95c')
sha512sums_aarch64=('adb5c09354deacc3568607bbea95afcdc8f7c1c076761f08531bc8fcb6bcafdad9c704608635f6680f928c2b7d9bdee26cb4a6cdbcef335cb94566e5c88992c9')
sha512sums_loong64=('e0883a55407c7636db864f343bbeec8a8c29559c54f4e70851a9e1bb06f9ab90c43ee564d606349be49aebb2dc923ae19f9df0de2ba8203d6a0ed56c2395dbf7')
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
