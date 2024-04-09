# Maintainer: Bao Trinh <qubidt at gmail dot com>

pkgname=python-graylint
_pkgname="${pkgname#python-}"
pkgver=1.1.0
pkgrel=1
pkgdesc='Filter linter messages from various Python linters to only those which were caused by recent changes to the code base being linted'
arch=(any)
url="https://github.com/akaihola/graylint"
license=("BSD-3-Clause")
depends=(
	'python'
	'python-darkgraylib'
)
makedepends=(
	'git'
	'python-build'
	'python-installer'
	'python-wheel'
	'python-setuptools'
)
checkdepends=(
	'python-pytest'
	'mypy'
	'python-pytest-kwparametrize'
)
optdepends=('python-pygments: syntax highlighting')
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha512sums=('3441eaa6bd83d831ff1ebc904e65958b21148bc18eb791ab0d474f4d32167e3c9ac030baf86a48cd23a8aa362e34cca654687f7c4078ea755fe73aaae3677fd2')

prepare() {
	cd "${pkgname}"
	# tests mistakenly included because tests dir contains __init__.py file
	echo "prune src/graylint/tests" >> MANIFEST.in
}

build() {
	cd "${pkgname}"
	python -m build --no-isolation
}

check() {
	cd "${pkgname}"
	PYTHONPATH=src \
	pytest -v "src/${_pkgname}"
}

package() {
	cd "${pkgname}"
	python -m installer -d "${pkgdir}" dist/*-"${pkgver}"-*.whl
	install -Dm644 "LICENSE.rst" -t "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm644 "README.rst" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
