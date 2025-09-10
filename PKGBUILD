pkgname=ticktick-cn
pkgver=6.0.40
pkgrel=1
pkgdesc='滴答清单（中国版）桌面客户端'
arch=(x86_64 aarch64)
url='https://www.dida365.com/download'
# 上游为专有协议，未提供标准 SPDX 标识；使用自定义 LicenseRef 并在 /usr/share/licenses 安装说明。
license=('LicenseRef-TickTick-EULA')

# 运行时依赖（Electron/Chromium 常见）
depends=(
	'alsa-lib'
	'atk'
	'at-spi2-core'
	'cairo'
	'dbus'
	'expat'
	'freetype2'
	'glib2'
	'glibc'
	'gtk3'
	'harfbuzz'
	'libdrm'
	'libx11'
	'libxcb'
	'libxcomposite'
	'libxdamage'
	'libxext'
	'libxfixes'
	'libxkbcommon'
	'libxrandr'
	'mesa'
	'nspr'
	'nss'
	'pango'
	'pciutils'
	'libcups'
	'libffi'
	'libxshmfence'
	'libxrender'
	'zlib'
)
makedepends=('xz' 'binutils' 'tar' 'findutils' 'sed' 'grep' 'desktop-file-utils' 'unzip')
optdepends=(
	'xdg-desktop-portal: 屏幕共享/文件选择等系统集成'
	'xdg-desktop-portal-gtk: GTK 桌面集成'
	'libnotify: 通知支持'
	'libsecret: 秘密存储支持'
)

# 不提供命令行入口至 PATH，避免“附带命令行”。
options=(!strip !debug)

_baseurl='https://cdn.dida365.cn/download/linux'
_deb_dir_x86_64='linux_deb_x64'
_deb_dir_aarch64='linux_deb_arm64'
_deb_name_x86_64="dida-${pkgver}-amd64.deb"
_deb_name_aarch64="dida-${pkgver}-arm64.deb"

# 使用固定版本号拼接直链（符合 AUR 规则）。
source_x86_64=(
	"${_deb_name_x86_64}::${_baseurl}/${_deb_dir_x86_64}/${_deb_name_x86_64}"
)
source_aarch64=(
	"${_deb_name_aarch64}::${_baseurl}/${_deb_dir_aarch64}/${_deb_name_aarch64}"
)
source=(
	"press.zip::https://cdn.dida365.cn/download/press.zip"
)
sha256sums_x86_64=('b15a65454792783dfefe528c5aded4e7dcbfcece576c8da81376c2f9e94a9e23')
sha256sums_aarch64=('ece36967b835539969155ff3e2c66623230daaff6a0500d00703217e783a7675')
sha256sums=('2dc9722cf147f53741fbe5e0de246b2f7c18397a619897cb0446a14d88d85020')

_appname='滴答清单'
_execname='ticktick-cn'
_install_prefix=/usr

prepare() {
	: # 无补丁；保持空实现
}

