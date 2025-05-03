# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-landlock
_name=${pkgname#python-}
pkgver=1.0.0.dev5
pkgrel=1
pkgdesc="Python interface to the Landlock Linux Security Module"
arch=('any')
url="https://github.com/Edward-Knight/landlock"
license=('MIT')
depends=('python')
makedepends=(
  'python-build'
  'python-flit-core'
  'python-installer'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
  'python-pytest-forked'
)
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        'drop-coverage.patch')
sha256sums=('8e9f5a689a7fbab1509c55e0a6e8e365af495592e141f09a984f5729a599c5f7'
            '1dc570bcf8aede716b6726521be9e65a279af06e0f4c1e86c119f9bcb0bcc5db')

prepare() {
  cd "$_name-$pkgver"

  # Skip coverage
  patch -Np1 -i ../drop-coverage.patch
}

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  pytest
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
