# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=python-pyhanko
_name=pyHanko
pkgver=0.17.2
pkgrel=3
pkgdesc="Tools for stamping and signing PDF files"
url="https://github.com/MatthiasValvekens/pyHanko"
license=(MIT)
arch=(any)
makedepends=(python-setuptools)
checkdepends=(
  certomancer
  python-barcode
  python-defusedxml
  python-fonttools
  python-freezegun
  python-pytest
  python-pytest-aiohttp
  python-requests-mock
  python-uharfbuzz
)
depends=(
  python-aiohttp
  python-click
  python-dateutil
  python-pillow
  python-pyhanko-certvalidator
  python-python-pkcs11
  python-pytz
  python-pyyaml
  python-qrcode
  python-tzlocal
)
optdepends=(
  'python-uharfbuzz: to use OpenType fonts'
  'python-fonttools: to use OpenType fonts'
  'python-defusedxml: to use XMP'
  'python-barcode: for image support'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('c1733e3375dc425e585d76f0db7f101d64b944474a4e71b16f5692e2e19b4cc0')

_archive="$_name-$pkgver"

build() {
  cd "$_archive"

  python setup.py build
}

check() {
  cd "$_archive"

  python -m pytest \
    --ignore pyhanko_tests/test_csc.py \
    -k "\
      not test_ts_fetch_aiohttp \
      and not test_ac_attr_validation_holder_mismatch \
    "
}

package() {
  cd "$_archive"

  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
