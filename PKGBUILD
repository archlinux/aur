# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

format_version() {
    local input="$1"

    # Counts how many dots are in the string
    local dot_count="${input//[^.]/}"

    # If there are 3 dots (a.b.c.d), apply the post transformation
    if [ "${#dot_count}" -ge 3 ]; then
        local prefix="${input%.*}"
        local suffix="${input##*.}"
        echo "${prefix}-beta.${suffix}"
    else
        # Otherwise (like a.b.c), return the input unchanged
        echo "${input}"
    fi
}

_gitauthor=clarkarch
_gitname=tfm-tui
_appname=${_gitname%-tui}
pkgname=${_gitname}-bin
pkgdesc="Modern mouse-first terminal file manager"

pkgver=0.1.0.0
pkgrel=1
_gitversion=v$(format_version "${pkgver}")

arch=('x86_64' 'aarch64')
_barch=('x86_64-linux' 'aarch64-linux')

url="https://${_gitauthor}.github.io/${_gitname}/"
_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.gz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.gz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}.gz")
sha256sums=('03453b688a9c19ede9db289e91f886e1ce6bf8fc065183cf72951c76a52c3bc1'
            'b2d4efd70a3897fa8ccfa35574c646be83ad2fd1459cf0e5661d2f48187cad4f')
sha256sums_x86_64=('46e48344b23affa7e6dc8332b19c857a2012dc5de5eacda895cb7a9cb550eb9f')
sha256sums_aarch64=('4bcd1a57d470ad81c72fdd31ad1b603a64c0d1abaf31d5df6a8d12ba46520f3b')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
