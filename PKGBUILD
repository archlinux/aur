# $Id$
# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=python-seabreeze
pkgver=1.3.0
pkgrel=2
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
)
checkdepends=(
python-pytest
python-pytest-mock
python-pytest-runner
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ap--/python-seabreeze/archive/v${pkgver}.tar.gz" "10-oceanoptics.rules")
sha256sums=('6418dda3278274d006a9d2a86fda82c4160ade6c9b42fd66e419d56fd17810e3'
            '2c62b399a3b3fa61a4c39c32c4242f1b1eaad9ba2a5810f5020d44959b5f9c8a')

prepare(){
  cd python-seabreeze-${pkgver}

  curl --silent https://patch-diff.githubusercontent.com/raw/ap--/python-seabreeze/pull/143.patch | patch -p1

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
  install -Dt "${pkgdir}/etc/udev/rules.d" -m644 "${srcdir}"/10-oceanoptics.rules
  msg2 "You might want to run: sudo udevadm control --reload-rules"
}

