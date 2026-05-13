# Maintainer: Evert Vorster <evorster@gmail.com>
pkgname=dos-machines
pkgver=0.2.6
pkgrel=1
pkgdesc="Folder-based DOS machine workspace and launcher editor"
arch=('any')
url="https://github.com/evertvorster/dos-machines"
license=('GPL-3.0-or-later')
depends=('python' 'pyside6' 'dosbox-staging')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e64a4fba543b5c0607e6ab8bcf3ea4e48214d64cf98e32c310343d7f18f9a1a7')

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
