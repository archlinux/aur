# Maintainer: George Tsiamasiotis <gtsiam@windowslive.com>

pkgname=tractor
pkgver=5.0.0
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
checkdepends=(
  python-nose
  gsettings-desktop-schemas
)
optdepends=(
  'carburetor: Graphical settings app using GTK'
)

source=("$pkgname-$pkgver.tar.gz::https://framagit.org/tractor/tractor/-/archive/$pkgver/tractor-$pkgver.tar.gz"
        "fix-tests.patch")

sha256sums=('c5bece79f9771c6a68788198c3b852b2dce311b1297709b76f78f680e5a9fdc8'
            '784b1387805d670adf8e06327c4b172ca09241770853901745fef73066d41290')

prepare() {
  cd "$pkgname-$pkgver"

  patch -Np1 -i "$srcdir/fix-tests.patch"
}

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
