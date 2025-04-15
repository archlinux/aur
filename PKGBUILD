# Maintainer: George Tsiamasiotis <gtsiam@windowslive.com>

pkgname=tractor
pkgver=5.1.0
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

sha256sums=('54735797e3bc1a99499b2409beb67bfa2fa5058039a1dc3da7bfcb9999b2cc21'
            'bf8c7b0835cf2a1cc87a5b014eec01a953d55a190e57a7383f1cd1edb40b3a73')

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
