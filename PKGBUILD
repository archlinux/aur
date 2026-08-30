# Maintainer: Ashutosh Tiwari <contact@ashutoshtiwari.dev>
pkgname=qwarp
pkgver=0.9.1
pkgrel=1
pkgdesc="A lightweight, Wayland-native Qt6 wrapper for Cloudflare WARP"
arch=('x86_64')
url="https://github.com/iashutoshtiwari/qwarp"
license=('MIT')
depends=('python' 'python-pyqt6' 'cloudflare-warp-bin')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'qt6-tools')

source=("$pkgname-$pkgver-source.tar.gz::https://github.com/iashutoshtiwari/qwarp/releases/download/v$pkgver/$pkgname-$pkgver-source.tar.gz")
sha256sums=('85e1005105b9ef728d106e038d940581195ea1f44162a082e8dc4ae6af110b73')

build() {
  # Enter the directory extracted from the GitHub tarball
  cd "$pkgname-${pkgver/_/-}"

  # Gather PyQt translation files before generating the wheel so they are grabbed by setup.py
  bash scripts/build_locales.sh

  # Build the wheel
  python -m build --wheel --no-isolation
}

package() {
  # Enter the directory extracted from the GitHub tarball
  cd "$pkgname-${pkgver/_/-}"

  local _wheels=(dist/*.whl)

  if [ ! -f "${_wheels[0]}" ]; then
      echo "Error: No wheel found in dist/"
      exit 1
  fi

  # Install the Python package
  python -m installer --destdir="$pkgdir" "${_wheels[0]}"

  # Install the desktop entry
  install -Dm644 qwarp.desktop "$pkgdir/usr/share/applications/qwarp.desktop"

  # Install the SVG icon
  install -Dm644 "src/qwarp/assets/app-icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/qwarp.svg"

  # Install the license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
