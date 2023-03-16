# Maintainer: BrainDamage

pkgname=python-metpy
pkgver=1.4.1
pkgrel=1
_basename="MetPy"
_dirname="${_basename}-${pkgver}"
pkgdesc="collection of tools in Python for reading, visualizing and performing calculations with weather data."
arch=(any)
url="https://unidata.github.io/MetPy"
license=('BSD')
depends=('python' 'python-matplotlib' 'python-numpy' 'python-scipy'
	'python-pandas' 'python-pint' 'python-pooch' 'python-xarray'
	'python-pyproj' 'python-traitlets')
optdepends=('python-cartopy: for the examples' 'python-shapely: for the examples')
makedepends=('python-setuptools' 'python-setuptools-scm')
# documentation dependencies
#makedepends+=('python-sphinx' 'python-sphinx-gallery' 'python-myst-parser' 'python-netcdf4')
checkdepends=('python-pytest' 'python-pytest-mpl' 'python-cartopy' 'python-shapely' 'python-netcdf4')
source=("${pkgname}-${pkgver}::https://github.com/Unidata/${_basename}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c8f0c6a449386844a3712b5bd95262ddb755aeceba7a68b429798ccaa3eb8699')

build() {
	cd "${srcdir}/${_dirname}"
	export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}"
	export PYTHONHASHSEED=0
	python setup.py build
}


package() {
	cd "${srcdir}/${_dirname}"
	python setup.py install --optimize=1 --skip-build --root="${pkgdir}/" --prefix="/usr"
	# not necessary for every package, but for those who it is, it'd generate conflict with others otherwise
	rm -rf "${pkgdir}/$(python -c 'import site; print(site.getsitepackages()[0])')/tests/"
}


#check() {
#	cd "${srcdir}/${_dirname}"
#	# we need to prepend system's installation because the package is dumb and would otherwise override the io core module by name collision
#	export PYTHONPATH="$(python -c 'import sys; print(":".join(sys.path))'):${srcdir}/${_dirname}/build/lib/${_basename,,}"
#	pytest
#}
