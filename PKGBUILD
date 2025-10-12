# Maintainer: xifan <xifan2333@gmail.com>

pkgname=kdenlive-appimage-pure
_pkgname=kdenlive
pkgver=25.08.2
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
exec /opt/appimages/${_pkgname}/${_filename} "\$@"
EOF

	if [[ -d squashfs-root/usr/share/icons/hicolor ]]; then
		while IFS= read -r -d '' icon; do
			local rel="${icon#squashfs-root/usr/share/icons/hicolor/}"
			local target_dir="${pkgdir}/usr/share/icons/hicolor/${rel%/*}"
			local filename="${rel##*/}"
			install -Dm644 "${icon}" "${target_dir}/${filename}"

			case "${filename}" in
				org.kde.kdenlive.*)
					local ext="${filename##*.}"
					install -Dm644 "${icon}" "${target_dir}/kdenlive.${ext}"
					;;
				kdenlive.*)
					local ext="${filename##*.}"
					install -Dm644 "${icon}" "${target_dir}/org.kde.kdenlive.${ext}"
					;;
			esac
		done < <(find squashfs-root/usr/share/icons/hicolor -type f \( -name 'kdenlive.*' -o -name 'org.kde.kdenlive.*' \) -print0)
	fi

	if [[ -f squashfs-root/usr/share/applications/org.kde.kdenlive.desktop ]]; then
		install -Dm644 squashfs-root/usr/share/applications/org.kde.kdenlive.desktop \
			"${pkgdir}/usr/share/applications/org.kde.kdenlive.desktop"
	fi
}
