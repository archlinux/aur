# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Hans-Nikolai Viessmann <hans AT viess.mn>

pkgname=python-spython
_pkg="${pkgname#python-}"
pkgver=0.2.1
pkgrel=1
pkgdesc="CLI tool for working with Singularity Python"
arch=('any')
url='https://github.com/singularityhub/singularity-cli'
license=('MPL2')
depends=('python-requests' 'python-semver')
optdepends=('singularity-container: use and manipulate Singularity Containers')
makedepends=('python-build' 'python-installer' 'python-pytest-runner' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/s/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('beb8866751268ebbc38e05ee7d14d99a144f2a9b21409b16e3bcab9ebd452a19')

prepare() {
	cd "$_pkg-$pkgver"
	rm -rf "$_pkg.egg-info"
	sed -i '/spython/d' MANIFEST.in
	sed -i '/find_packages/s/()/(exclude=["*tests*"])/' setup.py
}

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

# check() {
# 	cd "$_pkg-$pkgver"
# 	python setup.py pytest
# }

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
}
