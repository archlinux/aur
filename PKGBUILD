# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-posthog
_name=posthog-python
pkgver=3.3.3
pkgrel=1
pkgdesc="Integrate PostHog into any python application."
arch=('any')
url="https://posthog.com/docs/libraries/python"
license=('MIT')
depends=('python-backoff' 'python-dateutil' 'python-monotonic' 'python-requests' 'python-six')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-freezegun' 'python-mock' 'python-pytest' 'python-pytest-timeout')
source=("$_name-$pkgver.tar.gz::https://github.com/PostHog/posthog-python/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('de2076de02e5588e39c0bd611b012c8cae151c90f5c73e2aaa372cf865206e08')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"

  # Disable tests requiring network access
  pytest -k 'not test_request'
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
