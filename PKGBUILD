# Maintainer: Yidaozhan Ya <yidaozhan_ya@outlook.com>
_pkgname=linuxqq
pkgname=linuxqq-nt-bwrap
pkgver=3.0.0_565
pkgrel=2\3
pkgdesc="Tencent QQ NT for Linux with bubblewrap wrapper"
arch=('x86_64' 'aarch64')
url='https://im.qq.com'
license=('custom')
depends=('at-spi2-core' 'alsa-lib' 'desktop-file-utils' 'gjs' 'gtk3' 'libnotify' 'nss' 'bubblewrap' 'xdg-utils' 'xdg-user-dirs')
makedepends=('imagemagick' 'p7zip')
optdepends=('libappindicator-gtk3: 以最小化到托盘')
provides=('qq-nt' 'linuxqq-nt')
conflicts=('linuxqq-new')
options=('!strip' '!emptydirs')
install=${_pkgname}.install
source_x86_64=("https://dldir1.qq.com/qqfile/qq/QQNT/50eed662/QQ-v2.0.3-543_x64.deb"  # 本体
               "https://qqpatch.gtimg.cn/hotUpdate_new/release/linux-x64/${pkgver//_/-}/${pkgver//_/-}.zip.zip")  # 热更新补丁
source_aarch64=("https://dldir1.qq.com/qqfile/qq/QQNT/50eed662/QQ-v2.0.3-543_arm64.deb"  # 本体
                "https://qqpatch.gtimg.cn/hotUpdate_new/release/linux-arm64/${pkgver//_/-}/${pkgver//_/-}.zip.zip" )  # 热更新补丁
source=('start.sh' 'config.json' 'qq_channel_jsbridge_handler.desktop')
sha256sums_x86_64=('3bccda547b7fa17b1eacf5477bfafaa4016958578b0d5b2269ace0697ee4c6ef'  # 本体
                   '814ddc3eea99bf2e291e2eeff0c3805928e3059e23b12d41cc8bf75bb8cd5fd3')  # 热更新补丁
sha256sums_aarch64=('d356697284837396f430228032ad7a378717cdba2e1cd724386b2ff99e1eb7bc'  # 本体
                    'f2f61581a5c09e4a7bfb23922a667e8df327d58fed9601034c4b60a08ad29049')  # 热更新补丁
sha256sums=('3aeed7e5049f644d99d9469630985e90a0c6ed627a435f4d81fae9af434faa7b'  # start.sh
            '68069b9360c09a5e64c370dbcba54089ac4b1f8b30fc3d6d1c9b8b316a8f92c6'  # config.json
            'e9b4af9b4119876572f6fe7f48563e6b0830493a8d76e8415e15d89afe6453df')  # qq_channel_jsbridge_handler.desktop

package() {
	# 解压程序包
	tar -xJ -f "data.tar.xz" -C "${pkgdir}"
	rm -rf "${pkgdir}/opt/QQ/resources/app"
	7z x "${pkgver//_/-}.zip" -aoa -o"${pkgdir}/opt/QQ/resources/app"
	chmod 755 "${pkgdir}/opt/QQ/resources/app"

	# 打包相关处理
	mkdir -p "${pkgdir}/opt/QQ/workarounds"
	install -Dm644 "qq_channel_jsbridge_handler.desktop" "${pkgdir}/opt/QQ/workarounds/qq_channel_jsbridge_handler.desktop"
	cp "${srcdir}/config.json" "${pkgdir}/opt/QQ/workarounds/config.json"


	# 处理图标文件夹不正确的问题
	mv "${pkgdir}/usr/share/icons/hicolor/0x0" "${pkgdir}/usr/share/icons/hicolor/512x512"

	# 将 LICENSE 移动到正确位置
	mkdir -p "${pkgdir}/usr/share/licenses/${_pkgname}"
	ln -s "/opt/QQ/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	ln -s "/opt/QQ/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.chromium.html"

	# 对 desktop 文件做处理，使其使用正确的图标，启动 start.sh
	cp "${srcdir}/start.sh" "${pkgdir}/opt/QQ/start.sh"
	mv "${pkgdir}/usr/share/applications/qq.desktop" "${pkgdir}/usr/share/applications/qq-nt.desktop"
	sed -i "s|Icon=/opt/QQ/resources/app/512x512.png|Icon=qq-nt|" "${pkgdir}/usr/share/applications/qq-nt.desktop"
	sed -i "s|/opt/QQ/qq|/opt/QQ/start.sh|" "${pkgdir}/usr/share/applications/qq-nt.desktop"

	# 这样就可以直接输入 qq-nt 命令启动了
	mkdir -p "${pkgdir}/usr/bin"
	ln -s "/opt/QQ/start.sh" "${pkgdir}/usr/bin/qq-nt"
}
