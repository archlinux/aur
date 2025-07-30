# Maintainer: Kimiblock Moe
# Contributor: Purofle <purofle@gmail.com>
# Contributor: Integral <integral@member.fsf.org>

pkgname=linuxqq-portable
pkgver=3.2.18_37475
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
_md5_prefix=9ddb6c3b
_src_prefix="linuxqq_${pkgver/_/-}"
source_x86_64=("https://dldir1.qq.com/qqfile/qq/QQNT/${_md5_prefix}/${_src_prefix}_amd64.deb")
source_aarch64=("https://dldir1.qq.com/qqfile/qq/QQNT/${_md5_prefix}/${_src_prefix}_arm64.deb")
source_loong64=("https://dldir1.qq.com/qqfile/qq/QQNT/${_md5_prefix}/${_src_prefix}_loongarch64.deb")
source=("linuxqq.sh" "start.sh" "portable-config" "qq.desktop")
sha512sums=('5d3155d5a3e3ef3ba5469b834e8e04bbc4510f192590e37f8ed38c500818af1c4239e89c1743d8ade7e83bb753a59066027c006be52c30154c4fa74f518487e1'
            'b6a955e64b69d98776346a5ec154d119e1acdc3bba364bf01bdcd6119ce20933f326d40990e7e477c3b7c741beb50e22da4ad2d6880538256245bdc31dcede0e'
            'f9a9ca63c44fe7ae4a238cc913506e86d712a7ba079a4840a8d00434bcfb3312ffe0914d894a39bf5d412d792a9ca4a402e6b5db42c8a1f69c525bc37c7e884c'
            '2e8d6f87849a59458bb9e5f297cb73a9c9fe4eb24a39e5c45cbbd2c0ba5d628f6378a707b2734873a3765693a096c7cae21edd582a04fc5a2d70fddd7e2906d4')
sha512sums_x86_64=('cdd876f2a00a8b23f6340f8b7f2671f7e21dc31cde29bfd071495f4655d12b4a5b8ed4122fac0a2033b87b0d606e9571245002d4bd6612436858103bfefb72f4')
sha512sums_aarch64=('ec24b93a4ac5de8ba2fa64fb9c793998d7ab2d41401912a1fd0458b8da068487e0aa3eb7b347348bb8dd0c7ee7c5b9be4d5505e3366955f63adaced05face893')
sha512sums_loong64=('234589f868334fe9b15a2eb36878f57e6ca1ae9fbf05aaee712b935af32e28a31c165d2b52b8e02fd279aababc88e6cecf53ac3e4432397d9b100a699d4fdcdf')
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
