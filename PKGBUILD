# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=igor-petruk
_gitname=scriptisto
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A language-agnostic \"shebang interpreter\" that enables you to write scripts in compiled languages"

pkgver=2.2.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('x86_64-unknown-linux-musl')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Apache-2.0')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

makedepends=('git')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tbz2::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.bz2")
sha256sums=('643efc7af648f1a463d692a3a90a4bc3a30bb97ac7d94f123ff45fb690740d07'
            'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_x86_64=('0e31db3c29fd3868257d771c4851b4af35af2794116287dbe55068fa33539cee')

prepare() {
	cd "${srcdir}/" || exit

	rm -rf git && git clone -n --depth=1 --filter=tree:0 "${_ghurl}" git

	cd git && git sparse-checkout set --no-cone /man && git checkout

	cp -rfa man "${srcdir}/" && cd .. && rm -rf git
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	for manpage in man/*.1; do
		install -Dm644 "${manpage}" "${pkgdir}/usr/share/man/man1/$(basename ${manpage})"
	done

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
