# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Andrea Feletto <andrea@andreafeletto.com>
_base=SciencePlots
pkgname=python-${_base,,}
pkgdesc="Matplotlib styles for scientific plotting"
pkgver=2.0.0
pkgrel=1
arch=(any)
url="https://github.com/garrettj403/${_base}"
license=(MIT)
depends=(python-matplotlib python-setuptools)
makedepends=(python-build python-installer python-wheel)
source=(${_base}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('db9141ab496c030fcc7b9d95bbe6093a647490a3b472338450f865943b85a7cb18cedde2cd749693acae2a821d6b775dfeeca81449af1d92933f4ee6dd5c7e8f')
provides=(${_base,,})
conflicts=(${_base,,}-git)

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
