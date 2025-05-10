# Maintainer: Kimiblock Moe
# Contributor: Purofle <purofle@gmail.com>
# Contributor: Integral <integral@member.fsf.org>

pkgname=linuxqq-portable
pkgver=3.2.17_34740
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
_md5_prefix=5aa2d8d6
_src_prefix="linuxqq_${pkgver/_/-}"
source_x86_64=("https://dldir1.qq.com/qqfile/qq/QQNT/${_md5_prefix}/${_src_prefix}_amd64.deb")
source_aarch64=("https://dldir1.qq.com/qqfile/qq/QQNT/${_md5_prefix}/${_src_prefix}_arm64.deb")
source_loong64=("https://dldir1.qq.com/qqfile/qq/QQNT/${_md5_prefix}/${_src_prefix}_loongarch64.deb")
source=("linuxqq.sh" "start.sh" "portable-config" "qq.desktop")
sha512sums=('d5a0ef4a67c32e051273388fdaf547431feb86d70dd2f8269f545f21232e7ea763e610f476f4c9ba06ee4757094d09d2eb2858e3a3c3ed6141d25caf086b0ad9'
            '80ee8f7589fb68181732f7c122fc8b36056af696c4941be81eb6e81331f93d080484cd69f5279536f24b27bc120cb7ca25cb6c3ccfd039cd89e77d46632e5248'
            'c13a004895be89a5e7e05eedf95e7bedbcbcea18e08e64d97bb03166e36425993f7d63a04517cefa78066830a68fc0a68387877caaa6641dcdc810528eb34185'
            '2e8d6f87849a59458bb9e5f297cb73a9c9fe4eb24a39e5c45cbbd2c0ba5d628f6378a707b2734873a3765693a096c7cae21edd582a04fc5a2d70fddd7e2906d4')
sha512sums_x86_64=('ec0345e79aeeac7b8a3db94563430fea6b66ae0987327ad76b7923955a4bedc4610a98a95b4a604c1169b4e54919a07724689f5f818e235a3d099a2c2120efad')
sha512sums_aarch64=('9d35fb12146014fb63e2e982851e477f872f3e40dbd890558a71eb2b38237c0af4db44f952bc0804f7aad5a9fbb107e3e7e2d20f946dafc503844fa8c53762e8')
sha512sums_loong64=('a0592faa5af1d272d057469d3605f2cd11356303eee9a9b45590d8f2c55b6a31e3106ae3279ca37de43042479dc769f55a219e9feebd144d1c44a8f88d68d1bc')
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
