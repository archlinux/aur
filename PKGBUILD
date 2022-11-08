# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Andrea Feletto <andrea@andreafeletto.com>
_base=SciencePlots
pkgname=python-${_base,,}
pkgdesc="Matplotlib styles for scientific plotting"
pkgver=1.1.0
pkgrel=1
arch=(any)
url="https://github.com/garrettj403/${_base}"
license=(MIT)
depends=(python-matplotlib python-setuptools)
makedepends=(python-build python-installer python-wheel)
source=(${_base}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('9fcf47077bc72404bb976a0d853b1e5d0f3648837b7928ac81bbf353431a61610dda56c0815dc4bd46b1f96475853cf3a1e82734895eefe534854742771a428d')
provides=(${_base,,})
conflicts=(${_base,,}-git)

prepare() {
	cd ${_base}-${pkgver}
	mv ${_base} ${_base,,}
	# sed -i 's/packages=\["'${_base,,}'"\]/packages=\["'${_base}'"\]/' ${_base}-${pkgver}/setup.py
	# sed -i "s/'"${_base,,}"':/'"${_base}"':/" ${_base}-${pkgver}/setup.py
}

build() {
	cd ${_base}-${pkgver}
	python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
	cd ${_base}-${pkgver}
	PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl

	# Symlink license file
	local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
	install -d ${pkgdir}/usr/share/licenses/${pkgname}
	ln -s "${site_packages}/${_base}-${pkgver}.dist-info/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
