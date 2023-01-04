# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Andrea Feletto <andrea@andreafeletto.com>
_base=SciencePlots
pkgname=python-${_base,,}
pkgdesc="Matplotlib styles for scientific plotting"
pkgver=2.0.1
pkgrel=2
arch=(any)
url="https://github.com/garrettj403/${_base}"
license=(MIT)
depends=(python-matplotlib)
makedepends=(python-setuptools python-build python-installer python-wheel)
source=(${_base}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('7fccf5aee720ee1920c3fa53f034acbbb9b7d391c67287490f50c42fbae2e5bb5f356108ab50e31fa3c67415ac469f537ec6362178498af4578475975056216e')
conflicts=(python-${_base,,}-git)

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
