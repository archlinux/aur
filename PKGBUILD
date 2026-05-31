pkgname=bearhub-git
pkgver=0.10.7.r0.g0000000
pkgrel=3
pkgdesc="Arch-first package manager hub (development snapshot, fork of bauh)"
arch=('any')
url="https://github.com/spalencsar/bearhub"
license=('ZLIB')
depends=(
  'python'
  'python-pyqt5'
  'python-requests'
  'python-colorama'
  'python-pyyaml'
  'python-dateutil'
)
optdepends=(
  'python-lxml: web application support'
  'python-beautifulsoup4: web application support'
  'flatpak: flatpak support'
  'appimagekit: appimage support'
)
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
provides=('bearhub' 'bauh')
conflicts=('bearhub' 'bauh' 'bauh-git')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/bearhub"
  local ver
  ver="$(sed -n "s/^__version__ = '\(.*\)'/\1/p" bauh/__init__.py)"
  printf "%s.r%s.g%s" "$ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/bearhub"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/bearhub"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 "bearhub/desktop/bearhub.desktop" \
    "$pkgdir/usr/share/applications/bearhub.desktop"
  install -Dm644 "bearhub/desktop/bearhub_tray.desktop" \
    "$pkgdir/usr/share/applications/bearhub-tray.desktop"
  install -Dm644 "bearhub/view/resources/img/logo.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/bearhub.svg"
}
