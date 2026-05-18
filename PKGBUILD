# Maintainer: RubenKelevra <rubenkelevra@gmail.com>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=python-tree-sitter-c
_gitpkgname=tree-sitter-c
pkgver=0.24.1
pkgrel=4
pkgdesc='Python Bindings for tree-sitter-c'
arch=(
      'x86_64'
      'aarch64'
)
url='https://github.com/tree-sitter/tree-sitter-c'
license=('MIT')
depends=(
	'python'
	"tree-sitter-c=${pkgver}"
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
	"${_gitpkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_gitpkgname}.tar.gz"
)

# tar is slightly broken with weird hardlinks, so we need to handle this manually
noextract=(
	"${_gitpkgname}-${pkgver}.tar.gz"
)


b2sums=('a1f92aa5d9553c36d1f9a2c876bf983b64f7ae511291c94671e2c67058a5deaed74663f0e7498b2e9964e91028a9be2d179c59ab9ee82dc4c6cbec413c5d6bf9')

prepare() {
	rm -rf "${srcdir}/${_gitpkgname}-${pkgver}"
	mkdir -p "${srcdir}/${_gitpkgname}-${pkgver}"
	tar -xzf "${srcdir}/${_gitpkgname}-${pkgver}.tar.gz" -C "${srcdir}/${_gitpkgname}-${pkgver}"
}

build() {
	cd "${srcdir}/${_gitpkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_gitpkgname}-${pkgver}"

	python -I -m installer --destdir="${pkgdir}" --compile-bytecode 2 dist/*.whl
	install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
	install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
