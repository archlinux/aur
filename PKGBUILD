# Submitter:   Anton Yermalovich <zuzu@bk.ru>
# Maintainer:  Dennis Herbrich <dennis.herbrich@veloxis.de>
# Contributor: Yousef Amar <yousef@amar.io>
# Contributor: zwergnase <zwergnase@posteo.de>

pkgname=sunvox
pkgver=2.0c
pkgrel=2
pkgdesc="Small, fast and powerful modular synthesizer with pattern-based sequencer (tracker)."
arch=('i686' 'x86_64')
url="http://warmplace.ru/soft/sunvox/"
license=(custom)
groups=()
depends=('alsa-lib'
         'hicolor-icon-theme'
         'libx11'
         'libxcb'
         'libxau'
         'libxdmcp'
         'sdl2')
makedepends=('unzip' 'icoutils')
optdepends=('jack: jack audio server output')
source=(http://warmplace.ru/soft/sunvox/$pkgname-$pkgver.zip sunvox.desktop sunvox.xml)
sha256sums=('949e5348da9faa92ce17aac943b58027bdb797b65c7f5f365ef0610bb6dd8a3d'
            '21680b38c66e4375f0a01e496d3167fe8695ada60204c885ff63e63022b63495'
            '7ac2192298abdda802832518c98721b08881e32e8b470f2989c614852dd44f67')

build() {
	# extract and convert all application icon sizes
	printf -- ":: extracting application icons from executable: %s\n" "${srcdir}/sunvox/sunvox/windows_x86_64/sunvox.exe"
	wrestool --extract --type=14 --output /dev/stdout "${srcdir}/sunvox/sunvox/windows_x86_64/sunvox.exe" | \
	icotool --icon -l /dev/stdin | \
	while IFS= read -r _icotool_args; do
		_icon_dimensions=$(echo $_icotool_args | sed -n 's/.*--width=\([0-9]\+\)\s\+.*--height=\([0-9]\+\)\s\+.*/\1x\2/p')
		if [[ -n $_icon_dimensions ]]; then
			mkdir -p "${srcdir}/icons/hicolor/${_icon_dimensions}/"{apps,mimetypes}
			wrestool --extract --type=14 --output /dev/stdout "sunvox/sunvox/windows_x86_64/sunvox.exe" | \
			icotool --extract $_icotool_args --output "${srcdir}/icons/hicolor/${_icon_dimensions}/apps/sunvox.png" /dev/stdin
			printf -- "'%s' extracted!\n" "${srcdir}/icons/hicolor/${_icon_dimensions}/apps/sunvox.png"
			cp -v "${srcdir}/icons/hicolor/${_icon_dimensions}/apps/sunvox.png" "${srcdir}/icons/hicolor/${_icon_dimensions}/mimetypes/application-x-sunvox-project.png"
			cp -v "${srcdir}/icons/hicolor/${_icon_dimensions}/apps/sunvox.png" "${srcdir}/icons/hicolor/${_icon_dimensions}/mimetypes/application-x-sunvox-instrument.png"
		else
			printf -- "error: could not extract icon dimensions\n" >&2
			exit 2
		fi
	done
}

package() {
	install -dm755 "${pkgdir}/opt/${pkgname}"
	install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
	install -dm755 "${pkgdir}/usr/share/icons/hicolor"
	install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm644 "${pkgname}.xml" "${pkgdir}/usr/share/mime/packages/${pkgname}.xml"
	cp -a "${srcdir}"/icons/hicolor/* "${pkgdir}/usr/share/icons/hicolor/"

	if [ "$CARCH" = "x86_64" ]; then
		install -Dm755 "${srcdir}/sunvox/sunvox/linux_x86_64/sunvox" "${pkgdir}/usr/bin/sunvox"
	else
		install -Dm755 "${srcdir}/sunvox/sunvox/linux_x86/sunvox" "${pkgdir}/usr/bin/sunvox"
		install -Dm755 "${srcdir}/sunvox/sunvox/linux_x86/sunvox_lofi" "${pkgdir}/usr/bin/sunvox_lofi"
		install -Dm755 "${srcdir}/sunvox/sunvox/linux_x86/sunvox_no_simd" "${pkgdir}/usr/bin/sunvox_no_simd"
	fi

	cp -a "${srcdir}"/sunvox/{examples,instruments,effects} "${pkgdir}/opt/${pkgname}/"
	# enforce correct and consistent permissions
	chmod -R 0644 "${pkgdir}/opt/${pkgname}"/* "${pkgdir}"/usr/share/icons/hicolor/*
	find "${pkgdir}/opt/${pkgname}" "${pkgdir}"/usr/share/icons/hicolor -type d -print0 | xargs -0 chmod 0755

	install -Dm644 "${srcdir}/sunvox/docs/license/sunvox.txt"  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
