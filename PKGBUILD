# Maintainer: xifan <xifan2333@gmail.com>

pkgname=kdenlive-appimage-pure
_pkgname=kdenlive
pkgver=26.04.1
pkgrel=1
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
source_x86_64=("kdenlive-26.04.1-x86_64.AppImage::https://download.kde.org/stable/kdenlive/26.04/linux/kdenlive-26.04.1-x86_64.AppImage")
sha256sums_x86_64=('3db4bb8c745479c60e8a5abdeca4e61476dc90f8926c8e33bf7b8b5fcc9a5c7a')

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
