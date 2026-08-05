# Maintainer: Basem Aljedai <baljedai@gmail.com>
pkgname=omarchy-cast
pkgver=0.1.3
pkgrel=1
pkgdesc="Desktop mirroring for Omarchy/Hyprland to AirPlay receivers (experimental Google Cast support)"
arch=('any')
url="https://github.com/mrCode/omarchy-cast"
license=('MIT')
depends=(
  'python'
  'python-pychromecast'
  'python-zeroconf'
  'python-gobject'
  'python-textual'
  'gst-python'
  'gstreamer'
  'gst-plugins-base'
  'gst-plugins-good'
  'gst-plugins-bad'
  'gst-plugin-pipewire'
  'gst-plugin-va'
  'xdg-desktop-portal'
  'pipewire'
)
optdepends=(
  'doubletake-git: AirPlay mirroring support (the 0.4.0 release cannot capture on Hyprland)'
  'walker: device picker menu'
  'waybar: status indicator'
  'libnotify: desktop notifications on failure'
  'gst-plugins-ugly: software x264 encoding fallback'
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e91cfa98b11ce96de64b5033d7058a87f7a3d5ede1d6f2824979de04037b5e6d')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname-$pkgver"
  PYTHONPATH="$PWD" python -m pytest -q
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 docs/device-matrix.md "$pkgdir/usr/share/doc/$pkgname/device-matrix.md"

  install -Dm644 share/waybar/cast-indicator.jsonc \
    "$pkgdir/usr/share/$pkgname/waybar/cast-indicator.jsonc"
  install -Dm644 share/waybar/cast-indicator.css \
    "$pkgdir/usr/share/$pkgname/waybar/cast-indicator.css"
}
