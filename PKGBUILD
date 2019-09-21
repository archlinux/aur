# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=python-nifty-git
_pkgname=nifty
pkgver=5.0.1.r174.g12c5065b
pkgrel=1
pkgdesc="Versatile library designed to enable the development of signal inference algorithms that operate regardless of the underlying grids (spatial, spectral, temporal, ...) and their resolutions"
arch=('any')
license=('GPL3')
url="http://ift.pages.mpcdf.de/nifty/ift.html"
depends=('python' 'python-scipy' 'python-pypocketfft')
optdepends=("python-pyhealpix: harmonic transforms involving domains on the sphere"
	"python-nifty_gridder: radio interferometry responses"
	"python-mpi4py: MPI-parallel execution"
	"python-matplotlib: field plotting")
makedepends=('python-setuptools' 'git')
provides=("python-nifty=${pkgver}")
conflicts=('python-nifty')
source=("${pkgname}"::"git+https://gitlab.mpcdf.mpg.de/ift/${_pkgname}.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
    || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
	cd "${srcdir}/${pkgname}"
	python setup.py clean
	rm -rf build dist
	python setup.py build
}

package() {
	cd "${srcdir}/${pkgname}"
	python setup.py install --root="${pkgdir}" --optimize=1
}
