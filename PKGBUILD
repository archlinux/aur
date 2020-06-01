# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: pino <pinoverclock@gmail.com>
# Contributor: William Díaz <wdiaz [at] archlinux [dot] us>

pkgname=cpyrit-cuda
_pkgname=Pyrit
pkgver=0.5.0
pkgrel=3
pkgdesc="The famous WPA precomputed cracker for NVIDIA-CUDA."
url='https://github.com/JPaulMora/Pyrit'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('openssl' 'python2' 'zlib' 'libpcap' 'nvidia')
makedepends=('gcc' 'python2' 'cuda')
optdepends=(
  'scapy: packet capture analyzation support'
  'python2-sqlalchemy: storage support'
)
checkdepends=('python2-sqlalchemy' 'scapy')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/JPaulMora/Pyrit/archive/v${pkgver}.tar.gz"
        "scapy-2.3.2.patch"
	"fix-broken-join.patch")
sha256sums=('c610b7e5930e71ef466365418e58ce72f4b7dea5a3398c3296192f0c4a7175aa'
            '41cd140e25862a5474d520a781cb49ee9152e4ce5a163119902de8d2daac0c7e'
            '22ca97c7a9223c2beb20a25b925c44261bef9b1dcb51d647824a2f1a5c765a88')

prepare() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  # cpyrit CUDA module mod
  sed -i 's/ -ccbin clang / /' ${srcdir}/${_pkgname}-${pkgver}/modules/cpyrit_cuda/setup.py
  patch -p1 < "${srcdir}/scapy-2.3.2.patch"
  patch -p1 < "${srcdir}/fix-broken-join.patch"
  # Fix file cpyrit.py
  sed -i 's/CUDA =  cpyrit_cuda.listDevices()/CUDA = _cpyrit_cuda.listDevices()/;s/CUDA -= 1/#CUDA -= 1/' ${srcdir}/Pyrit-${pkgver}/cpyrit/cpyrit.py
}


build() {
  # cpyrit CUDA module compile
  cd ${srcdir}/${_pkgname}-${pkgver}/modules/cpyrit_cuda
  python2 setup.py clean build

  # Pyrit compile
  cd ${srcdir}/${_pkgname}-${pkgver}
  python2 setup.py clean build
}

check() {
  cd ${_pkgname}-${pkgver}/test
  local PYTHONVERSION="$(python2 -c 'import sys; print("{}.{}".format(sys.version_info.major, sys.version_info.minor))')"
  PYTHONPATH="../build/lib.linux-${CARCH}-${PYTHONVERSION}" \
    python2 test_pyrit.py
}

package() {
  cd ${srcdir}/Pyrit-${pkgver}/modules/cpyrit_cuda
  python2 setup.py install -O1 --root="${pkgdir}" --skip-build
  cd ${srcdir}/Pyrit-${pkgver}
  python2 setup.py install -O1 --root="${pkgdir}" --skip-build
  install -Dm 644 README.md CHANGELOG -t "${pkgdir}/usr/share/doc/${pkgname}"
}
