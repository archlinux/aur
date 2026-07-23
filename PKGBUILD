# Maintainer: eslachance <eslachance@users.noreply.github.com>
pkgname=winmiddle-git
pkgver=0.1.0.r0.ga06fe9d
pkgrel=1
pkgdesc="Windows-faithful middle-click autoscroll for Linux (Plasma/Wayland) — git"
arch=('any')
url="https://github.com/eslachance/winscroll"
license=('MIT')
depends=(
  'python'
  'python-evdev'
  'python-pyqt6'
  'layer-shell-qt'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-hatchling'
)
optdepends=(
  'kwin: focus/cursor helper script (recommended on Plasma)'
  'python-gobject: AT-SPI scrollable-under-cursor probing'
  'at-spi2-core: accessibility bus for scroll probing'
)
provides=('winmiddle')
conflicts=('winmiddle')
install=winmiddle.install
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/winscroll"
  git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
    || printf "0.1.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/winscroll"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/winscroll"
  python -m installer --destdir="$pkgdir" --prefix=/usr dist/*.whl
  bash packaging/install-data.sh "$pkgdir"
}
