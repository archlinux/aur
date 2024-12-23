# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Jannik Becher <becher.jannik@gmail.com>

pkgname=rshell
pkgver=0.0.36
pkgrel=1
pkgdesc="A remote shell for working with MicroPython boards"
url='https://github.com/dhylands/rshell'
depends=(python-pyudev python-pyserial)
makedepends=(python-build python-installer python-setuptools python-wheel)
license=(MIT)
arch=(any)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('4a66d835207479550e59d0dd3e83003d04c4eca78a4e49250f887ed2dd4b0bf5')

prepare() {
  cd $pkgname-$pkgver
  # Prevent deprecation warning at build time
  sed -i -e 's/description-file/description_file/' setup.cfg
}

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  rm -rf "$pkgdir"/usr/lib/python*/site-packages/tests
  # License
  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
  # Documentation
  install -vDm 644 README.rst -t "$pkgdir"/usr/share/doc/$pkgname
}
