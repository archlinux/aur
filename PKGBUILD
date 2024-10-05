# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-landlock
_name=${pkgname#python-}
pkgver=1.0.0.dev4
pkgrel=2
pkgdesc="Python interface to the Landlock Linux Security Module"
arch=('any')
url="https://github.com/Edward-Knight/landlock"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-flit-core' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-forked')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        'drop-coverage.patch')
sha256sums=('4ad39bafdd94a6210719e030f349076155148e5406a0dd7ef326728697752547'
            '39feee551d4803730a59dbb5a0312f1476a43ea6c49f82f57425d78a6568b264')

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
