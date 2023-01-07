# Maintainer: Yidaozhan Ya <yidaozhan_ya@outlook.com>
_pkgname=linuxqq
pkgname=linuxqq-nt-bwrap
pkgver=3.0.0_571
pkgrel=5
pkgdesc="New Linux QQ based on Electron, with bubblewrap sandbox and some tweaks"
arch=('x86_64' 'aarch64')
url='https://im.qq.com/linuxqq/index.shtml'
license=('custom')
depends=('at-spi2-core' 'alsa-lib' 'desktop-file-utils' 'gtk3' 'gtk-update-icon-cache' 'libnotify' 'nss' 'gnutls' 'bubblewrap' 'xdg-user-dirs' 'flatpak-xdg-utils' 'snapd-xdg-open-git')
makedepends=('p7zip')
optdepends=('libappindicator-gtk3: 以显示托盘图标' 'gjs: 提供 GNOME Wayland 下的截图支持')
provides=('qq' 'linuxqq')
conflicts=('linuxqq')
options=('!strip' '!emptydirs')
install=${_pkgname}.install
source_x86_64=("https://dldir1.qq.com/qqfile/qq/QQNT/c005c911/linuxqq_3.0.0-571_amd64.deb")  # 底包
               # "https://qqpatch.gtimg.cn/hotUpdate_new/release/linux-x64/${pkgver//_/-}/${pkgver//_/-}.zip.zip")  # 热更新补丁
source_aarch64=("https://dldir1.qq.com/qqfile/qq/QQNT/c005c911/linuxqq_3.0.0-571_arm64.deb")  # 底包
                # "https://qqpatch.gtimg.cn/hotUpdate_new/release/linux-arm64/${pkgver//_/-}/${pkgver//_/-}.zip.zip" )  # 热更新补丁
source=('start.sh' 'config.json' 'xdg-open.sh')
sha256sums_x86_64=('f0a714859c20785cc6cab4084d69c953310f1993828f42c81cb991b8aaa48264')  # 底包
                   # '814ddc3eea99bf2e291e2eeff0c3805928e3059e23b12d41cc8bf75bb8cd5fd3')  # 热更新补丁
sha256sums_aarch64=('2ef13e3ebcaae0a2eef8115856b1a24f005d80eac182e3c741def730c1657e26')  # 底包
                    # 'f2f61581a5c09e4a7bfb23922a667e8df327d58fed9601034c4b60a08ad29049')  # 热更新补丁
sha256sums=('ee4e8dac9c6208acefbcb773e838b88d1f313bc346bda2725545677ae0418f3a'  # start.sh
            '82182e49c883e16c7ff38e4722c3950e2758b4342c51521147423026965196a9'  # config.json
            '78a573867355fb4c3e728d0c8ac0746d47fa7d64f90ee2b62ee9f0ccae095edb')  # xdg-open.sh

package() {
	# 解压程序包
	tar -xJ -f "data.tar.xz" -C "${pkgdir}"
	# rm -rf "${pkgdir}/opt/QQ/resources/app"
	# 7z x "${pkgver//_/-}.zip" -aoa -o"${pkgdir}/opt/QQ/resources/app"
	# chmod 755 "${pkgdir}/opt/QQ/resources/app"

	# 打包相关处理
	mkdir -p "${pkgdir}/opt/QQ/workarounds"
	install -Dm755 "xdg-open.sh" "${pkgdir}/opt/QQ/workarounds/xdg-open.sh"
	cp "${srcdir}/config.json" "${pkgdir}/opt/QQ/workarounds/config.json"

	#mv "${pkgdir}/usr/share/icons/hicolor/2x2" "${pkgdir}/usr/share/icons/hicolor/32x32"

	# 将 LICENSE 移动到正确位置
	mkdir -p "${pkgdir}/usr/share/licenses/${_pkgname}"
	ln -s "/opt/QQ/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	ln -s "/opt/QQ/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.chromium.html"

	# 对 desktop 文件做处理，使其使用正确的图标，启动 start.sh
	cp "${srcdir}/start.sh" "${pkgdir}/opt/QQ/start.sh"
	sed -i "s|/opt/QQ/qq|/opt/QQ/start.sh|" "${pkgdir}/usr/share/applications/qq.desktop"
	sed -i "s|Icon=/usr/share/icons/hicolor/512x512/apps/qq.png|Icon=qq|" "${pkgdir}/usr/share/applications/qq.desktop"

	# 这样就可以直接输入 qq-nt 命令启动了
	mkdir -p "${pkgdir}/usr/bin"
	ln -s "/opt/QQ/start.sh" "${pkgdir}/usr/bin/qq"
}
