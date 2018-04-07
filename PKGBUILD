# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Fabian Melters <melters [at] gmail [dot] com>

pkgname=pyrit
_pkgname=Pyrit
pkgver=0.5.0
pkgrel=3
pkgdesc='The famous WPA precomputed cracker'
url='https://github.com/JPaulMora/Pyrit'
arch=('x86_64')
license=('GPL3')
depends=('openssl' 'python2' 'zlib' 'libpcap')
optdepends=(
  'scapy: packet capture analyzation support'
  'python2-sqlalchemy: storage support'
)
checkdepends=('python2-sqlalchemy' 'scapy')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/JPaulMora/Pyrit/archive/v${pkgver}.tar.gz
        scapy-2.3.2.patch)
sha512sums=('912742cd7d9cd9231b9b3aa155a5170c0ba36c3865280423e100c1d12df34e093ee56305d8738d4f406abbfef9b1d540872872b8ef23d699466298d41289ad25'
            '99d4ae2159be2d829337f3481cbb6580da1c6a2d2b6b28c7ed17348daa983859b7cd6ba3ee8575cbcba16efa27bf230bac075599b1fa0b531178dbdc45f853b2')

prepare() {
  cd ${_pkgname}-${pkgver}
  patch -p1 < "${srcdir}/scapy-2.3.2.patch"
}

build() {
  cd ${_pkgname}-${pkgver}
  python2 setup.py build
}

check() {
  cd ${_pkgname}-${pkgver}/test
  local PYTHONVERSION="$(python2 -c 'import sys; print("{}.{}".format(sys.version_info.major, sys.version_info.minor))')"
  PYTHONPATH="../build/lib.linux-${CARCH}-${PYTHONVERSION}" \
    python2 test_pyrit.py
}

package() {
  cd ${_pkgname}-${pkgver}
  python2 setup.py install -O1 --root="${pkgdir}" --skip-build
  install -Dm 644 README.md CHANGELOG -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
