# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=aranor01
_gitname=sc
_appname=sc
pkgname=sunset-commander-bin
pkgdesc="A TUI file manager for linux"

pkgver=0.1.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('x86_64-unknown-linux-musl')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}" "${_appname}-action")
conflicts=("${pkgname%-bin}")

depends=('bash')

options=('!strip')

source=("LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_barch[0]}.tar.gz")
sha256sums=('57af8852adedeaab5160dbbb4e9025fe9807691097deedcdfea84cd9c9a76e25')
sha256sums_x86_64=('ff4f6bfff6d4315bd7e3c02d7df8991c2032fb1d4a8b9fe1fde88b9ff0f6ad58')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;
esac

prepare() {
	cd "${srcdir}/${_gitname}-${_CARCH}/docs/" || exit

	for doc in *.md; do
		new_name=$(echo "${doc%.*}" | sed -E 's/([^A-Z])([A-Z])/\1_\2/g' | tr '[:lower:]' '[:upper:]').${doc##*.}
		[ "$doc" != "$new_name" ] && mv -n "$doc" "$new_name"
	done
}

package() {
	cd "${srcdir}/${_gitname}-${_CARCH}/" || exit

	install -Dm755 ${_appname}{,-action} -t "${pkgdir}/usr/bin/"

	install -Dm644 scripts/*.sh -t "${pkgdir}/usr/share/${_appname}/scripts/"

	install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
	install -Dm644 docs/*.md -t "${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm644 ../LICENSE-${pkgver} "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
