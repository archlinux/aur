# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: gkmcd <g@dramati.cc>

pkgname=python-pyscaffold
_pkg=PyScaffold
pkgver=4.4
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
	'python-sphinx'
	'python-wheel')
# checkdepends=('git' 'python-pytest' 'python-pytest-virtualenv')
changelog=CHANGELOG.rst
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkg::1}/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('94088d129b61cd9b4b4607c6a466759b1bb2ada36206d5ac20aa319edcc5d701')

prepare() {
	cd "$_pkg-$pkgver"
	sed -i '/sphinx_copybutton/d;/sphinxemoji/d' docs/conf.py
}

build() {
	cd "$_pkg-$pkgver"
	SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python -m build --wheel --no-isolation
	make -C docs man
}

## FIXME: test fails due to git config
# check() {
# 	cd "$_pkg-$pkgver"
# 	PYTHONPATH="$PWD/src" EDITOR=nano pytest \
# 		-c /dev/null \
# 		-m 'not slow and not system' \
# 		--disable-warnings
# }

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dvm644 docs/_build/man/pyscaffold.1 -t "$pkgdir/usr/share/man/man1/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv "$_site/$_pkg-$pkgver.dist-info/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
