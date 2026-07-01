# Maintainer: Purofle <purofle@gmail.com>
# Contributor: Integral <integral@member.fsf.org>

pkgname=linuxqq
pkgver=3.2.30_50828
pkgrel=2
epoch=5
pkgdesc="New Linux QQ based on Electron"
arch=('x86_64' 'aarch64' 'loong64')
url="https://im.qq.com/${pkgname}"
license=('LicenseRef-QQ')
conflicts=("${pkgname}-nt-bwrap")
depends=('nss' 'alsa-lib' 'gtk3' 'gjs' 'at-spi2-core' 'openjpeg2' 'openslide')
optdepends=('libappindicator-gtk3: Allow QQ to extend a menu via Ayatana indicators in Unity, KDE or Systray (GTK+ 3 library).')
_md5_prefix=727ce4e5
_src_prefix="${pkgname}_${pkgver/_/-}"
source_x86_64=("https://qqdl.gtimg.cn/qqfile/QQNT/9.9.32/beta/${_md5_prefix}/${_src_prefix}_amd64.deb")
source_aarch64=("https://qqdl.gtimg.cn/qqfile/QQNT/9.9.32/beta/${_md5_prefix}/${_src_prefix}_arm64.deb")
source_loong64=("https://qqdl.gtimg.cn/qqfile/QQNT/9.9.32/beta/${_md5_prefix}/${_src_prefix}_loongarch64.deb")
source=("${pkgname}.sh")
sha512sums=('bd89ea20f9e540b37073db6a147b74db7ef706fbd77940c8c9d383a637d139077ccd9266612400c465c128ebe84a3c9a1b28b3e6681df52dae6e378c51399fe7')
sha512sums_x86_64=('5b25f67127efdf89683a9d1153e8f17ba3e114ed7c7203cc10541fb74e8ff7276d9111561fb65ebdba328fe46c20b8b3c80381116b28afd9930ba4468aa43246')
sha512sums_aarch64=('9aeab28a708ff39b592ef6b4f25396004ef6e6a648a10c55f5b139d0e984c3077896e5e6033d8aab2a1778060c253c11ab9c0296cba39f732d4c3d103122c167')
sha512sums_loong64=('73df7469f1714f916ff340df1bd7f3b62867c0022b624c815ed93a103065321c4f8092374c45898f76ff82919f561f7b6b5b969a4b0bf9deb028452a9c6b34e5')
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
