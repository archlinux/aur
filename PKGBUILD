# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-botorch
_pkg="${pkgname#python-}"
pkgver=0.15.1
pkgrel=1
pkgdesc='Bayesian Optimization in PyTorch'
arch=('any')
url='https://github.com/pytorch/botorch'
license=('MIT')
depends=(
	'python-gpytorch'
	'python-linear-operator'
	'python-multipledispatch'
	'python-numpy'
	'python-pyre_extensions'
	'python-pyro-ppl'
	'python-pytorch'
	'python-requests'
	'python-scipy'
	'python-threadpoolctl'
	'python-typing_extensions'
	'python>=3.7')
makedepends=(
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-setuptools-scm'
	'python-wheel')
checkdepends=('python-pytest')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e1da1fb5f18fe3a2bd905b6e2c6f15f1ae8d9ded262e8816e4166aa347cbc998')

build() {
	cd "$_pkg-$pkgver"
	SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python -m build --wheel --no-isolation
}

check() {
	cd "$_pkg-$pkgver"
	PYTHONPATH="$PWD" pytest -x --disable-warnings || true
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/$_pkg-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
