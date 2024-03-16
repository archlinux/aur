# Maintainer: Bao Trinh <qubidt at gmail dot com>

pkgname=python-graylint
_pkgname="${pkgname#python-}"
pkgver=1.0.1
_commit=0f0106d90e8c78d7d58827dcf20c54caeb7c5d4c # tags/v1.0.1
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
)
optdepends=('python-pygments: syntax highlighting')
source=("${pkgname}::git+${url}.git#commit=${_commit}")
sha256sums=('SKIP')

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
	PYTHONPATH=src pytest -v "src/${_pkgname}"
}

package() {
	cd "${pkgname}"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm644 "LICENSE.rst" -t "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm644 "README.rst" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
