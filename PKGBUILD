# Maintainer: George Tsiamasiotis <gtsiam@windowslive.com>

pkgname=tractor
pkgver=4.1.1
pkgrel=1
pkgdesc='Setup an onion routing proxy'
arch=(any)
url='https://framagit.org/tractor/tractor/'
license=(GPL3)

depends=(
  python
  python-gobject
  python-fire
  python-psutil
  python-pysocks
  python-requests
  python-stem
  tor
)
makedepends=(
  python-build
  python-installer
  python-wheel
)
optdepends=(
  'carburetor: Graphical settings app using GTK'
)

source=(
  "$pkgname-$pkgver.tar.gz::https://framagit.org/tractor/tractor/-/archive/$pkgver/tractor-$pkgver.tar.gz"
  'add-manifest.patch')
sha256sums=(
  '42df431897d27fcab017e12f549bda474dacb02cba9e4092f2ed4b167d931376'
  'e5ea82ab613d08d33bcf050d376d4e827fc346f6575b3adfc535e63588bfb6e5')

prepare() {
  cd "$pkgname-$pkgver"

  # https://framagit.org/tractor/tractor/-/merge_requests/9
  patch -i "$srcdir/add-manifest.patch"
}

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"

  # Install python package
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Install gschema
  install -Dm0644 -t "$pkgdir/usr/share/glib-2.0/schemas" tractor/tractor.gschema.xml

  # Install man page
  install -Dm0644 -t "$pkgdir/usr/share/man/man1" tractor/man/tractor.1

  # Install bash completions
  install -Dm0644 -t "$pkgdir/usr/share/bash-completion/completions/tractor" tractor/tractor-completion
}
