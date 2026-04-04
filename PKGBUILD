# Maintainer: Evert Vorster <evorster@gmail.com>
pkgname=dos-machines
pkgver=0.1.1
pkgrel=1
pkgdesc="Folder-based DOS machine workspace and launcher editor"
arch=('any')
url="https://github.com/evertvorster/dos-machines"
license=('GPL-3.0-or-later')
depends=('python' 'pyside6' 'dosbox-staging')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2378151c1b7084580fa533ebb0d0e0e97c5bcaabcba5575543e5bb4319cbb447')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  PYTHONPATH=src QT_QPA_PLATFORM=offscreen pytest -q
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 share/applications/dos-machines.desktop \
    "$pkgdir/usr/share/applications/dos-machines.desktop"
  install -Dm644 src/dos_machines/assets/dos-machines.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/dos-machines.svg"
  install -Dm644 examples/dosbox-staging.conf \
    "$pkgdir/usr/share/dos-machines/dosbox-staging.conf"
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
