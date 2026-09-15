# Maintainer: @RubenKelevra <rubenkelevra@gmail.com>
# Contributor: Junker <dk@junkeria.club>

pkgname='sarif-tools'
pkgver=3.0.5
pkgrel=1
pkgdesc='A set of Python command line tools for working with SARIF files produced by code analysis tools'
arch=('any')
url='https://github.com/microsoft/sarif-tools'
license=('MIT')
depends=(
	'python>=3.8'
	'python-docx>=1.1.2'
	'python-jinja>=3.1.6'
	'python-jsonpath-ng>=1.6.0'
	'python-matplotlib>=3.7'
	'python-yaml>=6.0.1'
)
makedepends=(
	'python-build'
	'python-installer'
	'python-poetry-core>=1.0.0'
	'python-wheel'
)
checkdepends=(
	'python-jsonschema>=4.23.0'
	'python-pytest>=8.3'
)
optdepends=('git: blame command')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('36d7baacb279bbb9367dcc1cb128db8961b9b53d127e71eee475b8a2b5b737439fb3745190115fe233cc81109c1a7315389b8b6ad3df0e72878905fe963024eb')

build() {
	cd -- "${srcdir}/${pkgname}-${pkgver}" || return 1
	python -m build --wheel --no-isolation
}

check() {
	cd -- "${srcdir}/${pkgname}-${pkgver}" || return 1
	MPLBACKEND='Agg' python -m pytest -q --disable-plugin-autoload
}

package() {
	cd -- "${srcdir}/${pkgname}-${pkgver}" || return 1
	python -m installer --destdir="${pkgdir}" --compile-bytecode 0 --compile-bytecode 2 dist/*.whl
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
