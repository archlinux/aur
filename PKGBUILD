# Maintainer: Philipp A. <flying-sheep@web.de>
# Contributor: Torleif Skår <torleif.skaar AT gmail DOT com>

_name=plotnine
pkgname=python-$_name
pkgver=0.15.0
pkgrel=1
pkgdesc='A grammar of graphics for python'
arch=(any)
url="https://github.com/has2k1/$_name"
license=('MIT')
depends=(
	python
	python-matplotlib
	python-pandas
	python-mizani
	python-numpy
	python-scipy
	python-statsmodels
)
optdepends=(
	'python-adjusttext: Library to avoid/minimize text overlaps in plots'
	'python-geopandas: Geospatial data support'
	'python-scikit-learn: gaussian process smoothing, kernel density implementation'
	'python-scikit-misc: loess smoothing'
	'python-shapely: Manipulation and analysis of geometric objects in the Cartesian plane'
)
makedepends=(
	python-build
	python-installer
	python-wheel
	python-setuptools
	python-setuptools-scm
)
checkdepends=(
	python-pytest
	python-pytest-cov
	python-vcrpy
	python-geopandas
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('8dc491f5000062f6af7cf29429ee78b617daa8b2c22a1dd4e8b593f08bb51c20')

build() {
	cd "${_name}-${pkgver}"
	python -m build --wheel --no-isolation
}

# Image tests are flaky, skip by default
BUILDENV+=('!check')

check() {
	cd "${_name}-${pkgver}"
	# Most tests are broken due to some plot components being shifted 1-2 pixels
	# PYTHONPATH=. pytest --color=yes -v --maxfail=1
}

package() {
	cd "${_name}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}
