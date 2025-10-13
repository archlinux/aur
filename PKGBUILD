pkgname=python-seabreeze
pkgver=2.10.1
pkgrel=1
pkgdesc="Python module for oceanoptics spectrometers"
arch=(x86_64)
url="https://github.com/ap--/python-seabreeze"
license=(MIT)
depends=(
python-pyusb
python-numpy
libusb-compat
)
makedepends=(
python-setuptools
python-setuptools-scm
cython
python-build
python-installer
python-wheel
python-pkgconfig
)
checkdepends=(
python-pytest
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ap--/python-seabreeze/archive/v${pkgver}.tar.gz")
sha256sums=('03090092177dcd90471a19836172d8bbd14e0f6df50dfad6eec34e8f7eb5753f')

prepare(){
	cd python-seabreeze-${pkgver}

}
  
build(){
	cd python-seabreeze-${pkgver}
	SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}" python -m build --wheel --no-isolation
}

check() {
	cd python-seabreeze-${pkgver}
	cd src
	python -m pytest ../tests
}

package() {
	cd python-seabreeze-${pkgver}
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dt "${pkgdir}/etc/udev/rules.d" -m644 os_support/10-oceanoptics.rules
	msg2 "You might want to run: sudo udevadm control --reload-rules"
}
