# Maintainer: coldbug <coldBug@e.mail.de>
_pkgbase=impacket
pkgname=python-impacket-git
pkgver=impacket_0_12_0.r1.g65b774de
pkgrel=1
pkgdesc="Collection of classes for working with network protocols"
arch=('any')
conflicts=('impacket')
url="https://github.com/fortra/impacket"
license=(Apache-2.0)
provides=('impacket')
depends=(
  python
  python-flask
  python-ldap3
  python-pcapy
  python-pyasn1
  python-pyasn1-modules
  python-pycryptodome
  python-pycryptodomex
  python-pyopenssl
  python-setuptools  # https://github.com/fortra/impacket/issues/885#issuecomment-1197218746
  python-charset-normalizer
  python-six
  python-future
  python-ldapdomaindump
)
makedepends=(
  python-build
  python-installer
  python-wheel
)
checkdepends=(
  python-cryptography
  python-pytest
)
source=("git+https://github.com/SecureAuthCorp/impacket.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgbase}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgbase}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_pkgbase}"
  pytest -m "not remote"
}

package() {
  cd "${srcdir}/${_pkgbase}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 ChangeLog.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  local PYTHONVERSION="$(python -c 'import sys; print("{}.{}".format(sys.version_info.major, sys.version_info.minor))')"
  ln -s "/usr/lib/python${PYTHONVERSION}/site-packages/impacket/examples" "${pkgdir}/usr/share/doc/${pkgname}/examples"
}
