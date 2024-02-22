# Maintainer: George Tsiamasiotis <gtsiam@windowslive.com>

pkgname=tractor
pkgver=4.5.1
pkgrel=1
pkgdesc='Setup an onion routing proxy'
arch=(any)
url='https://framagit.org/tractor/tractor/'
license=(GPL3)

depends=(
  python
  python-gobject
  python-fire
  python-pysocks
  python-stem
  tor
)
makedepends=(
  python-build
  python-installer
  python-wheel
)
checkdepends=(
  python-nose
)
optdepends=(
  'carburetor: Graphical settings app using GTK'
)

source=(
  "$pkgname-$pkgver.tar.gz::https://framagit.org/tractor/tractor/-/archive/$pkgver/tractor-$pkgver.tar.gz")
sha256sums=('0f27211ec9da2842134d28a43139bff77bc9d7e8b1cba33a6133c92acf556fda')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname-$pkgver"
  
  nosetests
}

package() {
  cd "$pkgname-$pkgver"

  # Install python package
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Install gschema
  install -Dm0644 -t "$pkgdir/usr/share/glib-2.0/schemas" src/tractor/tractor.gschema.xml

  # Install man page
  install -Dm0644 -t "$pkgdir/usr/share/man/man1" data/tractor.1

  # Install bash completions
  install -Dm0644 -t "$pkgdir/usr/share/bash-completion/completions/tractor" data/completion/bash/tractor
}
