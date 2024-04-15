# Maintainer: Bao Trinh <qubidt at gmail dot com>

pkgname=python-graylint
_pkgname="${pkgname#python-}"
pkgver=1.1.1
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
sha512sums=('b6d4e6fba44ea957976e591480f3340c21f129112b0403279aaf4c7a17bda36dc92ec50e4b8bb9877a997afb1a63e302f19aeba7e4c0a2374c97bba13386015a')

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
