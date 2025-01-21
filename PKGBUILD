# Maintainer: Kimiblock Moe
# Contributor: Purofle <purofle@gmail.com>
# Contributor: Integral <integral@member.fsf.org>

pkgname=linuxqq-portable
pkgver=3.2.15_31363
pkgrel=1
epoch=5
pkgdesc="New Linux QQ based on Electron, sandboxed by portable"
arch=('x86_64' 'aarch64' 'loong64')
url="https://im.qq.com/linuxqq"
license=('LicenseRef-QQ')
conflicts=("linuxqq")
provides=("linuxqq")
depends=('nss' 'alsa-lib' 'gtk3' 'at-spi2-core' 'libvips' 'openjpeg2' 'openslide' 'portable')
optdepends=('libappindicator-gtk3: Allow QQ to extend a menu via Ayatana indicators in Unity, KDE or Systray (GTK+ 3 library).')
_md5_prefix=a5519e17
_src_prefix="linuxqq_${pkgver/_/-}"
source_x86_64=("https://dldir1.qq.com/qqfile/qq/QQNT/${_md5_prefix}/${_src_prefix}_amd64.deb")
source_aarch64=("https://dldir1.qq.com/qqfile/qq/QQNT/${_md5_prefix}/${_src_prefix}_arm64.deb")
source_loong64=("https://dldir1.qq.com/qqfile/qq/QQNT/${_md5_prefix}/${_src_prefix}_loongarch64.deb")
source=("linuxqq.sh" "start.sh" "portable-config" "qq.desktop")
sha512sums=('9055d4c3db672178486da3107382eb79476c2a065e182d1b3a67ce15cbd0cc3aa4421eb8cb357a21b1d01ff0effb51f81ec3bed3979855ae8954a8375098846b'
            '80ee8f7589fb68181732f7c122fc8b36056af696c4941be81eb6e81331f93d080484cd69f5279536f24b27bc120cb7ca25cb6c3ccfd039cd89e77d46632e5248'
            'c13a004895be89a5e7e05eedf95e7bedbcbcea18e08e64d97bb03166e36425993f7d63a04517cefa78066830a68fc0a68387877caaa6641dcdc810528eb34185'
            '54f2768c751a280c737b4c2f7b41ae491f94ef752b18d85b5e8a0327fba763e800146950fdfa225390a161876a36f3865715a1da032d1f3028b2d69a55cb0ba7')
sha512sums_x86_64=('4c3494ad3e6214a9da1e60d7d4b0ac6f97649b0945fab7713fe4e374a148aae1aa85b3e37c858fe0e27f3a7b4fe623c030fdd11b70e6b83f79fe55b1a610d96d')
sha512sums_aarch64=('e49048cc3171d3ffa7ed6f799e0ed3da2dc936eed156e6f7ecc2f1005dc88076175ff8da588eb73292736b90045be32962e3f9ed2e30ef1b5da42ddcbab7a12d')
sha512sums_loong64=('f8e4f391c243c0f912a960acd27b0d748626ad6dbcad9056a4234bdd3d054045b33ba16af8df4e5f11e3a9d770716df0fc6ef0e240e1a8f5a87c3b569b2467f0')
options=('!strip' '!debug')

package() {
	echo "  -> Extracting the data.tar.xz..."
	bsdtar -xf data.tar.xz -C "${pkgdir}/"

	# License
	install -Dm644 "${pkgdir}/opt/QQ/LICENSE.electron.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dm644 "${pkgdir}/opt/QQ/LICENSES.chromium.html" -t "${pkgdir}/usr/share/licenses/${pkgname}/"

	# Temporary Solution: Remove libvips and libssh2 which comes from package "linuxqq" itself
	rm -fv ${pkgdir}/opt/QQ/resources/app/{sharp-lib/libvips-cpp.so.42,{,avsdk/bugly/}libssh2.so.1}
	install -Dm755 "${srcdir}/portable-config" "${pkgdir}/usr/lib/portable/info/im.qq.app/config"
	install -Dm755 "${srcdir}/linuxqq.sh" "${pkgdir}/usr/lib/portable/info/im.qq.app/start-script.sh"
	install -Dm755 "${srcdir}/start.sh" "${pkgdir}/usr/bin/linuxqq"
	install -Dm644 "${srcdir}/qq.desktop" "${pkgdir}/usr/share/applications/im.qq.app.desktop"
	rm "${pkgdir}/usr/share/applications/qq.desktop"
}
