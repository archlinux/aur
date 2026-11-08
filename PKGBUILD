# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=Thre4dripper
_gitname=tidefetch
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A keyboard-first download manager for aria2"

pkgver=0.1.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('aria2')

options=('!strip')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[1]}.tar.gz")
sha256sums_x86_64=('50caf3b8326b9ef3dad736449deeeb3f28fc244dde248b81fb528b73d4564c1a')
sha256sums_aarch64=('2809876857b17313645b8c9096655dd0ed3e4051abd0b2d01ef1d2de89a9102c')


prepare() {
	cd "${srcdir}/" || exit

	function _capitalize() {
		local file=$0

		dir=$(dirname "$file")
		base=$(basename "$file" .md)
		new_base=$(echo "$base" | tr "[:lower:]" "[:upper:]" | tr "-" "_")

		destination="$dir/${new_base}.md"

		[ "$file" != "$destination" ] && mv -f "$file" "$destination"
	}

	export -f _capitalize

	find docs -type f -name "*.md" -exec bash -c '_capitalize "$1"' {} \;
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	cp -rfa "docs" "${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
