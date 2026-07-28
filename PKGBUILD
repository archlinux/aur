pkgname=bearhub
pkgver=0.10.7
pkgrel=13
pkgdesc="Arch-first package manager hub (community-maintained fork of bauh)"
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
  'qt5-svg'
  'hicolor-icon-theme'
)
optdepends=(
  'python-lxml: web application support'
  'python-beautifulsoup4: web application support'
  'flatpak: flatpak support'
  'appimagekit: appimage support'
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
provides=('bearhub' 'bauh')
conflicts=('bearhub-git' 'bauh' 'bauh-git')
_pkgver_tag="${pkgver}-bearhub.7"
source=("$pkgname-${_pkgver_tag}.tar.gz::$url/archive/refs/tags/${_pkgver_tag}.tar.gz")
sha256sums=('6077e5c489dc05ed2ba49df7014f7998de72caacf5d422cf971c086fd73d0428')

build() {
  cd "$srcdir/$pkgname-${pkgver}-bearhub.7"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-${pkgver}-bearhub.7"

  sed -i 's|^Exec=/usr/bin/bearhub$|Exec=env QT_QPA_PLATFORM=xcb /usr/bin/bearhub|' "bearhub/desktop/bearhub.desktop"
  sed -i 's|^Exec=/usr/bin/bearhub-tray$|Exec=env QT_QPA_PLATFORM=xcb /usr/bin/bearhub-tray|' "bearhub/desktop/bearhub_tray.desktop"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 "bearhub/desktop/bearhub.desktop" \
    "$pkgdir/usr/share/applications/bearhub.desktop"
  install -Dm644 "bearhub/desktop/bearhub_tray.desktop" \
    "$pkgdir/usr/share/applications/bearhub-tray.desktop"
  install -Dm644 "bearhub/view/resources/img/logo.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/bearhub.svg"
}
