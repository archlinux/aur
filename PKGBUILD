# Maintainer: Kirikaze Chiyuki <me@chyk.ink>
# Maintainer: sukanka

_pkgname=linuxqq
_base_pkgver=3.2.18_250626
_update_pkgver=${_base_pkgver}
#_md5=08c52833
pkgname=linuxqq-nt-bwrap
pkgver="${_update_pkgver//-/_}"
pkgrel=1
pkgdesc="New Linux QQ based on Electron, with bubblewrap sandbox and some tweaks"
arch=('x86_64' 'aarch64' 'loong64')
url='https://im.qq.com/linuxqq/index.shtml'
license=('custom')
depends=('at-spi2-core' 'alsa-lib' 'desktop-file-utils' 'gtk3' 'gtk-update-icon-cache' 'libnotify' 'nss'
	'gnutls' 'bubblewrap' 'xdg-user-dirs' 'flatpak-xdg-utils' 'snapd-xdg-open-git'
	'libvips' 'openslide' 'autoconf'
	'libunwind'
	'iproute2'
)
makedepends=('p7zip')
optdepends=('libappindicator-gtk3: 以显示托盘图标'
	'gjs: 提供 GNOME Wayland 下的截图支持'
	'slirp4netns: 固定 MAC 地址时需要'
	'socat: 固定 MAC 地址时需要')
provides=('qq' 'linuxqq')
conflicts=('linuxqq')
options=('!emptydirs')
install="${pkgname}.install"
source_x86_64=("https://dldir1.qq.com/qqfile/qq/QQNT/Linux/QQ_${_base_pkgver}_amd64_01.deb")
source_aarch64=("https://dldir1.qq.com/qqfile/qq/QQNT/Linux/QQ_${_base_pkgver}_arm64_01.deb")
source_loong64=("https://dldir1.qq.com/qqfile/qq/QQNT/Linux/QQ_${_base_pkgver}_loongarch64_01.deb")
source=('start.sh' 'start_normal.sh' 'start_mac_fix.sh' 'start_inner.sh' 'config.json' 'resolv.conf' 'xdg-open.sh')
sha256sums=('2748a351259d378ab9773000cbf1ea0448de5ae92f28bb9e366fa795e1715739'
            '46958947a35bde1cea2a2f2da6e8296fcb6752d84b6c62b2a49f6959d3235912'
            '801d778cb2cecca21cc294651ac5c85ad1c8cdd8c805c9d491740dd13bb9c7dc'
            '3c78b576aa5d07e4cacde95d1088530503478bb0d43d19371c5da56f675d9861'
            'bb2ec0f104da4da7422d9b0f51c71d0ab38ed2a21764a7a643ab42689e098e4b'
            'cc002ee0eb2e8702c97d16f4ce628841cd5fe10195875a075432e92248741424'
            'f1c778b5a8b23bc77fd8e5e89056fea07309794c9a44ec38134a176cf1f7b675')
sha256sums_x86_64=('c44c3ab44faa5fdd17412dded8c4ee75e50935fc76e61c20ab560544e1ea7e78')
sha256sums_aarch64=('eed789591befcf96da26c68798ec2790b801701c56394086a55dbe3071fb4e27')
sha256sums_loong64=('ef8575a5b98c5c2b8d633f0b864c15b8b63e79322312af988fc5063f4b5b344f')

prepare() {
	local base_ver=${_base_pkgver}
	local cur_ver=${_update_pkgver:-${base_ver}}
	local build_ver=${cur_ver#*-}
	sed -i "s|__BASE_VER__|${base_ver}|g;s|__CURRENT_VER__|${cur_ver}|g;s|__BUILD_VER__|${build_ver}|g" config.json start.sh
}

package() {
	# 解压程序包
	tar -xJ -f "data.tar.xz" -C "${pkgdir}"

	chmod 755 "${pkgdir}/opt/QQ/resources/app"

	mv "${pkgdir}/opt/QQ/qq" "${pkgdir}/opt/QQ/electron"

	# 打包相关处理
	mkdir -p "${pkgdir}/opt/QQ/workarounds"
	install -Dm755 "xdg-open.sh" "${pkgdir}/opt/QQ/workarounds/xdg-open.sh"
	cp "${srcdir}/config.json" "${pkgdir}/opt/QQ/workarounds/config.json"
	cp "${srcdir}/resolv.conf" "${pkgdir}/opt/QQ/workarounds/resolv.conf"

	# 将 LICENSE 移动到正确位置
	mkdir -p "${pkgdir}/usr/share/licenses/${_pkgname}"
	ln -s "/opt/QQ/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	ln -s "/opt/QQ/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSES.chromium.html"

	# 删除原生库
	rm -f "${pkgdir}"/opt/QQ/resources/app/{libssh2.so.1,libunwind*,sharp-lib/libvips-cpp.so.42}

	# 对 desktop 文件做处理，使其使用正确的图标，启动 start.sh
	cp "${srcdir}/start"*".sh" "${pkgdir}/opt/QQ/"
	sed -i "s|/opt/QQ/qq|/opt/QQ/start.sh|" "${pkgdir}/usr/share/applications/qq.desktop"
	sed -i "s|Icon=/usr/share/icons/hicolor/512x512/apps/qq.png|Icon=qq|" "${pkgdir}/usr/share/applications/qq.desktop"

	# 这样就可以直接输入 qq 命令启动了
	mkdir -p "${pkgdir}/usr/bin"
	ln -s "/opt/QQ/start.sh" "${pkgdir}/usr/bin/qq"
}
