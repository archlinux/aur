# Maintainer: xifan <xifan2333@gmail.com>

pkgname=kdenlive-appimage-pure
_pkgname=kdenlive
pkgver=25.08.2
pkgrel=3
pkgdesc="A non-linear video editor for Linux using the MLT video framework (AppImage build)"
arch=('x86_64')
url="https://www.kdenlive.org"
license=('GPL')
provides=("$_pkgname")
conflicts=("$_pkgname")
depends=('fuse2')
options=(!strip)
_filename="${_pkgname}-${pkgver}-${arch}.AppImage"
_folder="${pkgver%.*}"
source_x86_64=("kdenlive-25.08.2-x86_64.AppImage::https://download.kde.org/stable/kdenlive/25.08/linux/kdenlive-25.08.2-x86_64.AppImage")
sha256sums_x86_64=('81f83c9518176224fad81bfc4f47e4ca6addc62c8f2405069036744e4a0ea33f')

prepare() {
	cd "${srcdir}"
	chmod +x "${_filename}"
	if [[ ! -d squashfs-root ]]; then
		"./${_filename}" --appimage-extract >/dev/null
	fi
}

package() {
	cd "${srcdir}"

	local appdir="${pkgdir}/opt/appimages/${_pkgname}"
	install -d "${appdir}"
	install -Dm755 "${_filename}" "${appdir}/${_filename}"

	install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${_pkgname}" <<EOF
#!/bin/sh

# 为 kdenlive AppImage 配置输入法
# 此 AppImage 的 Qt 不支持 fcitx 协议，统一使用 ibus

if pgrep -x "fcitx5" > /dev/null || pgrep -x "fcitx" > /dev/null; then
    # fcitx/fcitx5 运行中：通过 ibus 协议连接
    export QT_IM_MODULE=ibus
    export IBUS_USE_PORTAL=1
elif pgrep -x "ibus-daemon" > /dev/null; then
    # ibus 运行中：直接连接
    export QT_IM_MODULE=ibus
else
    # 未检测到输入法：使用默认 ibus 配置
    export QT_IM_MODULE=ibus
    export IBUS_USE_PORTAL=1
fi

exec /opt/appimages/${_pkgname}/${_filename} "\$@"
EOF

	# Install icons (all sizes)
	for size in 16x16 22x22 32x32 48x48 64x64 128x128 256x256 512x512 scalable; do
		if [[ -f "squashfs-root/usr/share/icons/hicolor/${size}/apps/kdenlive.png" ]]; then
			install -Dm644 "squashfs-root/usr/share/icons/hicolor/${size}/apps/kdenlive.png" \
				"${pkgdir}/usr/share/icons/hicolor/${size}/apps/kdenlive.png"
		elif [[ -f "squashfs-root/usr/share/icons/hicolor/${size}/apps/kdenlive.svg" ]]; then
			install -Dm644 "squashfs-root/usr/share/icons/hicolor/${size}/apps/kdenlive.svg" \
				"${pkgdir}/usr/share/icons/hicolor/${size}/apps/kdenlive.svg"
		fi
	done

	# Install desktop file
	install -Dm644 squashfs-root/usr/share/applications/org.kde.kdenlive.desktop \
		"${pkgdir}/usr/share/applications/org.kde.kdenlive.desktop"
}
