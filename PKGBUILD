# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='python-metno-locationforecast'
_pkgname="${pkgname#python-}"
epoch=1
pkgver=2.1.0
pkgrel=2
pkgdesc="Python interface for MET Norway's Locationforecast/2.0 weather service"
arch=('any')
license=('MIT')  # SPDX-License-Identifier: MIT
url='https://github.com/Rory-Sullivan/metno-locationforecast'
source=(
  "$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz"
  'pyproject.diff'
)
depends=(
  'python>=3.9'
  'python-requests>=2.25.1'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools>=75.2'
  'python-wheel'
)
changelog="$pkgname.changelog"

prepare() {
  cd "$_pkgname-$pkgver"

  # See https://github.com/Rory-Sullivan/metno-locationforecast/issues/10
  patch -p1 < ../pyproject.diff
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    {CHANGELOG,README}.md
  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    LICENSE
}

sha256sums=(
  '6046af64526af65a5f92ff1ac251d498762346091d323c4c84a1508a165533ab'
  'ea05bdee67fa8f8eb2bb2e361c6b461eea5cfabbe5855dc6de533b095878ee07'
)
b2sums=(
  '65374be3a52a31d9eb91230864f070ce6b59da661d9c21258bb1a999ff536dc054ba4b2201836cfc28483728d321cc268f983978bcf62e5d158260d13e58d888'
  '75cbc5655b7d19c87bddf2b42d8fec593273d84cbfa67e7b34ed7f7547e445dba85bb7eaff015d75c3aaace00c3bfa83822fda7683b93c54739950bfc76e3405'
)

# eof
