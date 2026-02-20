# Maintainer: Daniel Nylander <daniel@danielnylander.se>
pkgname=vsdview
pkgver=0.4.0
pkgrel=1
pkgdesc="Read-only viewer for Microsoft Visio files (.vsdx/.vsd) — GTK4/libadwaita"
arch=('any')
url="https://github.com/yeager/vsdview"
license=('GPL-3.0-or-later')
depends=('python' 'python-gobject' 'gtk4' 'libadwaita' 'python-cairo')
optdepends=('libvisio: legacy .vsd file support')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'gettext')
source=("$pkgname-$pkgver.tar.gz::https://github.com/yeager/vsdview/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('33d2da59b194f9ad132472f95677aa9fc4d12bb8486b6c626257cbcca1885f6a')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 data/org.nylander.vsdview.desktop "$pkgdir/usr/share/applications/org.nylander.vsdview.desktop"
  install -Dm644 data/org.nylander.vsdview.metainfo.xml "$pkgdir/usr/share/metainfo/org.nylander.vsdview.metainfo.xml"
  install -Dm644 data/org.nylander.vsdview.mime.xml "$pkgdir/usr/share/mime/packages/org.nylander.vsdview.mime.xml"
  install -Dm644 data/icons/hicolor/scalable/apps/org.nylander.vsdview.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.nylander.vsdview.svg"

  for po in po/*.po; do
    [ -f "$po" ] || continue
    lang=$(basename "$po" .po)
    install -dm755 "$pkgdir/usr/share/locale/$lang/LC_MESSAGES"
    msgfmt -o "$pkgdir/usr/share/locale/$lang/LC_MESSAGES/vsdview.mo" "$po"
  done
}
