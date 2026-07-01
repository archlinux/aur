# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=maigret
pkgver=0.6.2
pkgrel=1
pkgdesc="Collect a dossier on a person by username from thousands of sites"
arch=(any)
url="https://github.com/soxoj/maigret"
license=(MIT)
depends=(
  python
  python-aiodns
  python-aiohttp
  python-aiohttp-socks
  python-alive-progress
  python-asgiref
  python-cloudscraper
  python-colorama
  python-curl_cffi
  python-dateutil
  python-flask
  python-jinja
  python-mock
  python-networkx
  python-pycountry
  python-python-socks
  python-pyvis
  python-requests
  python-werkzeug
  python-xhtml2pdf
  python-xmind
  'socid-extractor>=0.1.0'
)
makedepends=(
  python-build
  python-installer
  python-poetry-core
  python-wheel
)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('d731f2aa9be8bc83fa2743ae7e39469cd2bfe9cbfd5f7bcbceaa3c00ebe54736')

_archive="$pkgname-$pkgver"

latestver() {
  curl -fsSL "https://pypi.org/pypi/$pkgname/json" | jq -r '.info.version'
}

prepare() {
  cd "$_archive"

  sed -i '/^update_sitesmd = /d' pyproject.toml
  sed -i 's/socid-extractor = ">=0.0.27,<0.0.29"/socid-extractor = ">=0.1.0,<0.2.0"/' pyproject.toml
}

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
