# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=maigret
pkgver=0.4.4
pkgrel=2
pkgdesc="Collect a dossier on a person by username from thousands of sites"
arch=(any)
url="https://github.com/soxoj/maigret"
license=(MIT)
depends=(
  python-aiodns
  python-aiohttp
  python-aiohttp-socks
  python-cloudscraper
  python-colorama
  python-jinja
  python-mock
  python-networkx
  python-pycountry
  python-pyvis
  python-requests
  python-tqdm
  python-xhtml2pdf
  python-xmind
  socid-extractor
)
makedepends=(python-setuptools)
checkdepends=(
  python-pytest
  python-pytest-asyncio
  python-pytest-cov
  python-pytest-httpserver
  python-pytest-rerunfailures
  python-reportlab
)

source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz"
  "fix-pytest-crash.patch"
)
sha256sums=(
  'f890ad0986f94b1674324a17c011ec6a955e62fd87feb578707589371f08847f'
  'f68c7d967aa2b1294bc7376eac39c4975a7cdf5464cbada1820acc48e325a941'
)

_archive="$pkgname-$pkgver"

prepare() {
  cd "$_archive"

  patch --forward --strip=1 --input="$srcdir/fix-pytest-crash.patch"
}

build() {
  cd "$_archive"

  python setup.py build
  rm -r build/lib/tests/ build/lib/utils/
}

check() {
  cd "$_archive"

  python -m pytest \
    --ignore tests/test_activation.py \
    --ignore tests/test_report.py
}

package() {
  cd "$_archive"

  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
