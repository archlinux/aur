# Maintainer: Yidaozhan Ya <yidaozhan_ya@outlook.com>
_pkgname=linuxqq
pkgname=linuxqq-nt-bwrap
pkgver=2.0.2_510
pkgrel=5
pkgdesc="Tencent QQ NT for Linux with bubblewrap wrapper"
arch=('x86_64' 'aarch64')
url='https://im.qq.com'
license=('custom')
depends=('at-spi2-core' 'desktop-file-utils' 'gtk3' 'hicolor-icon-theme' 'libnotify' 'libsecret' 'libxss' 'libxtst' 'nss' 'util-linux-libs' 'bubblewrap' 'xdg-utils' 'xdg-user-dirs')
makedepends=('imagemagick' 'p7zip')
optdepends=('libappindicator-gtk3: 以最小化到托盘')
provides=('qq-nt' 'linuxqq-nt')
conflicts=('linuxqq-new')
options=('!strip' '!emptydirs')
install=${_pkgname}.install
source_x86_64=('https://dldir1.qq.com/qqfile/qq/QQNT/4691a571/QQ-v2.0.1-429_x64.deb'  # 本体
               'https://qqpatch.gtimg.cn/hotUpdate_new/release/linux-x64/2.0.2-510/2.0.2-510.zip.zip')  # 热更新补丁
source_aarch64=('https://dldir1.qq.com/qqfile/qq/QQNT/0186a650/QQ-v2.0.1-453_arm64.deb'  # 本体
                'https://qqpatch.gtimg.cn/hotUpdate_new/release/linux-arm64/2.0.2-510/2.0.2-510.zip.zip' )  # 热更新补丁
source=('start.sh' 'config.json' 'qq_channel_jsbridge_handler.desktop')
sha256sums_x86_64=('e3aa15ff6ae089b655df3913c6020ca56726bd676995aaf29b313fbd0643ea42'
                   '26059ccd89a4491083add9291398de658f98fb08a779f7ce46ac7bef8245b53f')
sha256sums_aarch64=('70c286006dae10da06c191b5f0718d17d686a8ef792f6f72215734773f01498b'
                    '556d3c9f3142dea199a6605694d5d47bb93d0b33e5c6ce8f70a69eb47b2235fc')
sha256sums=('3e3bab8273fca8f395ea3cb9a4daea0efaeebaf34526767105885b8c99cc1a69'
            '8f6fae6fef7869dad2c309d77c9530e29dd737e63deced984f10ac379eeceb03'
            'e9b4af9b4119876572f6fe7f48563e6b0830493a8d76e8415e15d89afe6453df')

package() {
	# 解压程序包
	tar -xJ -f "data.tar.xz" -C "${pkgdir}"
	rm -rf "${pkgdir}/opt/QQ/resources/app"
	7z x "2.0.2-510.zip" -aoa -o"${pkgdir}/opt/QQ/resources/app"
	chmod 755 "${pkgdir}/opt/QQ/resources/app"

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
