# Maintainer: Kimiblock Moe
# Contributor: Purofle <purofle@gmail.com>
# Contributor: Integral <integral@member.fsf.org>

pkgname=linuxqq-portable
pkgver=3.2.16_32793
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
_md5_prefix=ee4bd910
_src_prefix="linuxqq_${pkgver/_/-}"
source_x86_64=("https://dldir1.qq.com/qqfile/qq/QQNT/${_md5_prefix}/${_src_prefix}_amd64.deb")
source_aarch64=("https://dldir1.qq.com/qqfile/qq/QQNT/${_md5_prefix}/${_src_prefix}_arm64.deb")
source_loong64=("https://dldir1.qq.com/qqfile/qq/QQNT/${_md5_prefix}/${_src_prefix}_loongarch64.deb")
source=("linuxqq.sh" "start.sh" "portable-config" "qq.desktop")
sha512sums=('9055d4c3db672178486da3107382eb79476c2a065e182d1b3a67ce15cbd0cc3aa4421eb8cb357a21b1d01ff0effb51f81ec3bed3979855ae8954a8375098846b'
            '80ee8f7589fb68181732f7c122fc8b36056af696c4941be81eb6e81331f93d080484cd69f5279536f24b27bc120cb7ca25cb6c3ccfd039cd89e77d46632e5248'
            'c13a004895be89a5e7e05eedf95e7bedbcbcea18e08e64d97bb03166e36425993f7d63a04517cefa78066830a68fc0a68387877caaa6641dcdc810528eb34185'
            '2e8d6f87849a59458bb9e5f297cb73a9c9fe4eb24a39e5c45cbbd2c0ba5d628f6378a707b2734873a3765693a096c7cae21edd582a04fc5a2d70fddd7e2906d4')
sha512sums_x86_64=('f75b0d427002cb5044e2fde5785b8bc0bd3e8b95cf8a0a3e1fe9236fcee646fdac1b11c9ba8d1ff55909bfeec4832387b7ac2513d04c6b511a25143a3ba8d65e')
sha512sums_aarch64=('0aa9cdd6d5c9fbf2db9a19a6b51b8ac22fd935cf035640611b5341f01e4d09fbaedea0cd9c5f1ab6ebd35a39ef05ca6befc124fac2cb182b7f3bee4945e5d346')
sha512sums_loong64=('180aaf3d6b1af6950e183cf1c6af16f2bddc7853dcc7672a5b6b79c4b3463851090fbc24e68042806c994095165a658b5444a0631b7223e59893948385958b28')
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
