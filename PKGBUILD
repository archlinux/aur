# Maintainer: BrainDamage

pkgname=python-metpy
pkgver=1.5.1
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
optdepends=(
	'python-cartopy: for the examples'
	'python-shapely: for the examples'
	'python-geopandas: for the examples'
)
# documentation dependencies
#makedepends+=('python-sphinx' 'python-sphinx-gallery' 'python-myst-parser' 'python-netcdf4')
makedepends+=(python-build python-installer python-wheel)
checkdepends=('python-pytest' 'python-pytest-mpl' 'python-cartopy' 'python-shapely' 'python-netcdf4' 'python-packaging')
source=("${pkgname}-${pkgver}::https://files.pythonhosted.org/packages/source/${_basename::1}/${_basename}/${_basename}-${pkgver}.tar.gz")
sha256sums=('abee94033642c06efecac3aabc224449124f14fdb01de12001f324da54ce46c7')


build() {
	cd "${srcdir}/${_dirname}"
	export PYTHONHASHSEED=0
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_dirname}"
	find dist -name '*.whl' -exec python -m installer --compile-bytecode 1 --destdir="${pkgdir}" {} \;
	# not necessary for every package, but for those who it is, it'd generate conflict with others otherwise
	rm -rf "${pkgdir}/$(python -c 'import site; print(site.getsitepackages()[0])')/tests/"
	find . -maxdepth 1 -iname 'README*' -exec install -Dvm 644 {} -t "${pkgdir}/usr/share/doc/${_basename}" \;
	find . -maxdepth 1 -iname 'LICENSE*' -exec install -Dvm 644 {} -t "${pkgdir}/usr/share/licenses/${_basename}" \;
}


#check() {
#	cd "${srcdir}/${_dirname}"
#	# we need to prepend system's installation because the package is dumb and would otherwise override the io core module by name collision
#	export PYTHONPATH="$(python -c 'import sys; print(":".join(sys.path))'):${srcdir}/${_dirname}/build/lib/${_basename,,}"
#	pytest
#}
