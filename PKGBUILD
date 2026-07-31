# Maintainer: svan71 <Keystone.osk@gmail.com>

pkgname=keystone-osk
pkgver=0.9.0
pkgrel=1
pkgdesc="Practical on-screen keyboard for Linux desktops"
arch=('any')
url="https://github.com/svan71/keystone-osk"
license=('GPL-3.0-or-later')
# ydotool is invoked as a subprocess by keystone_osk/backend.py, so namcap
# cannot see it and reports it as possibly unneeded. It is required.
depends=('python' 'pyside6' 'ydotool' 'hicolor-icon-theme')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b11421aa51b56ce9c0bf5408b4906e8e49660224579826bbf364ce088c39bad6')

build() {
  cd "$srcdir/$pkgname-$pkgver/source"
  python -m build --wheel --no-isolation
}

check() {
  cd "$srcdir/$pkgname-$pkgver/source"
  QT_QPA_PLATFORM=offscreen python -m pytest -q
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" source/dist/*.whl

  install -Dm644 source/LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 live-install/applications/keystone-osk.desktop \
    "$pkgdir/usr/share/applications/keystone-osk.desktop"
  install -Dm644 live-install/icons/hicolor/256x256/apps/keystone.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/keystone.png"
  install -Dm644 live-install/icons/hicolor/256x256/apps/keystone-transparent.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/keystone-transparent.png"
  install -Dm644 packaging/io.github.svan71.keystone-osk.metainfo.xml \
    "$pkgdir/usr/share/metainfo/io.github.svan71.keystone-osk.metainfo.xml"
}
