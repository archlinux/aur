# Maintainer: Yidaozhan Ya <yidaozhan_ya@outlook.com>

_pkgname=linuxqq
_base_pkgver=3.1.1_11223
_update_pkgver=3.1.2_12912
_base_pkgver_hash=2355235c
_update_pkgver_hash=5f0d6d75

pkgname=linuxqq-nt-bwrap
pkgver="${_update_pkgver}"
pkgrel=1
pkgdesc="New Linux QQ based on Electron, with bubblewrap sandbox and some tweaks"
arch=('x86_64' 'aarch64')  # 龙架构版本停留在 3.1.0 未更新，故不纳入此包中
url='https://im.qq.com/linuxqq/index.shtml'
license=('custom')
depends=('at-spi2-core' 'alsa-lib' 'desktop-file-utils' 'gtk3' 'gtk-update-icon-cache' 'libnotify' 'nss' 'gnutls' 'bubblewrap' 'xdg-user-dirs' 'flatpak-xdg-utils' 'snapd-xdg-open-git' 'libvips' 'openslide' 'autoconf')
makedepends=('p7zip')
optdepends=('libappindicator-gtk3: 以显示托盘图标'
			'gjs: 提供 GNOME Wayland 下的截图支持')
provides=('qq' 'linuxqq')
conflicts=('linuxqq')
options=('!strip' '!emptydirs')
install="${pkgname}.install"
source_x86_64=("https://dldir1.qq.com/qqfile/qq/QQNT/${_base_pkgver_hash}/linuxqq_${_base_pkgver//_/-}_amd64.deb"  # 底包
               "https://qqpatch.gtimg.cn/hotUpdate_new/release/linux-x64/${pkgver//_/-}/${_update_pkgver_hash}/${pkgver//_/-}.zip.zip" )  # 热更新补丁
source_aarch64=("https://dldir1.qq.com/qqfile/qq/QQNT/${_base_pkgver_hash}/linuxqq_${_base_pkgver//_/-}_arm64.deb"  # 底包
                "https://qqpatch.gtimg.cn/hotUpdate_new/release/linux-arm64/${pkgver//_/-}/${_update_pkgver_hash}/${pkgver//_/-}.zip.zip" )  # 热更新补丁
source=('start.sh' 'config.json' 'xdg-open.sh')
sha256sums_x86_64=('4c1810ef357e8ee077292808217bafc67626be79ccff5ff05341248a8a48aaf6'  # 底包
                   '0449dd2c169f401b6a4489bafde51e9206388e690b34dd6c15273e232b61f67f')  # 热更新补丁
sha256sums_aarch64=('d5b6bf200ffe5ffb3b8d4b48861dceb011d4ecc3e0806ac04ac04fc7c7ae041b'   # 底包
                    '78a78fb466c0f0a63068f6de233b994ebcfb74d58b3fa793c264af48228754e3')  # 热更新补丁
sha256sums=('0fed32df5f53574d8c602a56ae126459dc0ece444434eb3e94d09eea0595df5f'  # start.sh
            '72c4a432acc4c06490e9a9a5fe8b6e3f4e3f62edc94878161aebe84fa81655cd'  # config.json
            '78a573867355fb4c3e728d0c8ac0746d47fa7d64f90ee2b62ee9f0ccae095edb')  # xdg-open.sh

package() {
	# 解压程序包
	tar -xJ -f "data.tar.xz" -C "${pkgdir}"
	rm -rf "${pkgdir}/opt/QQ/resources/app"
	7z x "${pkgver//_/-}.zip" -aoa -o"${pkgdir}/opt/QQ/resources/app"
	chmod 755 "${pkgdir}/opt/QQ/resources/app"

	mv "${pkgdir}/opt/QQ/qq" "${pkgdir}/opt/QQ/electron"

	# 打包相关处理
	mkdir -p "${pkgdir}/opt/QQ/workarounds"
	install -Dm755 "xdg-open.sh" "${pkgdir}/opt/QQ/workarounds/xdg-open.sh"
	cp "${srcdir}/config.json" "${pkgdir}/opt/QQ/workarounds/config.json"

	#mv "${pkgdir}/usr/share/icons/hicolor/2x2" "${pkgdir}/usr/share/icons/hicolor/32x32"

	# 将 LICENSE 移动到正确位置
	mkdir -p "${pkgdir}/usr/share/licenses/${_pkgname}"
	ln -s "/opt/QQ/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	ln -s "/opt/QQ/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSES.chromium.html"

	# 临时解决方案: 删除 linuxqq 自带的 libvips 以解决浏览图片崩溃问题
	rm -f "${pkgdir}/opt/QQ/resources/app/sharp-lib/libvips-cpp.so.42"

	# 对 desktop 文件做处理，使其使用正确的图标，启动 start.sh
	cp "${srcdir}/start.sh" "${pkgdir}/opt/QQ/start.sh"
	sed -i "s|/opt/QQ/qq|/opt/QQ/start.sh|" "${pkgdir}/usr/share/applications/qq.desktop"
	sed -i "s|Icon=/usr/share/icons/hicolor/512x512/apps/qq.png|Icon=qq|" "${pkgdir}/usr/share/applications/qq.desktop"

	# 这样就可以直接输入 qq-nt 命令启动了
	mkdir -p "${pkgdir}/usr/bin"
	ln -s "/opt/QQ/start.sh" "${pkgdir}/usr/bin/qq"
}
