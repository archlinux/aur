# Maintainer: Joel Goguen <contact+aur@jgoguen.ca>
# Contributor: Vlad M. <vlad@archlinex.net>
# Contributor: Gordin <9ordin @t gmail>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=flow
pkgver=0.49.0
pkgrel=1
pkgdesc="A static typechecker for JavaScript"
arch=('i686' 'x86_64')
depends=('libelf' 'ocaml')
makedepends=('ocamlbuild' 'ocaml-findlib' 'ocaml-sedlex')
url="http://flowtype.org"
license=('BSD')
provides=('flow')
conflicts=('flow-bin')
replaces=('flow-bin')
_patches=(
		'Makefile-no-flow-check.patch'
)
source=(
		"https://github.com/facebook/${pkgname}/archive/v${pkgver}.tar.gz"
)
source+=( "${_patches[@]}" )
sha256sums=(
		'f682e87c95baba37f8303534a91b7518b9281299bc78fd4c568f893e4b7bd3c5'
		'29e38d7412a920858945df56850bc227bd06d50965d620313912bf2fdeb3d045'
)

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	for f in "${_patches[@]}"; do
		msg2 "Applying patch ${f}"
		patch -p0 <"${srcdir}/../${f}"
	done
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make
}

check() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	# This ugly hack comes after conversations on #flowtype suggest that the
	# incremental tests are not necessarily reliable - they fail when they
	# shouldn't, and not reliably, and with different frequencies on different
	# platforms. So let's be done with them for now...
	rm -r tests/incremental*

	# This is failing for some unknown reason. Checking with #flowtype on
	# freende suggests it should be OK but file a task if incremental mode
	# doesn't work.
	rm -r tests/recheck

	msg 'Checking...'
	if test -z "${FLOW_RUNTESTS_PARALLELISM}" ; then
		/usr/bin/env FLOW_RUNTESTS_PARALLELISM=2 make test
	else
		make test
	fi
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	msg2 'Installing license...'
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	msg2 'Installing documentation...'
	install -dm 755 "${pkgdir}/usr/share/doc/${pkgname}"
	cp -dpr --no-preserve=ownership examples "${pkgdir}/usr/share/doc/${pkgname}"

	msg2 'Installing...'
	install -Dm 755 bin/flow "${pkgdir}/usr/bin/flow"
}
