# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-posthog
_name=posthog-python
pkgver=3.5.2
pkgrel=1
pkgdesc="Integrate PostHog into any python application."
arch=('any')
url="https://posthog.com/docs/libraries/python"
license=('MIT')
depends=(
  'python-backoff'
  'python-dateutil'
  'python-monotonic'
  'python-requests'
  'python-six'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-freezegun'
  'python-pytest'
  'python-pytest-timeout'
)
source=("$_name-$pkgver.tar.gz::https://github.com/PostHog/posthog-python/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ee3ec69e01028afcbf56830ffffb6b9f2386bacc8ae7671abf94059bc1de6d52')

prepare() {
  cd "$_name-$pkgver"

  # Drop python-mock checkdepends
  # https://archlinux.org/todo/drop-python-mock-checkdepends/
  sed -i 's/import mock/from unittest import mock/g' posthog/test/test_{client,consumer,feature_flags}.py
}

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
