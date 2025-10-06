# Maintainer: George Tsiamasiotis <gtsiam@windowslive.com>

pkgname=tractor
pkgver=5.1.0
pkgrel=3
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

source=("$pkgname-$pkgver.tar.gz::https://framagit.org/tractor/tractor/-/archive/$pkgver/tractor-$pkgver.tar.gz"
        "0001-fix-missing-schema-check.patch")

sha256sums=('54735797e3bc1a99499b2409beb67bfa2fa5058039a1dc3da7bfcb9999b2cc21'
            'f7f986e07d44c0a7af1b5efabe44fc3e77d9b814622fa6089e1414e86fdd64cc')

prepare() {
  cd "$pkgname-$pkgver"

  patch -Np1 -i "$srcdir/0001-fix-missing-schema-check.patch"
}

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
