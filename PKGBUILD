# Maintainer: Yidaozhan Ya <yidaozhan_ya@outlook.com>
_pkgname=linuxqq
pkgname=linuxqq-nt-bwrap
pkgver=2.0.3_543
pkgrel=2
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
source_x86_64=("https://dldir1.qq.com/qqfile/qq/QQNT/50eed662/QQ-v2.0.3-543_x64.deb")  # 本体
               # "https://qqpatch.gtimg.cn/hotUpdate_new/release/linux-x64/${pkgver//_/-}/${pkgver//_/-}.zip.zip")  # 热更新补丁
source_aarch64=("https://dldir1.qq.com/qqfile/qq/QQNT/50eed662/QQ-v2.0.3-543_arm64.deb")  # 本体
                # "https://qqpatch.gtimg.cn/hotUpdate_new/release/linux-arm64/${pkgver//_/-}/${pkgver//_/-}.zip.zip" )  # 热更新补丁
source=('start.sh' 'config.json' 'qq_channel_jsbridge_handler.desktop')
sha256sums_x86_64=('3bccda547b7fa17b1eacf5477bfafaa4016958578b0d5b2269ace0697ee4c6ef')  # 本体
                   # '2e89bc65faa26ddeed9883b5b7e414dea100ad45b5d569365431e761f00dea84')  # 热更新补丁
sha256sums_aarch64=('d356697284837396f430228032ad7a378717cdba2e1cd724386b2ff99e1eb7bc')  # 本体
                    # '0267df2233bd03a1bd95e9571956a878c141068b2d4165d318481a3d425c0acd')  # 热更新补丁
sha256sums=('e3bfd028d97a2ea7d70d7dd047038f1147e6e1ec35142113d6a91f2fe6dcb583'  # start.sh
            'bce0e99fd8f7d22742c7fce83b00a230f2408f8d4caa45efd91b35ef0819f64d'  # config.json
            'e9b4af9b4119876572f6fe7f48563e6b0830493a8d76e8415e15d89afe6453df')  # qq_channel_jsbridge_handler.desktop

package() {
	# 解压程序包
	tar -xJ -f "data.tar.xz" -C "${pkgdir}"
	# rm -rf "${pkgdir}/opt/QQ/resources/app"
	# 7z x "${pkgver//_/-}.zip" -aoa -o"${pkgdir}/opt/QQ/resources/app"
	# chmod 755 "${pkgdir}/opt/QQ/resources/app"

	# 打包相关处理
	install -Dm644 "qq_channel_jsbridge_handler.desktop" "${pkgdir}/usr/share/applications/qq_channel_jsbridge_handler.desktop"
	mkdir -p "${pkgdir}/opt/QQ/workarounds"
	cp "${srcdir}/config.json" "${pkgdir}/opt/QQ/workarounds/config.json"


	# 处理图标尺寸不正确的问题
	ICON_WORKDIR="${pkgdir}/usr/share/icons/hicolor/0x0"
	convert "${ICON_WORKDIR}/apps/qq.png" -trim +repage "${ICON_WORKDIR}/trimmed.png"
	convert "${ICON_WORKDIR}/trimmed.png" -resize '512x512' "${ICON_WORKDIR}/resized.png"
	mkdir -p "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
	mv "${ICON_WORKDIR}/resized.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/qq-nt.png"
	rm -rf "${ICON_WORKDIR}"

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
