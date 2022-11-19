# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python38-requests
pkgver=2.28.1
pkgrel=1
pkgdesc="Python 3.8 HTTP for Humans"
arch=('any')
url="http://python-requests.org"
license=('Apache')
depends=('python-urllib3' 'python38-chardet' 'python38-idna')
makedepends=('python38-setuptools' 'python38-chardet' 'python38-urllib3' 'python-idna')
checkdepends=('python38-pytest-httpbin' 'python38-pytest-mock' 'python38-pysocks' 'python38-trustme')
optdepends=('python38-pysocks: SOCKS proxy support')
source=("https://github.com/psf/requests/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
        certs.patch)
sha512sums=('caed2d08340c79af9448eefaa1df796f9112a7c8da30b218d5f342326a9629d95928c0978b9600e4bd7f56a297ef41afb088af390738be431b91b8c7429e741b'
            '424a3bb01b23409284f6c9cd2bc22d92df31b85cfd96e1d1b16b5d68adeca670dfed4fff7977d8b10980102b0f780eacc465431021fcd661f3a17168a02a39a3')

prepare() {
  cd requests-$pkgver
  # Stay with chardet for now: https://github.com/psf/requests/issues/5871
  sed -e '/certifi/d' \
      -e "s/,<.*'/'/" \
      -e '/charset_normalizer/d' \
      -i setup.py
  patch -p1 -i "$srcdir"/certs.patch
}

build() {
  cd requests-$pkgver
  python3.8 setup.py build
}

check() {
  # Seems to be a problem about pytest-httpbin:
  # pytest-httpbin server hit an exception serving request: [SSL: HTTP_REQUEST] http request (_ssl.c:1129)
  # pytest-httpbin server hit an exception serving request: [SSL: TLSV1_ALERT_UNKNOWN_CA] tlsv1 alert unknown ca (_ssl.c:1129)

  cd requests-$pkgver
  pytest tests --deselect tests/test_requests.py::TestRequests::test_pyopenssl_redirect
}

package() {
  cd requests-$pkgver
  python3.8 setup.py install --skip-build -O1 --root="$pkgdir"
}
