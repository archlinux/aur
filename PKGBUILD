# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Andres Alejandro Navarro Alsina <aanavarroa@unal.edu.co>
# Contributor: Erin Sheldon

pkgname=python-ngmix
_pkg="${pkgname#python-}"
pkgver=2.2.0
pkgrel=1
pkgdesc='Gaussian mixtures and image processing'
arch=('any')
url="https://github.com/esheldon/ngmix"
license=('GPL')
depends=('python-numpy' 'python-numba')
optdepends=(
	'python-galsim: for metacalibration operations'
	'python-scikit-learn: for sampling multivariate PDFs'
	'python-scipy: for image fitting using Levenberg-Marquardt fitter')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
# checkdepends=('python-pytest' 'python-galsim' 'python-scikit-learn' 'python-scipy')
changelog=CHANGES.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        'setup.py.patch')
sha256sums=('a499f5b0ae5888f50fb97e8b59107d529f296b7a0047129f629aa4e99ef7df06'
            '85057d5ec4f082a3599084dbe0e874be2af2a0f91786a10933b3368e6e025898')

prepare() {
	patch -p1 -d "$_pkg-$pkgver" < setup.py.patch
	sed -i "s/__version__/$pkgver/" "$_pkg-$pkgver/setup.py"
}

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

# check() {
# 	cd "$_pkg-$pkgver"
# 	pytest -x
# }

package_python-ngmix() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
}
