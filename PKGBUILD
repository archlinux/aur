# Maintainer: Purofle <purofle@gmail.com>
# Contributor: Integral <integral@member.fsf.org>

pkgname=linuxqq
pkgver=3.2.32_51728
pkgrel=2
epoch=5
pkgdesc="New Linux QQ based on Electron"
arch=('x86_64' 'aarch64' 'loong64')
url="https://im.qq.com/${pkgname}"
license=('LicenseRef-QQ')
conflicts=("${pkgname}-nt-bwrap")
depends=('nss' 'alsa-lib' 'gtk3' 'gjs' 'at-spi2-core' 'openjpeg2' 'openslide')
optdepends=('libappindicator-gtk3: Allow QQ to extend a menu via Ayatana indicators in Unity, KDE or Systray (GTK+ 3 library).')
_md5_prefix=a1bdd796
_src_prefix="${pkgname}_${pkgver/_/-}"
source_x86_64=("https://qqdl.gtimg.cn/qqfile/QQNT/9.9.33/beta/${_md5_prefix}/${_src_prefix}_amd64.deb")
source_aarch64=("https://qqdl.gtimg.cn/qqfile/QQNT/9.9.33/beta/${_md5_prefix}/${_src_prefix}_arm64.deb")
source_loong64=("https://qqdl.gtimg.cn/qqfile/QQNT/9.9.33/beta/${_md5_prefix}/${_src_prefix}_loongarch64.deb")
source=("${pkgname}.sh")
sha512sums=('bd89ea20f9e540b37073db6a147b74db7ef706fbd77940c8c9d383a637d139077ccd9266612400c465c128ebe84a3c9a1b28b3e6681df52dae6e378c51399fe7')
sha512sums_x86_64=('3cb4f8f881f1f593e4fc06f1ba7eba3b324113e7feb103c982e085db49efd5a9a6e2c4ee012eac0347e29565b0cf094d9ff74f112a61dc8bb6d198d5585fdbd7')
sha512sums_aarch64=('aca411dec0a8a82d0213de5217be5c1fa0097f2a96b88dc54ceca4baf7731e9243e88c27631793f12c96b75ad15d0005a1f3d1673fbce0143188c3ce9026a25a')
sha512sums_loong64=('184e54b1899375a9fda3eacee0f671b4e94aad63d8e3205e0e4a31b872129ed20d4fd4df69e142637f77ab2ae49b3292959d426cb0b5cc1d1ccbea2806251633')
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
