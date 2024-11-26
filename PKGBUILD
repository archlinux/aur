# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='python-metno-locationforecast'
_pkgname="${pkgname#python-}"
epoch=1
pkgver=2.0.0
pkgrel=1
pkgdesc='Python interface for the MET Norway Locationforecast/2.0 weather service'
arch=('any')
license=('MIT')  # SPDX-License-Identifier: MIT
url='https://github.com/Rory-Sullivan/metno-locationforecast'
source=(
  "$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz"
)
depends=(
  'python>=3.9'
  'python-requests>=2.25.1'
  'python-tzdata>=2020.5'
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
  sed -i 's/"setuptools>=75.6"/"setuptools>=75.2"/g' pyproject.toml
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
  '4ec5b8284bf1dca04c040a79823abff84101dcff68fb6fe418c18757329314a9'
)
b2sums=(
  '04429571d96dc4ecd6f11c5f8c0d47ee6ff035701415f203043505788937accd8c6e07b5937f7a95c6b53d6fdb1cca54e0647b3dd01bc5863f59a9b2780ec989'
)

# eof
