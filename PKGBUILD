# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='python-metno-locationforecast'
_pkgname="${pkgname#python-}"
epoch=1
pkgver=2.0.0
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
  '4ec5b8284bf1dca04c040a79823abff84101dcff68fb6fe418c18757329314a9'
  'a4945a9dc6883e3ec08ef06f62768b2c75f6d1b16d31cd4c15a9bf44a8a42922'
)
b2sums=(
  '04429571d96dc4ecd6f11c5f8c0d47ee6ff035701415f203043505788937accd8c6e07b5937f7a95c6b53d6fdb1cca54e0647b3dd01bc5863f59a9b2780ec989'
  '6a78ac2d939952a72e374c7bdc8bce05ba6229892710aa25699c1dc57d2df1000857ef6b361088249bd634d93ef126b82f77e305ac91d9cc930944a5c4fcc708'
)

# eof
