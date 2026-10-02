# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=programmersd21
_gitname=flint
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A small bytecode interpreter and scripting language"

pkgver=0.5.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('linux-x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

makedepends=('git')
depends=('glibc' 'libgcc')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[0]}.tar.gz")
sha256sums=('9a01adf6f77e331014dfd34fe659e41fb312e41af76aa00ad4a402bf30ab5589'
            'cfc3366f4709236ec9dca210979fc0e8c0eeee1c4f45053c6ac0b72fead9c694')
sha256sums_x86_64=('bf2f9adc3d7ea302ebf831c3edbd54ba3f100f56d2e66814aea2c48e84a95c1e')


prepare() {
	cd "${srcdir}/" || exit

	rm -rf git && git clone -n --depth=1 --filter=tree:0 "${_ghurl}" git

	cd git && git sparse-checkout set --no-cone /examples /docs && git checkout

	cp -rfa examples docs "${srcdir}/" && cd .. && rm -rf git
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -dm755 "${pkgdir}/usr/share/${_appname}/"
	cp -rfa examples "${pkgdir}/usr/share/${_appname}/"

	for doc in docs/*.md; do
		install -Dm644 "${doc}" "${pkgdir}/usr/share/doc/${pkgname}/$(name=$(basename "${doc}" .md); echo "${name^^}.md")"
	done

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
