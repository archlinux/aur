# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: gkmcd <g@dramati.cc>

pkgname=python-pyscaffold
_pkg=pyscaffold
pkgver=4.6
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
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('f51a97d575a93ddbf9d4946de7903fdda9b539b2381eefa760ebaa399778f834c8aa9bbedfecbd800c0b6ab1167ea448ebf1865d002fd8ad22123bb84090eab9')

prepare() {
	cd "$_pkg-$pkgver"
	sed -i '/sphinx_copybutton/d;/sphinxemoji/d' docs/conf.py
}

build() {
	cd "$_pkg-$pkgver"
	SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python -m build --wheel --no-isolation
	#make -C docs man
}

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	#install -Dvm644 docs/_build/man/pyscaffold.1 -t "$pkgdir/usr/share/man/man1/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv "$_site/$_pkg-$pkgver.dist-info/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
