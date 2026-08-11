# Maintainer: Basem Aljedai <baljedai@gmail.com>
pkgname=omarchy-cast
pkgver=0.2.9
pkgrel=1
pkgdesc="Mirror or extend your Omarchy/Hyprland desktop to an AirPlay receiver (Apple TV)"
arch=('any')
url="https://github.com/mrCode/omarchy-cast"
license=('MIT')
depends=(
  'python'
  'avahi'
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
  'doubletake-git: AirPlay mirroring and extend support (the 0.4.0 release cannot capture on Hyprland)'
  'walker: device picker menu'
  'waybar: status indicator'
  'libnotify: desktop notifications on failure'
  'gst-plugins-ugly: software x264 encoding fallback'
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-pychromecast')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6b777d569983412424953ed195411b9f72446a902aae8af6862e915658512d56')

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
