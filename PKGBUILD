# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=socid-extractor
pkgver=0.0.24
pkgrel=1
pkgdesc="Extract accounts info from personal pages on various sites for OSINT purpose"
arch=(any)
url="https://github.com/soxoj/socid-extractor"
license=(GPL3)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
depends=(
  python
  python-beautifulsoup4
  python-dateutil
  python-requests
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('02018e09bfc48d534cba061546b7330d0c7de995659b9c0f344aaea449d6b070')

_archive="$pkgname-$pkgver"

prepare() {
  cd "$_archive"

  # Don't lock dependency versions.
  sed -i 's/>=.*//' requirements.txt
  sed -i 's/~=.*//' requirements.txt
  sed -i 's/==.*//' requirements.txt
}

build() {
  cd "$_archive"

  # Avoid including tests in the wheel
  rm -r tests/

  python -m build --wheel --no-isolation
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