package() {
	cd "${srcdir}"

		local debfile
		# 与源文件名一致（dida-<ver>-<arch>.deb）
		debfile=$(printf '%s\n' dida-*.deb | head -n1)

	# 解包 deb（ar 存档包含 control.tar.* 与 data.tar.*）
	bsdtar -xf "$debfile"
	bsdtar -C "$pkgdir" -xf data.tar.*

	# 上游通常安装到 /opt 下的某个目录，尝试自动检测
	local appdir
	appdir=$(find "$pkgdir/opt" -maxdepth 1 -type d -name '*tick*' -print -quit || true)
	if [[ -z $appdir ]]; then
		appdir=$(find "$pkgdir/opt" -maxdepth 1 -mindepth 1 -type d -print -quit || true)
	fi

	# 目录与文件就绪
	install -d "$pkgdir$_install_prefix/lib/$pkgname"
	install -d "$pkgdir$_install_prefix/share/applications"
	for sz in 512 256 128 64 48; do
		install -d "$pkgdir$_install_prefix/share/icons/hicolor/${sz}x${sz}/apps"
	done

	# 供应商主可执行文件（Electron/Chromium 外壳）
	local vendor_bin
	vendor_bin=$(find "$appdir" -maxdepth 1 -type f -executable \( -name '*tick*' -o -name '*Tick*' \) -print -quit || true)
	if [[ -z $vendor_bin ]]; then
		vendor_bin=$(find "$appdir" -maxdepth 1 -type f -executable -print -quit || true)
	fi

	# 私有 launcher（不放入 PATH），添加 Wayland 参数与禁用更新的环境变量（尽力而为）
	cat >"$pkgdir$_install_prefix/lib/$pkgname/launcher" <<'EOF'
#!/bin/sh
set -eu

# 禁用应用内更新（对 electron-builder 常见配置尽力而为）
export ELECTRON_NO_UPDATER=1
export DISABLE_UPDATE=1
export AUTO_UPDATE=false
export APPIMAGE_SILENT_INSTALL=1

# 首选 Wayland，回退 X11
FLAGS="--disable-features=Translate,AutofillServerCommunication"
if [ -n "${WAYLAND_DISPLAY-}" ]; then
	FLAGS="$FLAGS --ozone-platform=wayland --enable-features=WaylandWindowDecorations"
else
	FLAGS="$FLAGS --ozone-platform=x11"
fi

# 推荐启用的图形参数（可被用户覆盖）
FLAGS="$FLAGS --enable-gpu-rasterization --enable-zero-copy"

exec "__VENDOR_BIN__" $FLAGS "$@"
EOF
	chmod 755 "$pkgdir$_install_prefix/lib/$pkgname/launcher"

	# 注入真实的 vendor 可执行文件路径
	sed -i "s#__VENDOR_BIN__#${vendor_bin//\//\\/}#" "$pkgdir$_install_prefix/lib/$pkgname/launcher"

	# 若含 chrome-sandbox，尽量启用 SUID sandbox（需要 root:root 及 4755）
	if [[ -n ${appdir-} && -f "$appdir/chrome-sandbox" ]]; then
		chown root:root "$appdir/chrome-sandbox" || true
		chmod 4755 "$appdir/chrome-sandbox" || true
	fi

	# 移除常见自动更新配置（若存在）
	if [[ -n ${appdir-} ]]; then
		find "$appdir" -type f -name 'app-update.yml' -delete || true
		find "$appdir" -type f -name '*update*.yml' -delete || true
	fi

	# 桌面文件（中文名，类别用 Office；不在 PATH 暴露命令）
	local desktop="$pkgdir$_install_prefix/share/applications/$pkgname.desktop"
	cat >"$desktop" <<EOF
[Desktop Entry]
Name=${_appname}
Comment=${pkgdesc}
Exec=${_install_prefix}/lib/${pkgname}/launcher %U
Terminal=false
Type=Application
Categories=Office;Utility;
Icon=ticktick-cn
StartupWMClass=TickTick
StartupNotify=true
EOF
	chmod 644 "$desktop"

	# 图标：尝试从包中提取常见尺寸 PNG
	local installed_icon=0
	if [[ -n ${appdir-} ]]; then
		for sz in 512 256 128 64 48; do
			# 常见 electron-builder 图标命名
			for icon in \
				"$appdir"/*${sz}*.png \
				"$appdir"/resources/*${sz}*.png \
				"$appdir"/resources/icons/*${sz}*.png; do
				if [[ -f "$icon" ]]; then
					install -Dm644 "$icon" "$pkgdir$_install_prefix/share/icons/hicolor/${sz}x${sz}/apps/ticktick-cn.png"
					installed_icon=1; break
				fi
			done
		done
	fi

	# 若 deb 未提供图标，使用 press.zip 作为后备（优先用较大尺寸 PNG 或 SVG）
	if [[ $installed_icon -eq 0 ]]; then
		local pressdir="$srcdir/press"
		rm -rf "$pressdir" && mkdir -p "$pressdir"
		unzip -qq "$srcdir/press.zip" -d "$pressdir"
		# 尝试常见路径与命名（假设有 svg 或大 png）
		local candidate
		for sz in 512 256 128 64 48; do
			candidate=$(find "$pressdir" -type f \( -iname '*icon*.png' -o -iname '*logo*.png' -o -iname '*.svg' \) | head -n1 || true)
			if [[ -n $candidate ]]; then
				install -Dm644 "$candidate" "$pkgdir$_install_prefix/share/icons/hicolor/${sz}x${sz}/apps/ticktick-cn.${candidate##*.}"
			fi
		done
		# 若是 svg，给 512 处放 svg 名称以便主题系统可拾取
		if [[ -n $candidate && ${candidate##*.} == svg ]]; then
			install -Dm644 "$candidate" "$pkgdir$_install_prefix/share/icons/hicolor/scalable/apps/ticktick-cn.svg"
		fi
	fi

	# 为自定义 LicenseRef 安装说明文件
	install -d "$pkgdir$_install_prefix/share/licenses/$pkgname"
	cat >"$pkgdir$_install_prefix/share/licenses/$pkgname/LicenseRef-TickTick-EULA" <<'EOF'
This package installs the proprietary TickTick (滴答清单) desktop client.
Upstream license/terms of service apply. See:
- https://www.dida365.com/about/tos
- https://www.dida365.com/about/privacy
EOF
	chmod 644 "$pkgdir$_install_prefix/share/licenses/$pkgname/LicenseRef-TickTick-EULA"

	# 规范化权限以提高可重现性
	find "$pkgdir" -type d -exec chmod 755 {} +
	find "$pkgdir" -type f -perm -111 -exec chmod 755 {} +
	find "$pkgdir" -type f -not -perm -111 -exec chmod 644 {} +

}
