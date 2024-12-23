# Maintainer: crl <crl18039102576@126.com>
pkgname=python-scipy-mkl-tbb
pkgver=1.14.1
pkgrel=2
pkgdesc="SciPy is open-source software for mathematics, science, and engineering."
arch=('x86_64')
url="http://www.scipy.org/"
license=('BSD')
depends=('intel-oneapi-mkl' 'python-numpy' 'python-pooch')
provides=("python-scipy")
conflicts=('python-scipy' 'python-scipy-mkl')
makedepends=('cython' 'gcc-fortran' 'meson-python' 'procps-ng' 'pybind11' 'python-build' 'python-installer' 'python-pythran')
checkdepends=('python-pytest' 'python-hypothesis')
optdepends=('python-pillow: for image saving module')
source=("https://pypi.python.org/packages/source/s/scipy/scipy-$pkgver.tar.gz")
sha256sums=('5a275584e726026a5699459aa72f828a610821006228e841b94275c4a7c08417')

build() {
	source /opt/intel/oneapi/setvars.sh
	cd scipy-${pkgver}

	python -m build --wheel --no-isolation --skip-dependency-check \
		-C setup-args=-Dblas=mkl-dynamic-lp64-tbb \
		-C setup-args=-Dlapack=mkl-dynamic-lp64-tbb
}

check() {
	cd scipy-${pkgver}
	python -m venv --system-site-packages test-env
	test-env/bin/python -m installer dist/*.whl
	cd test-env
	bin/python -c "from scipy import test; test('full')"
}

package() {
	cd scipy-${pkgver}
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

