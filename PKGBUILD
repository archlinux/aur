# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='python-metno-locationforecast'
_pkgname="${pkgname#python-}"
pkgver=1.1.0
pkgrel=4
pkgdesc='Python interface for the MET Norway Locationforecast/2.0 weather service'
arch=('any')
license=('MIT')  # SPDX-License-Identifier: MIT
url='https://github.com/Rory-Sullivan/metno-locationforecast'
source=(
  "$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz"
  'setup-py.diff'
)
depends=(
  'python'
  'python-requests'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
)
sha256sums=(
  'b24fb745fcb307e74e885b632ffdbc8a53a5401d2a8f094a66f02ce1b78bbbf7'
  'd8c2128c2deb3dc5ac2b0d27817269f2b830466b3b6553b96bea2d1c7c4fd14a'
)
b2sums=(
  'ab91bab97ac500ed9e11f2ba30e9636c37aa70e77c5336e2a8b2ec60b9d3c7b963a54f11d1817b3c7c54334229aac33743b015f714b38b977bf7a09c9b9f9172'
  '09f0f08eb3bfb6a1be64e65cb4ec1d1d8714ef3c73faa181b5652090aee7ab33ce166a41a14b959bf0a2fc69cc11e75b35fcf3295ea3c6486f5de66e64145d75'
)

prepare() {
  cd "$_pkgname-$pkgver" || exit 1

  patch -Np1 -i "$srcdir/setup-py.diff"
}

build() {
  cd "$srcdir/$_pkgname-$pkgver" || exit 1

  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgname-$pkgver" || exit 1

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  for mdfile in CHANGELOG.md README.md; do
    install -Dm0644 "$mdfile" "$pkgdir/usr/share/doc/$pkgname/$mdfile"
  done
}

# eof
