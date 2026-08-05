# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=tareqmy
_gitname=ferronote
_appname=${_gitname}
_alias=fn
pkgname=${_appname}-bin
pkgdesc="Notes at the speed of thought"

pkgver=1.2.7
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('x86_64-unknown-linux-musl')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}" "${_alias}")
conflicts=("${_appname}")

makedepends=('git')
depends=('git' 'openssh')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[0]}.tar.gz")
sha256sums=('2311ce5cf2c09182e87131843cbb200546b4f9c4540a97e90d639adbe508b6ae'
            'ba46e6aacd72ecd88d752f3633eaf283730e94c8f523847c432a91723a72cd0f')
sha256sums_x86_64=('ed570a0e52db293ae449a2dedde287793f93aa3c2960be509d1151d0ab88844c')


prepare() {
	cd "${srcdir}/" || exit

	rm -rf git && git clone -n --depth=1 --filter=tree:0 --branch "${_gitversion}" "${_ghurl}" git && cd git

	git sparse-checkout set --no-cone /docs && git checkout
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"
	ln -sf "/usr/bin/${_appname}" "${pkgdir}/usr/bin/${_alias}"

	# install -Dm644 "git/docs/${_appname}.1" "${pkgdir}/usr/share/man/man1/${_appname}.1"
	# ln -sf "/usr/share/man/man1/${_appname}.1.gz" "${pkgdir}/usr/share/man/man1/${_alias}.1"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	for doc in git/docs/*.md; do
		install -Dm644 "${doc}" "${pkgdir}/usr/share/doc/${pkgname}/$(name=$(basename "${doc}" .md); echo "${name^^}.md")"
	done

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
