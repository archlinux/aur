# Maintainer: Bao Trinh <qubidt at gmail dot com>

pkgname=python-graylint
_pkgname="${pkgname#python-}"
pkgver=1.0.1
pkgrel=2
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
)
optdepends=('python-pygments: syntax highlighting')
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha512sums=('e2dd54f277c48ec19b784faec78fb3a78638aa052185da739cf185fb3328f8eeee75c9cd4f0a588b71f93f6d73e4740e38ee0f8285f5c1180f0ee55a492f362f')

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
	python -m installer -d "${pkgdir}" dist/*.whl
	install -Dm644 "LICENSE.rst" -t "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm644 "README.rst" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
