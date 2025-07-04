# Maintainer: 9M2PJU <9m2pju@hamradio.my>

pkgname=not1mm-9m2pju-git
pkgver=r2188.05119a4
pkgrel=1
pkgdesc="Ham Radio Contest Logger (Not1MM != N1MM) - latest git version with user patch"
arch=('any')
url="https://github.com/mbridak/not1mm"
license=('GPL3')
provides=('not1mm')
conflicts=('not1mm')
depends=(
  python python-pyqt5 python-pyqt6 python-requests python-dicttoxml python-xmltodict python-psutil
  python-sounddevice python-soundfile python-numpy python-notctyparser python-pyserial python-appdata
  python-gobject python-thefuzz python-levenshtein gtk4 hamradio-menus
)
makedepends=(git python-build python-installer python-wheel)
optdepends=('hamlib' 'flrig')
install="$pkgname.install"
source=("$pkgname::git+https://github.com/mbridak/not1mm.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"

  echo ">>> Cleaning source tree"
  git clean -dfx

  echo ">>> Patching to redirect data writes to user path"
  sed -i 's|APP_DATA_PATH =.*|APP_DATA_PATH = Path.home() / ".local/share/not1mm"|' not1mm/fsutils.py
}

build() {
  cd "$srcdir/$pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Desktop entry
  install -Dm644 "not1mm/data/k6gte-not1mm.desktop" "$pkgdir/usr/share/applications/k6gte-not1mm.desktop"
  install -Dm644 "not1mm/data/k6gte.not1mm-128.png" "$pkgdir/usr/share/pixmaps/k6gte-not1mm.png"
}
