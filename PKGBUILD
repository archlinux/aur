# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
_name=pyhanko-certvalidator
pkgname='python-pyhanko-certvalidator'
pkgver=0.19.5
pkgrel=3
pkgdesc="Validates X.509 certificates and paths"
url="https://github.com/MatthiasValvekens/certvalidator"
license=('MIT')
arch=('any')
depends=('python-requests' 'python-asn1crypto' 'python-oscrypto' 'python-cryptography'
         'python-uritools')
makedepends=('python-setuptools')
checkdepends=('python-oscrypto-tests' 'python-aiohttp')
source=("${_name}-${pkgver}.tar.gz::https://github.com/MatthiasValvekens/certvalidator/archive/refs/tags/$pkgver.tar.gz"
        "revocation-test.patch"
        "digicert-ecc-p384-root-g5-revoked-chain-demos-digicert-com.crt")
sha256sums=('2b3eabe4383340f8939eb559e7accfcf68e79a609bbd05ece3a7e959af1fcf4e'
            '73f997673be82a9d75f9a127e5303a05cf539e0955f7730e5a1f73596701da8c'
            '16ce93e1e0126da8be9b77e70446ed5e3faa8b7c3ebc514b512919633b2b5ca6')

prepare() {
  cd certvalidator-${pkgver}
  # https://github.com/MatthiasValvekens/certvalidator/commit/54e09a087bc6a46c67205f2596d5a3cb7d4e61c8
  mv ../digicert-ecc-p384-root-g5-revoked-chain-demos-digicert-com.crt tests/fixtures
  patch -Np1 -i ../revocation-test.patch
}

build() {
  cd certvalidator-${pkgver}
  python setup.py build
}

check() {
  cd certvalidator-${pkgver}
  python run.py tests
}

package() {
  cd certvalidator-${pkgver}
  python setup.py install --skip-build --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
