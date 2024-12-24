pkgname=python-seabreeze
pkgver=2.10.0
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
sha256sums=('343683e32a49c35406373e59fab1fea367e5cdaf2e934a7e1df8c1c09a0b9952')

prepare(){
	cd python-seabreeze-${pkgver}

	#curl --silent https://patch-diff.githubusercontent.com/raw/ap--/python-seabreeze/pull/143.patch | patch -p1

	# version it ourselves because we don't have a .git folder
	echo "[metadata]" > setup.cfg
	echo "version = ${pkgver}" >> setup.cfg
	echo "__version__ = \"${pkgver}\"" > src/seabreeze/_version.py
	sed '/use_scm_version={/,+5 d' -i setup.py

}
  
build(){
	cd python-seabreeze-${pkgver}
	python -m build --wheel --no-isolation
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
