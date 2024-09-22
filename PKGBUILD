pkgname=python-seabreeze
pkgver=2.9.2
pkgrel=1
pkgdesc="Python module for oceanoptics spectrometers"
arch=(x86_64)
url="https://github.com/ap--/python-seabreeze"
license=(MIT)
depends=(
python-pyusb
python-numpy
)
makedepends=(
python-setuptools
libusb-compat
cython
)
checkdepends=(
python-pytest
python-pytest-mock
python-pytest-runner
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ap--/python-seabreeze/archive/v${pkgver}.tar.gz")
sha256sums=('772833dadb0443c7db79f550c6c0ab0476bd7f9eba66d42640a950055e546968')

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
  python setup.py build
}

check() {
  cd python-seabreeze-${pkgver}
  python setup.py test
  #pytest -v tests/
}

package() {
  cd python-seabreeze-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dt "${pkgdir}/etc/udev/rules.d" -m644 os_support/10-oceanoptics.rules
  msg2 "You might want to run: sudo udevadm control --reload-rules"
}

