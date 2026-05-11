# Maintainer: Rafael Baboni Dominiquini <rafaeldominiquini AT gmail DOT com>

_exec_original=tm
_exec_final=textomatic

_name=textomatic
pkgname=python-$_name
pkgver=0.3.0
pkgrel=1
pkgdesc="Scratchpad for tabular data transformations"
arch=('any')
url="https://github.com/dankilman/${_name}"
license=('MIT')
provides=("${_exec_final}")
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'python-poetry-core')
depends=('python' 'python-pygments' 'python-prompt_toolkit' 'python-click' 'python-tabulate' 'python-wcwidth' 'python-pyparsing' 'python-clevercsv')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
		"fix_dataclass.patch")
sha256sums=('efc7873e6348accd95f3ca2e4d02fecd3aa3cdba1f245052ddadc2ab66fdb278'
            'c20f26320230e52c5d93192c6b2dfedc95a951585d3563221969fb9d56e6d7ee')

prepare() {
	cd "${_name}-${pkgver}"

	patch -Np1 -i ../fix_dataclass.patch

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
