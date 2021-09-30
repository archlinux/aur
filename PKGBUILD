# Maintainer: PumpkinCheshire <me at pumpkincheshire dot top>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_name=termplotlib
pkgname=python-${_name}
pkgver=0.3.9
pkgrel=1
pkgdesc="Plotting on the command line"
arch=('any')
url="https://github.com/nschloe/${_name}"
license=('GPL')
depends=('python-numpy' 'gnuplot')
makedepends=('python-setuptools')
checkdepends=('python-pytest-codeblocks')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
b2sums=('651b5951636d4279a2a1f55d478b5c5a2c4a11f373ce36bb1549fadc8290ec1870a249c48e92c393b2108a74de5a93eeb708e9a214fa6858659f6c4258b8aa4b')

build() {
	cd "$_name-$pkgver"
	export PYTHONHASHSEED=0
	python -c "from setuptools import setup; setup()" build
}

check() {
	cd "$_name-$pkgver"
	python -c "from setuptools import setup; setup();" install --root="${PWD}/tmp_install" --optimize=1 --skip-build
	PYTHONPATH="${PWD}/tmp_install$(python -c "import site; print(site.getsitepackages()[0])"):${PYTHONPATH}" python -m pytest --codeblocks -k 'not README and not plot and not nolabel'
}

package() {
	cd "$_name-$pkgver"
	PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -c "from setuptools import setup; setup();" install --prefix=/usr --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
