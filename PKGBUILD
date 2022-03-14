# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: gkmcd <g@dramati.cc>

## Must use git to pull sources because of python-setuptools-scm

pkgname=python-pyscaffold
pkgver=4.2
pkgrel=1
pkgdesc="Python project template generator with batteries included"
url="https://github.com/pyscaffold/pyscaffold"
arch=('any')
license=('MIT')
depends=(
	'python-appdirs'
	'python-configupdater'
	'python-packaging'
	'python-platformdirs'
	'python-tomlkit')
optdepends=(
	'python-django: Scaffold Django projects.'
	'python-cookiecutter: Create custom scaffold templates.'
	'python-pre-commit: Use Git pre-commit hooks.'
	'python-sphinx: Support building documentation with Sphinx.'
	'python-pytest: Use the integrated unit testing.'
	'python-pytest-runner: Use the integrated unit testing.'
	'python-pytest-cov: Generate a coverage report for your project.')
makedepends=(
	'git'
	'python-setuptools-scm'
	'python-build'
	'python-installer'
	'python-wheel')
checkdepends=('python-pytest' 'python-pytest-virtualenv')
changelog=CHANGELOG.rst
source=("$pkgname::git+$url/#tag=v$pkgver")
sha256sums=('SKIP')

build() {
	cd "$pkgname"
	python -m build --wheel --no-isolation
}

check() {
	cd "$pkgname"
	PYTHONPATH=./src EDITOR=nano pytest \
		-x \
		-c /dev/null \
		-k 'not slow and not system' \
		--disable-warnings
}

package() {
	export PYTHONHASHSEED=0
	cd "$pkgname"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
