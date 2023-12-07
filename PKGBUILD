# Maintainer: George Tsiamasiotis <gtsiam@windowslive.com>

pkgname=carburetor
pkgver=4.3.0
pkgrel=1
pkgdesc='Graphical settings app for tractor in GTK'
arch=(any)
url='https://framagit.org/tractor/carburetor'
license=(GPL3)

depends=(
  python
  python-gobject
  gtk4
  libadwaita
  tractor
)
makedepends=(
  python-build
  python-installer
  python-wheel
)

source=("$pkgname-$pkgver.tar.gz::https://framagit.org/tractor/carburetor/-/archive/$pkgver/carburetor-$pkgver.tar.gz")
sha256sums=('30701ecec9947a38db3db8e163c7b321b63219f46b608eecf61a735914714ede')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"

  # Install python package
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Install man page
  install -Dm0644 -t "$pkgdir/usr/share/man/man1" \
    data/carburetor.1

  # Install desktop integration files
  install -Dm0644 -t "$pkgdir/usr/share/applications" \
    data/io.frama.tractor.carburetor.desktop
  install -Dm0644 -t "$pkgdir/usr/share/metainfo" \
    data/metainfo/io.frama.tractor.carburetor.metainfo.xml

  # Install icons
  mkdir -p "$pkgdir/usr/share/icons/hicolor"
  cp -dpr --no-preserve=ownership data/icons/* "$pkgdir/usr/share/icons/hicolor/"
}
