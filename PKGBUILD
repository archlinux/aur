# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

format_version() {
    local input="$1"

    # Counts how many dots are in the string
    local dot_count="${input//[^.]/}"

    # If there are 3 dots (a.b.c.d), apply the post transformation
    if [ "${#dot_count}" -ge 3 ]; then
        local prefix="${input%.*}"
        local suffix="${input##*.}"
        echo "${prefix}.post${suffix}"
    else
        # Otherwise (like a.b.c), return the input unchanged
        echo "${input}"
    fi
}

_gitauthor=NSPC911
_gitname=rovr
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A post-modern terminal file explorer"

pkgver=0.9.1.1
pkgrel=1
_gitversion=v$(format_version "${pkgver}")

arch=('x86_64' 'aarch64')
_barch=('linux-x64-nuitka' 'linux-arm64-nuitka')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")

makedepends=('unzip')
depends=('bash' 'glibc' 'libgcc' 'libstdc++' 'zlib')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.zip::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.zip")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.zip::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}.zip")
sha256sums=('e21fdf3cc5b3ba6ac08610ef916e66ef3acde41d44d2a89391204c3765e7ede6'
            'b1f7cd544c998e25bcc990abc8c1f7c46d01b3a2ec61efb454ea932cbcc69445')
sha256sums_x86_64=('0c42e5c089e05c714d9448db8b3946b3bf68aa5b0613b09b7f72b5dbfc8efacc')
sha256sums_aarch64=('8e8887f940d00f3a2f056c796ace8d4ad044fd178926cd518a5186cd2ba73292')

noextract=("${source_x86_64[@]%%::*}" "${source_i686[@]%%::*}" "${source_aarch64[@]%%::*}")

package() {
	cd "${srcdir}/" || exit

	install -dm755 "${pkgdir}/opt/${_appname}"

	unzip "${_appname}-${CARCH}-${pkgver}.zip" -d "${pkgdir}/opt/${_appname}"

	install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${_appname}" << END
#!/usr/bin/env sh
exec /opt/${_appname}/${_appname} "\$@"
END

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
