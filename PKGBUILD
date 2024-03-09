# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=maigret
pkgver=0.4.4
pkgrel=5
pkgdesc="Collect a dossier on a person by username from thousands of sites"
arch=(any)
url="https://github.com/soxoj/maigret"
license=(MIT)
depends=(
  python
  python-aiodns
  python-aiohttp
  python-aiohttp-socks
  python-cloudscraper
  python-colorama
  python-dateutil
  python-jinja
  python-mock
  python-networkx
  python-pycountry
  python-python-socks
  python-pyvis
  python-requests
  python-tqdm
  python-xhtml2pdf
  python-xmind
  socid-extractor
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest
  python-pytest-httpserver
  python-reportlab
)
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
  "dont-install-tests-etc.patch"
  "fix-pytest-crash.patch"
)
sha256sums=(
  'f890ad0986f94b1674324a17c011ec6a955e62fd87feb578707589371f08847f'
  '00ce7e030d3733bc55661e11de5399604a17d9540576100e6ea2d059a88642cd'
  'f68c7d967aa2b1294bc7376eac39c4975a7cdf5464cbada1820acc48e325a941'
)

_archive="$pkgname-$pkgver"

prepare() {
  cd "$_archive"

  patch --forward --strip=1 --input="$srcdir/dont-install-tests-etc.patch"
  patch --forward --strip=1 --input="$srcdir/fix-pytest-crash.patch"
}

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  # Deselected tests fail due to DeprecationWarning or AssertionError
  pytest \
    --deselect tests/test_activation.py::test_import_aiohttp_cookies \
    --deselect tests/test_report.py::test_html_report \
    --deselect tests/test_report.py::test_html_report_broken \
    --deselect tests/test_report.py::test_text_report \
    --deselect tests/test_report.py::test_text_report_broken
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
