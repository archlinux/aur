#maintainer BrainDamage
pkgname=beets-bandcamp
pkgver=0.1.3
pkgrel=1
pkgdesc='Plugin for beets to use bandcamp as an autotagger source.'
arch=('any')
url='https://github.com/unrblt/beets-bandcamp'
license=('GPL')
depends=('python' 'python-six' 'beets' 'python-requests' 'python-beautifulsoup4' 'python-isodate')
source=("https://github.com/unrblt/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('250ae2845bbbc1577efff786e95739e49c1382de92881576445d3e6ac75d01f4')

makedepends+=('python-setuptools')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py install --skip-build --root="${pkgdir}/" --prefix="/usr"
	#remove __init__.py which is just a copy of beets own plugin init system and would conflict
	packagesDir="$(python -c 'import site; print(site.getsitepackages()[0])')"
	pyShortVer="$(python --version | sed s/'Python '/py/ | sed s/'\.[[:digit:]]*$'//)"
	pyShortestVer="$(python --version | sed s/'Python '// | sed s/'\.[[:digit:]]*$'// | sed s/'\.'// )"
	sed --in-place /__init__.py/d "${pkgdir}${packagesDir}/beets_bandcamp-${pkgver}-${pyShortVer}.egg-info/SOURCES.txt"
	rm "${pkgdir}${packagesDir}/beetsplug/__init__.py"
	rm "${pkgdir}${packagesDir}/beetsplug/__pycache__/__init__.cpython-${pyShortestVer}.pyc"
}