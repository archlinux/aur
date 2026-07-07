# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=terroo
_pkgname=terlang
_appname=ter

pkgname=${_pkgname,,}
pkgdesc="Programming language for scripting with syntax similar to C++"

_commit=3f5fd254b5fb3e915c8d3e62036baccd3e9da262
pkgver=0.1.6
pkgrel=2

license=('GPL-3.0')

arch=('x86_64')

url="https://github.com/${_pkgauthor}/${pkgname}"

depends=('glibc' 'libgcc' 'libstdc++')
makedepends=('gcc' 'make' 'cmake')
provides=("${_appname}")

source=("${_pkgname}-${pkgver}::git+${url}.git#commit=${_commit}" "fix_comparision.patch")
sha256sums=('c9dacf6607aed1dc12337642bc354ed889cf6935cdcfe082ec3bfcd1895fd04b'
            'b478777a1977cae397ff22d0a12a54c0cc91b14becc0ab36db913be81e50a014')

_builddir='build'

prepare() {
	cd "${srcdir}/${_pkgname}-${pkgver}/" || exit 1

	patch -p1 -N < "../fix_comparision.patch"

	cmake -B ${_builddir} .
}

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}/" || exit 1

	cmake --build ${_builddir}
}

check() {
	cd "${srcdir}/${_pkgname}-${pkgver}/tests/" || exit 1

	./run.sh
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}/" || exit 1

	install -Dm755 "${_builddir}/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
