# Maintainer: Purofle <purofle@gmail.com>
# Contributor: Integral <integral@member.fsf.org>

pkgname=linuxqq
pkgver=3.2.30_50969
pkgrel=2
epoch=5
pkgdesc="New Linux QQ based on Electron"
arch=('x86_64' 'aarch64' 'loong64')
url="https://im.qq.com/${pkgname}"
license=('LicenseRef-QQ')
conflicts=("${pkgname}-nt-bwrap")
depends=('nss' 'alsa-lib' 'gtk3' 'gjs' 'at-spi2-core' 'openjpeg2' 'openslide')
optdepends=('libappindicator-gtk3: Allow QQ to extend a menu via Ayatana indicators in Unity, KDE or Systray (GTK+ 3 library).')
_md5_prefix=fd40a3ec
_src_prefix="${pkgname}_${pkgver/_/-}"
source_x86_64=("https://qqdl.gtimg.cn/qqfile/QQNT/9.9.32/beta/${_md5_prefix}/${_src_prefix}_amd64.deb")
source_aarch64=("https://qqdl.gtimg.cn/qqfile/QQNT/9.9.32/beta/${_md5_prefix}/${_src_prefix}_arm64.deb")
source_loong64=("https://qqdl.gtimg.cn/qqfile/QQNT/9.9.32/beta/${_md5_prefix}/${_src_prefix}_loongarch64.deb")
source=("${pkgname}.sh")
sha512sums=('bd89ea20f9e540b37073db6a147b74db7ef706fbd77940c8c9d383a637d139077ccd9266612400c465c128ebe84a3c9a1b28b3e6681df52dae6e378c51399fe7')
sha512sums_x86_64=('b7c0f93267de4a97ade2117635693a1e6056c7f64476afc7c732826205ac32dc6dd2520d34d760aed7486a4bcb8635e7df69f423b0688704a759153b00cd1895')
sha512sums_aarch64=('2a2f9ed9125c323e77368bf91960c6e998a226c3934d950aea60b2e0d24310a624f62be088c20e69a1f3d4cc619466525207640b5752d5eb2fc322e138d04893')
sha512sums_loong64=('2ba66be7ae280144ffdc3d2cd57948c58716f93c5abf0f26845dff4b2d943ed0be5347453729caee8add04f0b8a193d65ee7fd33aad36b79d0d1ffd5e5fd9f0e')
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
