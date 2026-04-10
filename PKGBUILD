# Maintainer: RubenKelevra <rubenkelevra@gmail.com>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=python-tree-sitter-cpp
_gitpkgname=tree-sitter-cpp
pkgver=0.23.4
pkgrel=1
pkgdesc='Python Bindings for tree-sitter-cpp'
arch=('x86_64')
url='https://github.com/tree-sitter/tree-sitter-cpp'
license=('MIT')
depends=(
	'python'
	"tree-sitter-cpp=${pkgver}"
	'python-tree-sitter'
	'tree-sitter'
)
makedepends=(
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-wheel'
)

source=(
	"${_gitpkgname}-${pkgver}.tar.xz::${url}/releases/download/v${pkgver}/${_gitpkgname}.tar.xz"
)

# tar is slightly broken with weird hardlinks, so we need to handle this manually
noextract=(
	"${_gitpkgname}-${pkgver}.tar.xz"
)

b2sums=('409f866165e81845ace0e59e388477b254de3b2d099370d7a0d580adaa7de889d8d55915caff35102be33e174dae40ac56815190cbf300f8128d7d51fe0ed7e5')

prepare() {
	rm -rf "${srcdir}/${_gitpkgname}-${pkgver}"
	mkdir -p "${srcdir}/${_gitpkgname}-${pkgver}"
	tar -xJf "${srcdir}/${_gitpkgname}-${pkgver}.tar.xz" -C "${srcdir}/${_gitpkgname}-${pkgver}"
}

build() {
	cd "${srcdir}/${_gitpkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_gitpkgname}-${pkgver}"
	python -I -m installer --destdir="${pkgdir}" dist/*.whl
	install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
	install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
