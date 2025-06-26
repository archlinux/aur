# Maintainer: Costin Botescu <costin.botescu@gmail.com>
pkgname=python-dicopp
_name=`echo ${pkgname} | grep -Po "(?<=-).*"`
pkgver=1.0.45
pkgrel=0
pkgdesc="Direct Connect ++ client"
arch=('any')
url="https://github.com/colin-i/dico"
license=('0BSD')
depends=(gtk4 python-appdirs python-psutil python-gobject python-requests eiskaltdcpp-daemon)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('2f1de9364c9051dc2f66352bde11fe250328cd0a763150b0c7261975e6d42bb9')

prepare() {
	_patches="`cat ../list`"
	cd ${_name}-${pkgver}
	for _var in ${_patches[@]}; do
		echo ${_var}
		patch --strip=1 --input=../../${_var}
	done
}

build() {
	cd ${_name}-${pkgver}
	python -m build --wheel --no-isolation # --skip-dependency-check
}

package() {
	cd ${_name}-${pkgver}
	python -m installer --destdir="$pkgdir" dist/*.whl
}
