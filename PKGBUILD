# Maintainer: Bao Trinh <qubidt at gmail dot com>

pkgname=python-darker
pkgver=2.1.0
pkgrel=1
pkgdesc='Apply black reformatting to Python files only in regions changed since a given commit'
arch=('any')
url=https://github.com/akaihola/darker
license=("BSD-3-Clause")
depends=(
	'python'
	'python-black'
	'python-darkgraylib'
	'python-graylint'
)
makedepends=(
	'git'
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-wheel'
)
checkdepends=(
	'python-pytest'
	'python-pytest-kwparametrize'
	'git'
	'python-regex'
	'python-pathspec'
	'python-pygments'
	'python-toml'
	'python-flynt'
	'python-isort'
)
optdepends=(
	'python-isort: for sorting import statements'
	'python-pygments: terminal syntax highlighting'
	'python-flynt: convert string literals to f-strings'
)
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha512sums=('a73b81acace69bea1c6ebf7b9c7d2715ca4e4788087eec4d383c775136a2c251c818a65101a3e10504421eb0d41f0d186f3799494649ac4bc91ed4813e8332de')

prepare() {
	cd "${pkgname}"
	# tests mistakenly included because tests dir contains __init__.py file
	echo "prune src/darker/tests" >> MANIFEST.in
}

build() {
	cd "${pkgname}"
	python -m build --no-isolation
}

check() {
	cd "${pkgname}"
	# override XDG_CONFIG_HOME to avoid global black config breaking tests
	XDG_CONFIG_HOME="${pkgdir}" \
	PYTHONPATH="${PYTHONPATH:+${PYTHONPATH}:}${PWD}/src" \
	python -m pytest src
}

package() {
	cd "${pkgname}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -vDm 644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
	install -vDm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
