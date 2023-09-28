# Maintainer: Yidaozhan Ya <yidaozhan_ya@outlook.com>
# Maintainer: sukanka

_pkgname=linuxqq
_base_pkgver=3.2.1_17260
# _update_pkgver=3.1.2_13107
_base_pkgver_hash=5b1d2011
# _update_pkgver_hash=c893f6be
pkgname=linuxqq-nt-bwrap
pkgver="${_base_pkgver}"
# pkgver="${_update_pkgver}"
pkgrel=1
pkgdesc="New Linux QQ based on Electron, with bubblewrap sandbox and some tweaks"
arch=('x86_64' 'aarch64' 'loong64')  # 龙架构版本停留在 3.1.0 未更新，故不纳入此包中
url='https://im.qq.com/linuxqq/index.shtml'
license=('custom')
depends=('at-spi2-core' 'alsa-lib' 'desktop-file-utils' 'gtk3' 'gtk-update-icon-cache' 'libnotify' 'nss'
'gnutls' 'bubblewrap' 'xdg-user-dirs' 'flatpak-xdg-utils' 'snapd-xdg-open-git'
'libvips' 'openslide' 'autoconf'
'libunwind'
)
makedepends=('p7zip')
optdepends=('libappindicator-gtk3: 以显示托盘图标'
			'gjs: 提供 GNOME Wayland 下的截图支持')
provides=('qq' 'linuxqq')
conflicts=('linuxqq')
options=('!emptydirs')
install="${pkgname}.install"
source_x86_64=("https://dldir1.qq.com/qqfile/qq/QQNT/${_base_pkgver_hash}/linuxqq_${_base_pkgver//_/-}_amd64.deb")  # 底包
               #  "https://qqpatch.gtimg.cn/hotUpdate_new/release/linux-x64/${pkgver//_/-}/${_update_pkgver_hash}/${pkgver//_/-}.zip.zip" )  # 热更新补丁
source_aarch64=("https://dldir1.qq.com/qqfile/qq/QQNT/${_base_pkgver_hash}/linuxqq_${_base_pkgver//_/-}_arm64.deb")  # 底包
                #  "https://qqpatch.gtimg.cn/hotUpdate_new/release/linux-arm64/${pkgver//_/-}/${_update_pkgver_hash}/${pkgver//_/-}.zip.zip" )  # 热更新补丁
source_loong64=("https://dldir1.qq.com/qqfile/qq/QQNT/${_base_pkgver_hash}/linuxqq_${_base_pkgver//_/-}_loong64.deb")  # 底包
source=('start.sh' 'config.json' 'xdg-open.sh')
sha256sums=('5a89e6e6bd598268a8cdafaa7314127c53fc203cb31a08c1fb7c38c1c3e4372a'
            'fec2699505d879e08ab2dc27d89e0de2ceedacc27887da3c2b5efb283b0ab9c1'
            '78a573867355fb4c3e728d0c8ac0746d47fa7d64f90ee2b62ee9f0ccae095edb')
sha256sums_x86_64=('b916b78de39d2b3196a5d62216be0b8d45db41c9c6fcb3d50c479a1c3b6e6c3f')
sha256sums_aarch64=('ae8446cdb1dd5430abd3c1dc7b41a0e3d54e97c0c1b9ceba4a337f9796910477')
sha256sums_loong64=('deef193f51b94aca32fe1333b58d93be050de09f00555870753ce136a8b70434')
                   #  '7a1d235b714864b0b62e39f10adbd4bd3b890017168a39e9c97a346931901b35')  # 热更新补丁
                    #  '49a356b051b1fae89f132475128447f184f2385384773114ae9392f19200d7da')  # 热更新补丁

package() {
	# 解压程序包
	tar -xJ -f "data.tar.xz" -C "${pkgdir}"

	# 应用热更新
	# rm -rf "${pkgdir}/opt/QQ/resources/app"
	# 7z x "${pkgver//_/-}.zip" -aoa -o"${pkgdir}/opt/QQ/resources/app"

	chmod 755 "${pkgdir}/opt/QQ/resources/app"

	mv "${pkgdir}/opt/QQ/qq" "${pkgdir}/opt/QQ/electron"

	# 打包相关处理
	mkdir -p "${pkgdir}/opt/QQ/workarounds"
	install -Dm755 "xdg-open.sh" "${pkgdir}/opt/QQ/workarounds/xdg-open.sh"
	cp "${srcdir}/config.json" "${pkgdir}/opt/QQ/workarounds/config.json"

	# 将 LICENSE 移动到正确位置
	mkdir -p "${pkgdir}/usr/share/licenses/${_pkgname}"
	ln -s "/opt/QQ/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	ln -s "/opt/QQ/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSES.chromium.html"

	# 删除原生库
	rm -f "${pkgdir}"/opt/QQ/resources/app/{libssh2.so.1,libunwind*,sharp-lib/libvips-cpp.so.42}

	# 对 desktop 文件做处理，使其使用正确的图标，启动 start.sh
	cp "${srcdir}/start.sh" "${pkgdir}/opt/QQ/start.sh"
	sed -i "s|/opt/QQ/qq|/opt/QQ/start.sh|" "${pkgdir}/usr/share/applications/qq.desktop"
	sed -i "s|Icon=/usr/share/icons/hicolor/512x512/apps/qq.png|Icon=qq|" "${pkgdir}/usr/share/applications/qq.desktop"

	# 这样就可以直接输入 qq 命令启动了
	mkdir -p "${pkgdir}/usr/bin"
	ln -s "/opt/QQ/start.sh" "${pkgdir}/usr/bin/qq"
}
