# Maintainer: HabiRabbu <https://github.com/HabiRabbu>
pkgname=bento-desktop
pkgver=0.1.0
pkgrel=1
pkgdesc="Popup control centre for KDE Plasma"
arch=('x86_64')
url="https://github.com/HabiRabbu/bento"
license=('MIT')
depends=(
  'python'
  'python-pyqt6'
  'python-dbus'
  'python-dotenv'
  'python-pyte'
  'kglobalaccel'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
  'cmake'
  'extra-cmake-modules'
  'qt6-base'
  'kglobalaccel'
)
provides=('bento' 'bento-desktop')
conflicts=('bento-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('24c30b6494ba072967d1249666adc3051c1998039827d66f108e704f6f4de6bb')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # Build the Python package
  python -m build --wheel --no-isolation

  # Build the C++ hotkey helper
  cmake -B build-helper -S helpers \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build-helper
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Install the Python package
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Install the C++ hotkey helper
  install -Dm755 build-helper/bento-hotkey-helper \
    "$pkgdir/usr/lib/bento/bento-hotkey-helper"

  # License
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Desktop entry
  install -Dm644 packaging/bento.desktop \
    "$pkgdir/usr/share/applications/bento.desktop"

  # Icons
  install -Dm644 bento_app/assets/icon.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/bento.svg"
  for size in 16 24 32 48 64 128 256 512; do
    install -Dm644 "bento_app/assets/bento-icon-${size}.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/bento.png"
  done
}
