# Maintainer: Rafael Baboni Dominiquini <rafaeldominiquini AT gmail DOT com>

_exec_original=mp
_exec_final=multiplex

_name=multiplex
pkgname=python-$_name
pkgver=0.6.1
pkgrel=3
pkgdesc="View output of multiple processes, in parallel, in the console, with an interactive TUI"
arch=('any')
url="https://github.com/dankilman/${_name}"
license=('MIT')
provides=("${_exec_final}")
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'python-poetry-core')
depends=('python' 'python-aiofiles' 'python-aiostream' 'python-click' 'python-easyansi' 'python-wcwidth' 'python-pyte')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
		"fix_typo.patch")
sha256sums=('4fe4a89eaeae6b33d199e772dda211ac1c3de10438c4534b790860a291c722dc'
            '20c687508b10d5b0f56f9c2d40dbce9196137d75ded5328043bbb67a4b4d5d93')

prepare() {
	cd "${_name}-${pkgver}"

	patch -Np1 -i ../fix_typo.patch

	sed -i -e "s/\b${_exec_original}/${_exec_final}/g" "README.md"
}

build() {
	cd "${_name}-${pkgver}"

	python -m build --wheel --no-isolation
}

package() {
	cd "${_name}-${pkgver}"

	python -m installer --destdir="${pkgdir}" dist/*.whl

	mv "${pkgdir}/usr/bin/${_exec_original}" "${pkgdir}/usr/bin/${_exec_final}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
