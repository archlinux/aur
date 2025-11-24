# Maintainer: pierspad
pkgname=textmerger
pkgver=1.3.2
pkgrel=1
pkgdesc="A Python GUI application for merging text files"
arch=('x86_64')
url="https://github.com/pierspad/textmerger"
license=('MIT')

depends=(
  'python'
  'python-pyqt5'
  'python-flask'
  'python-werkzeug'
)

makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'cython' 'gcc')
optdepends=(
    'python-nbformat: for Jupyter Notebook support'
    'python-pypdf2: for PDF support'
)

source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/pierspad/textmerger/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('27b0f1f9cfd84683bc468d41e4a31623328e8e936e1fd223a0633b381f40edad')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  echo "Building wheel package with Cython extensions..."
  /usr/bin/python -m build --wheel >/dev/null 2>&1 || /usr/bin/python -m build --wheel
  echo "✓ Build completed"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  /usr/bin/python -m installer --destdir="$pkgdir" dist/*.whl
  
  # Install desktop file
  install -Dm644 packaging/textmerger.desktop "$pkgdir/usr/share/applications/textmerger.desktop"
  
  # Install icon
  install -Dm644 textmerger/assets/logo/logo.png "$pkgdir/usr/share/pixmaps/textmerger.png"
  
  # Install docs and license
  install -Dm644 docs/README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 docs/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
