# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Andres Alejandro Navarro Alsina <aanavarroa@unal.edu.co>
# Contributor: Erin Sheldon

pkgname=python-ngmix-git
_pkg="${pkgname%-git}"
pkgver=2.1.0.r5.g892fd4a
_pkgver="${pkgver%.r*}"
pkgrel=1
pkgdesc='Gaussian mixtures and image processing'
arch=('any')
url="https://github.com/esheldon/ngmix"
license=('GPL')
depends=('python-numpy' 'python-numba')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
# checkdepends=('python-pytest' 'python-fitsio' 'python-galsim')
provides=("$_pkg=$_pkgver")
conflicts=("$_pkg")
source=("$_pkg::git+$url"
        'setup.py.patch')
sha256sums=('SKIP'
            '85057d5ec4f082a3599084dbe0e874be2af2a0f91786a10933b3368e6e025898')

pkgver() {
	git -C "$_pkg" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
	patch -p1 -d "$_pkg" < setup.py.patch
	sed -i "s/__version__/$_pkgver/" "$_pkg/setup.py"
}

build() {
	cd "$_pkg"
	python -m build --wheel --no-isolation
}

## conflicting dependencies
# check() {
# 	cd "$_pkg"
# 	pytest -x
# }

package() {
	cd "$_pkg"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
}
