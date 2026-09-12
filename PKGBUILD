# Maintainer: xifan <xifan2333@gmail.com>

pkgname=kdenlive-appimage-pure
_pkgname=kdenlive
pkgver=26.08.1
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
source_x86_64=("kdenlive-26.08.1-x86_64.AppImage::https://download.kde.org/stable/kdenlive/26.08/linux/kdenlive-26.08.1-x86_64.AppImage")
sha256sums_x86_64=('354570ab360fcc4e6ef2825754489a2f24ba73068ecd5b9dc911c72df20a25de')

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
