# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Andres Alejandro Navarro Alsina <aanavarroa@unal.edu.co>
# Contributor:  GalSim developers team on GitHub

pkgname=python-galsim-git
_pkgname="${pkgname%-git}"
_pkg=GalSim
pkgver=2.7.0.r0.g41106ab80
_pkgver="${pkgver%.r*}"
pkgrel=1
pkgdesc="Modular galaxy image simulation toolkit"
arch=('x86_64')
url="https://github.com/GalSim-developers/GalSim"
license=('BSD')
depends=(
	'fftw'
	'python-astropy'
	'python-coord'
	'python-numpy')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'pybind11' 'eigen')
# checkdepends=('python-nose' 'python-pandas' 'python-yaml')
provides=("$_pkgname=$_pkgver")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	git -C "$_pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
	cd "$_pkgname"
	python -m build --wheel --no-isolation --skip-dependency-check
}

# check() {
# 	cd "$_pkgname"
# 	local _py="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
# 	PYTHONPATH="$PWD/build/lib.linux-$CARCH-$_py" nosetests
# }

package() {
	cd "$_pkgname"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/$_pkg-$_pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
