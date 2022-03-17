# Maintainer: juergen@archlinux.org
# Drop in replacement for python-stem: https://github.com/onionshare/onionshare/issues/1465

pkgname=python-cepa
_pypiname=${pkgname#*-}
pkgver=1.8.3
pkgrel=3
pkgdesc='Python controller library for Tor'
url='https://pypi.org/project/cepa/'
arch=('any')
license=('LGPL3')
depends=('python' 'python-cryptography' 'python-pynacl' 'procps-ng')
checkdepends=('tor' 'python-mock')
optdepends=('tor: tor-server to talk to')
conflicts=('python-stem')
provides=('stem')
source=(https://files.pythonhosted.org/packages/6f/84/0379c1160237dccb38876a2439e0e56147276273d3e9e9305b3c0dc14b01/cepa-${pkgver}.tar.gz)
sha256sums=('1dc6f0b324d37a2ed2ca274648ece8fd2c96a1d2f440f58c0ca17afd4b5ede7a')

prepare() {
  cd ${_pypiname}-${pkgver}
  # https://github.com/torproject/stem/issues/56
  sed -i '/MOCK_VERSION/d' run_tests.py
  # remove flaky integration tests
  sed -i test/settings.cfg \
    -e '/|test.integ.client.connection.TestConnection/d' \
    -e '/|test.integ.process.TestProcess/d' \
    -e '/|test.integ.installation.TestInstallation/d'
  rm test/integ/{client/connection,{installation,process}}.py
}

build() {
  cd ${_pypiname}-${pkgver}
  python setup.py build
}

check() {
  cd ${_pypiname}-${pkgver}
  ./run_tests.py --all
}

package() {
  cd ${_pypiname}-${pkgver}
  python setup.py install --optimize=1 --root="${pkgdir}" --skip-build
}

# vim: ts=2 sw=2 et:
