# Maintainer: Joel Goguen <contact+aur@jgoguen.ca>
# Contributor: Vlad M. <vlad@archlinex.net>
# Contributor: Gordin <9ordin @t gmail>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=flow
pkgver=0.39.0
pkgrel=1
pkgdesc="A static typechecker for JavaScript"
arch=('i686' 'x86_64')
depends=('libelf' 'ocaml')
makedepends=('ocamlbuild')
url="http://flowtype.org"
license=('BSD')
source=(
		"https://github.com/facebook/${pkgname}/archive/v${pkgver}.tar.gz"
		'Makefile-fPIC.patch'
		'Makefile-no-flow-check.patch'
)
sha256sums=(
		'67308fcbfa2fc28996636a1be4d1b060c679af1fb570395243ada8a3d4a2ca48'
		'4df293e75de2461e0d741a1a6c4448494f4b2cd9bcc0ea3eb2dd41d64b49e730'
		'5a8490c237a498d1523a1686800d9cd8bde2159f10c5efc12097ded91393e9cf'
)

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	for f in Makefile-fPIC.patch Makefile-no-flow-check.patch; do
		msg "Applying patch ${f}"
		patch -p0 <"${srcdir}/../${f}"
	done
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	msg 'Building...'
	make
}

check() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	# This ugly hack comes after conversations on #flowtype suggest that the 
	# incremental tests are not necessarily reliable - they fail when they
	# shouldn't, and not reliably, and with different frequencies on different
	# platforms. So let's be done with them for now...
	rm -r tests/incremental*

	msg 'Checking...'
	if test -z "${FLOW_RUNTESTS_PARALLELISM}" ; then
		/usr/bin/env FLOW_RUNTESTS_PARALLELISM=2 make test
	else
		make test
	fi
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	msg 'Installing license...'
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	msg 'Installing documentation...'
	install -dm 755 "${pkgdir}/usr/share/doc/${pkgname}"
	cp -dpr --no-preserve=ownership examples "${pkgdir}/usr/share/doc/${pkgname}"

	msg 'Installing...'
	install -Dm 755 bin/flow "${pkgdir}/usr/bin/flow"
}
