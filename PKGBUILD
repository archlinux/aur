# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=aranor01
_gitname=sc
_appname=scd
pkgname=sunset-commander-bin
pkgdesc="A TUI file manager for linux"

pkgver=0.2.0
pkgrel=2
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('x86_64-unknown-linux-musl')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('bash')

options=('!strip')

source=("LICENSE-${pkgver}::${_ghurlraw}/LICENSE"
		"DEFAULT_KEY_BINDINGS-${pkgver}.md::${_ghurlraw}/DefaultKeyBindings.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
sha256sums=('57af8852adedeaab5160dbbb4e9025fe9807691097deedcdfea84cd9c9a76e25'
            'a3f1972b1d285766709491b915789ed94b76d036973d4b872f0e6e2cc2a17a38')
sha256sums_x86_64=('6f439388db8ebc6fe5ba16f2e3077b8cee0510520e5dd27b9fd773666d9bab99')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;
esac

prepare() {
	cd "${srcdir}/${_appname}-${_CARCH}/" || exit

	mv ../../DEFAULT_KEY_BINDINGS-${pkgver}.md ./docs/DefaultKeyBindings.md
}

package() {
	cd "${srcdir}/${_appname}-${_CARCH}/" || exit

	install -Dm755 ${_appname}{,-action} -t "${pkgdir}/usr/bin/"

	install -Dm755 scripts/*.sh -t "${pkgdir}/usr/share/${_appname}/scripts/"

	install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
	install -Dm644 docs/*.md -t "${pkgdir}/usr/share/doc/${pkgname}/"

	for old_doc in ${pkgdir}/usr/share/doc/${pkgname}/*.md; do
		new_doc=$(dirname ${old_doc})/$(basename "${old_doc%.*}" | sed -E 's/([^A-Z])([A-Z])/\1_\2/g' | tr '[:lower:]' '[:upper:]').${old_doc##*.}
		[ "$old_doc" != "$new_doc" ] &&  mv "${old_doc}" "${new_doc}"
	done

	install -Dm644 ../LICENSE-${pkgver} "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
