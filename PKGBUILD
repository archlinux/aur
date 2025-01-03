# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-posthog
_name=posthog-python
pkgver=3.7.5
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
sha256sums=('2a88d2837c36aa327e198d0c0cc7042e6a74f207a0862bd0abeddf4ddc585f14')

prepare() {
  cd "$_name-$pkgver"

  # Drop python-mock checkdepends
  # https://archlinux.org/todo/drop-python-mock-checkdepends/
  sed -i 's/import mock/from unittest import mock/g' \
    posthog/test/test_{client,consumer,feature_flags}.py
}

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"

  # Disable tests requiring network access
  PYTHONPATH=. pytest -k 'not test_request'
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
