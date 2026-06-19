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

pkgver=0.9.2
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
sha256sums=('7e331c8d7ad76b984c11c23de3b860e9f93cae4bad82c264475788a5fc6866ac'
            'b1f7cd544c998e25bcc990abc8c1f7c46d01b3a2ec61efb454ea932cbcc69445')
sha256sums_x86_64=('dcb5742ad9fe77b5b2b9a25348a4590f7abcf3c467dae37f3ce5453a42070e0a')
sha256sums_aarch64=('848ce599a763cd143f721842bba7b018d75bc29c5a9d3d71e969ce274a7588a5')

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
