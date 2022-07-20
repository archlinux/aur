# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: gkmcd <g@dramati.cc>

pkgname=python-pyscaffold
_pkg=PyScaffold
pkgver=4.3
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
	'python-cookiecutter: Create custom scaffold templates.'
	'python-django: Scaffold Django projects.'
	'python-pre-commit: Use Git pre-commit hooks.'
	'python-pytest-cov: Generate a coverage report for your project.'
	'python-pytest-runner: Use the integrated unit testing.'
	'python-pytest: Use the integrated unit testing.'
	'python-sphinx: Support building documentation with Sphinx.')
makedepends=(
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-setuptools-scm'
	'python-wheel')
# checkdepends=('python-pytest' 'python-pytest-virtualenv')
changelog=CHANGELOG.rst
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkg::1}/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('1a8c39bbad9abc121d6e126035740ba5f043434abb432f368a3a76596184b3ed')

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
