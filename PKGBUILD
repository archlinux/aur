# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: gkmcd <g@dramati.cc>

pkgname=python-pyscaffold
_pkg=PyScaffold
pkgver=4.2.2
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
	'python-setuptools'
	'python-setuptools-scm'
	'python-build'
	'python-installer'
	'python-wheel')
# checkdepends=('python-pytest' 'python-pytest-virtualenv')
changelog=CHANGELOG.rst
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkg::1}/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('11be56d21a0047ea604e7bc4349e95592cdc734b0a405082a6a4f2a7028dc896')

build() {
	cd "$_pkg-$pkgver"
	SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python -m build --wheel --no-isolation
}

## FIXME: test fails due to git config
# check() {
# 	cd "$pkgname"
# 	PYTHONPATH=./src EDITOR=nano pytest \
# 		-x \
# 		-c /dev/null \
# 		-m 'not slow and not system' \
# 		--disable-warnings
# }

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl

	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/$_pkg-$pkgver.dist-info/LICENSE.txt" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
