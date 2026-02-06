# Maintainer: George Tsiamasiotis <gtsiam@windowslive.com>

pkgname=tractor
pkgver=5.2.0
pkgrel=1
pkgdesc='Setup an onion routing proxy'
arch=(any)
url='https://framagit.org/tractor/tractor/'
license=('GPL-3.0-or-later')

depends=(
  python
  python-gobject
  python-fire
  python-pysocks
  python-stem
  glib2
  tor
  dconf
)
makedepends=(
  python-build
  python-setuptools
  python-installer
)
# checkdepends=(
#   python-nose
#   gsettings-desktop-schemas
# )
optdepends=(
  'carburetor: Graphical settings app using GTK'
)

source=("$pkgname-$pkgver.tar.gz::https://framagit.org/tractor/tractor/-/archive/$pkgver/tractor-$pkgver.tar.gz")
sha256sums=('73eea1b31669bfc7879b5de3ce854fe6be754dd01317467f1501c60ce28c94f0')

build() {
  cd "$pkgname-$pkgver"

  python -m build --wheel --no-isolation
}

# The upstream test suite touches system settings and can fail depending on
# the system configuration. I'm also generally tired of beta-testing this
# particular test suite, so...
# 
# check() {
#   cd "$pkgname-$pkgver"
# 
#   nosetests -v
# }

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
