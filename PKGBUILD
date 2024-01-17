# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=socid-extractor
pkgver=0.0.26
pkgrel=2
pkgdesc="Extract accounts info from personal pages on various sites for OSINT purpose"
arch=(any)
url="https://github.com/soxoj/socid-extractor"
license=(GPL-3.0-only)
depends=(
  python
  python-beautifulsoup4
  python-dateutil
  python-requests
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0440b4bfa76f70d88f3a6ac77207b4c6437da8b490b88717fdf04c559297dde4')

_archive="$pkgname-$pkgver"

prepare() {
  cd "$_archive"

  # Avoid including tests in the wheel
  sed -i "s/find_packages()/find_packages(exclude=['tests', 'tests.*'])/" setup.py
}

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

# Current tests interact with actual websites rather than mock ones, so test
# results are highly unstable. Skipping testing for that reason.
# check() {}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
