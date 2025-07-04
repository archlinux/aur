# Maintainer: 9M2PJU <9m2pju@hamradio.my>

pkgname=not1mm-9m2pju-git
pkgver=r2188.05119a4
pkgrel=1
pkgdesc="Ham Radio Contest Logger - Blatant ripoff of N1MM - Git version with user patch"
arch=(any)
url="https://github.com/mbridak/not1mm"
license=('GPL3')
depends=(
  'python' 'python-pyqt5' 'python-pyqt6' 'python-requests' 'python-dicttoxml'
  'python-xmltodict' 'python-psutil' 'python-sounddevice' 'python-soundfile'
  'python-numpy' 'python-notctyparser' 'python-pyserial' 'python-appdata'
  'python-gobject' 'python-thefuzz' 'python-levenshtein' 'gtk4' 'hamradio-menus'
)
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
optdepends=('hamlib' 'flrig')
provides=('not1mm')
conflicts=('not1mm')
source=("$pkgname::git+https://github.com/mbridak/not1mm.git")
install="${pkgname}.install"
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"

  echo ">>>>> Patching hardcoded data paths to ~/.local/share/not1mm"

  # Create base path string
  patchpath="Path.home() / '.local/share/not1mm'"

  # Patch all known paths that write to system dirs
  sed -i "s|APP_DATA_PATH / \"cty.json\"|$patchpath / 'cty.json'|g" not1mm/__main__.py
  sed -i "s|data_dir / \"MASTER.SCP\"|$patchpath / 'MASTER.SCP'|g" not1mm/lib/super_check_partial.py

  # Optional: patch fallback data dir
  sed -i "s|Path(__file__).parent / \"data\"|$patchpath|g" not1mm/__main__.py
}

build() {
  cd "$srcdir/$pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Desktop icon
  install -Dm755 "not1mm/data/k6gte-not1mm.desktop" "$pkgdir/usr/share/applications/k6gte-not1mm.desktop"
  install -Dm644 "not1mm/data/k6gte.not1mm-128.png" "$pkgdir/usr/share/pixmaps/k6gte-not1mm.png"
}
