# Submitter:   Anton Yermalovich <zuzu@bk.ru>
# Maintainer:  Dennis Herbrich <dennis.herbrich@veloxis.de>
# Contributor: Yousef Amar <yousef@amar.io>
# Contributor: zwergnase <zwergnase@posteo.de>

pkgname=sunvox
# upstream labels version like "2.1" and "2.1b", or "1.9.6" and "1.9.6c", with
# the latter being parsed as a pre-release/beta by pacman vercmp, and thus not
# being considered an update of the former.  The pkgver scheme I have chosen
# to adopt to solve this issue now:
# - differs minimally from upstream
# - properly signals updates to pacman/AUR helpers, and
# - looks absolutely horrible. I am truly sorry.
# On upgrade, remember to bump $pkgver *and* $_pkgver_upstream.
pkgver=2.1.1.c
_pkgver_upstream=2.1.1c
pkgrel=1
pkgdesc="Small, fast and powerful modular synthesizer with pattern-based sequencer (tracker)."
arch=('i686' 'x86_64')
url="http://warmplace.ru/soft/sunvox/"
license=(custom)
groups=()
depends=('alsa-lib'
         'hicolor-icon-theme'
         'sdl2')
makedepends=('unzip' 'icoutils')
optdepends=('jack: jack audio server output')
# sunvox_opengl is only provided for x86_64 architecture, and needs individual optdeps
if [[ "$CARCH" == "x86_64" ]]; then
  optdepends+=('libgl: required for sunvox_opengl'
               'libx11: required for sunvox_opengl'
               'libxau: required for sunvox_opengl'
               'libxcb: required for sunvox_opengl'
               'libxdmcp: required for sunvox_opengl'
               'libxext: required for sunvox_opengl'
               'libxi: required for sunvox_opengl')
fi
source=(http://warmplace.ru/soft/sunvox/$pkgname-$_pkgver_upstream.zip sunvox.desktop sunvox.xml)
sha256sums=('2df050fdfd97ef96dca8ba77f5cdad75a4a50e6f84ef7194bc1ebc5c5aa289cc'
            'b45ee10df93982ac0d36c6887fe637c28b3c3de7013aa3462291629eed2dcc8d'
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

	# build .desktop files for all variants of the current architecture from template
	printf -- ":: building desktop files from common template for application variants:"
	install -dm755 "${srcdir}/desktop_files"
	sed -e 's|__NAME__|Sunvox|g' \
	    -e 's|__COMMENT__||g' \
	    -e 's|__BINARY__|sunvox|g' \
	    "${srcdir}/sunvox.desktop" > "${srcdir}/desktop_files/sunvox.desktop"
	printf -- " sunvox"
	if [[ "$CARCH" == "x86_64" ]]; then
		sed -e 's|__NAME__|Sunvox OpenGL|g' \
		    -e 's|__COMMENT__| (OpenGL graphics)|g' \
		    -e 's|__BINARY__|sunvox_opengl|g' \
		    "${srcdir}/sunvox.desktop" > "${srcdir}/desktop_files/sunvox_opengl.desktop"
		printf -- " sunvox_opengl"
	elif [[ "$CARCH" == "i686" ]]; then
		sed -e 's|__NAME__|Sunvox LoFi|g' \
		    -e 's|__COMMENT__| (LoFi)|g' \
		    -e 's|__BINARY__|sunvox_lofi|g' \
		    "${srcdir}/sunvox.desktop" > "${srcdir}/desktop_files/sunvox_lofi.desktop"
		printf -- " sunvox_lofi"
	fi
	printf -- "\n"
}

package() {
	install -dm755 "${pkgdir}/opt/${pkgname}"
	install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
	install -dm755 "${pkgdir}/usr/share/icons/hicolor"
	install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
	for _desktop_file in "${srcdir}/desktop_files"/*.desktop; do
		install -Dm644 "${_desktop_file}" "${pkgdir}/usr/share/applications/$(basename "${_desktop_file}")"
	done
	install -Dm644 "${pkgname}.xml" "${pkgdir}/usr/share/mime/packages/${pkgname}.xml"
	cp -a "${srcdir}/icons/hicolor"/* "${pkgdir}/usr/share/icons/hicolor/"

	if [[ "$CARCH" == "x86_64" ]]; then
		install -Dm755 "${srcdir}/sunvox/sunvox/linux_x86_64/sunvox" "${pkgdir}/usr/bin/sunvox"
		install -Dm755 "${srcdir}/sunvox/sunvox/linux_x86_64/sunvox_opengl" "${pkgdir}/usr/bin/sunvox_opengl"
	elif [[ "$CARCH" == "i686" ]]; then
		install -Dm755 "${srcdir}/sunvox/sunvox/linux_x86/sunvox" "${pkgdir}/usr/bin/sunvox"
		install -Dm755 "${srcdir}/sunvox/sunvox/linux_x86/sunvox_lofi" "${pkgdir}/usr/bin/sunvox_lofi"
	else
		printf -v _archlist -- "%s, " "${arch[@]}"
		printf -- ":: error: unsupported architecture '%s', must be one of " "${CARCH}"
		printf -- "%s\n" "${_archlist%, }"
		exit 2
	fi

	# preserve distributed structure of source package to install all
	# provided support files, except for the `sunvox` directory, which only
	# contains binaries for all architectures. Bash exclusion with
	# `!(sunvox)` needs `shopt -s extglob`, so I'll just delete the
	# unwanted copy to keep light on the shell feature requirements.
	cp -a "${srcdir}"/sunvox/* "${pkgdir}/opt/${pkgname}/"
	rm -r "${pkgdir}/opt/${pkgname}/sunvox"

	# supplied documentation is replicated in expected system-wide location
	cp -a "${srcdir}"/sunvox/docs/* "${pkgdir}/usr/share/doc/${pkgname}/"

	# enforce correct and consistent permissions. At least the examples/
	# subdir is world-accessible by default, so rather err on the side of
	# caution here, and set all permissions to a known good value.
	chmod -R 0644 \
	      "${pkgdir}/opt/${pkgname}"/* \
	      "${pkgdir}/usr/share/doc/${pkgname}"/* \
	      "${pkgdir}/usr/share/icons/hicolor"/*
	find "${pkgdir}/opt/${pkgname}" \
	     "${pkgdir}/usr/share/doc/${pkgname}" \
	     "${pkgdir}/usr/share/icons/hicolor" \
	     -type d -print0 | xargs -0 chmod 0755

	install -Dm644 "${srcdir}/sunvox/docs/license/sunvox.txt"  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "${srcdir}/sunvox/docs/license"/*  "${pkgdir}/usr/share/licenses/${pkgname}/"
}
