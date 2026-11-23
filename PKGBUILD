# Maintainer: coldbug <coldBug@e.mail.de>

_pkgbase=impacket
pkgname=python-impacket-git
pkgver=0.13.1.r98.g691fc183
pkgrel=1
pkgdesc='Collection of classes for working with network protocols'
url='https://github.com/fortra/impacket'
arch=(any)
license=(Apache-2.0)
depends=(
  python
  python-charset-normalizer
  python-dnspython
  python-flask
  python-ldap3
  python-ldapdomaindump
  python-pcapy
  python-pyasn1
  python-pyasn1-modules
  python-pycryptodomex
  python-pyopenssl
  python-six
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-cryptography
  python-pytest
)
provides=("impacket=${pkgver%%.r*}")
conflicts=(impacket)
source=(
  "git+${url}.git"
)
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgbase}
  # impacket_0_13_1-98-g691fc183 -> 0.13.1.r98.g691fc183
  git describe --long --tags --match 'impacket_*' \
    | sed 's/^impacket_//;s/_/./g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${_pkgbase}
  # The wheel file name carries the commit date and hash, so wheels from
  # earlier builds pile up in dist/ and break "dist/*.whl" in package().
  git clean -dfx
}

build() {
  cd ${_pkgbase}
  python -m build --wheel --no-isolation
}

check() {
  cd ${_pkgbase}
  pytest -m "not remote"
}

package() {
  cd ${_pkgbase}
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -vDm 644 ChangeLog.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  local PYTHONVERSION="$(python -c 'import sys; print("{}.{}".format(sys.version_info.major, sys.version_info.minor))')"
  ln -s "/usr/lib/python${PYTHONVERSION}/site-packages/impacket/examples" "${pkgdir}/usr/share/doc/${pkgname}/examples"
}
