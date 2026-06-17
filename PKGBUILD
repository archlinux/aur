# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Alex Brinister <alex_brinister at yahoo dot com>

pkgname=rmtoo
pkgver=26.0.2
pkgrel=2
pkgdesc="Free and Open Source Requirements Management Tool"
arch=(any)
url="https://github.com/florath/rmtoo"
license=(GPL-3.0-or-later)
makedepends=(python-build python-wheel python-installer python-setuptools)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        001-no-setup.py-contrib-install.patch)
sha512sums=('f72f185086bf238f85a91ad996a160f125b199ba39baeb7a4e202f3093c16ba8a05f4e2988affc021f541dee1abb01308b2ecfc37e163887f9be5f62a2676b1f'
            '8dfd55f5ca0182218f389d1fce2445e2c75a41e1c1a8dcd9badf5504e2906bcaa97043dc194f4e96d60deb525d4cb8bf509a05cbe3e9ca26e696f2db296d38f7')

prepare() {
  patch -p1 -d "$pkgname-$pkgver" < 001-no-setup.py-contrib-install.patch
  # cd "$pkgname-$pkgver"
  # sed -i -e '18,32d' -e '42,44d' setup.py
}

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  depends=(
    texlive-core
    graphviz
    python-scipy
    gnuplot
    python-odfpy
    python-stevedore
    python-yaml
    python-gitpython
    python-jinja
    python-setuptools)

  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -d "$pkgdir/usr/share/$pkgname/"
  cp -a contrib "$pkgdir/usr/share/$pkgname/"
}

# vim: set expandtab ts=2 sw=2:
