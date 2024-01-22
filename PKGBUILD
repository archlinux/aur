# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-posthog
_name=posthog-python
pkgver=3.3.2
pkgrel=1
pkgdesc="Integrate PostHog into any python application."
arch=('any')
url="https://posthog.com/docs/libraries/python"
license=('MIT')
depends=('python-backoff' 'python-dateutil' 'python-monotonic' 'python-requests' 'python-six')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-freezegun' 'python-mock' 'python-pytest' 'python-pytest-timeout')
source=("$_name-$pkgver.tar.gz::https://github.com/PostHog/posthog-python/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('57fa0a6e0f5f29d3ac290680773958fc5fb09cb1c2ac7ee289d571c41660afbe')

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
