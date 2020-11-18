# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-socketpool
pkgver=0.5.3
pkgrel=7
pkgdesc="A simple Python socket pool"
arch=('any')
license=('MIT')
url="https://github.com/benoitc/socketpool"
depends=('python')
makedepends=('python-setuptools' 'git')
checkdepends=('python-pytest')
source=("git+https://github.com/benoitc/socketpool.git#tag=$pkgver")
sha512sums=('SKIP')

prepare() {
  cd "$srcdir/socketpool"
  sed -i 's/data_files.*$/)/' setup.py
  sed -i 's/isAlive/is_alive/' socketpool/backend_thread.py
}

build() {
  cd "$srcdir/socketpool"
  LC_CTYPE=en_US.UTF-8 python setup.py build
}

check() {
  cd "$srcdir/socketpool"
  PYTHONPATH="$PWD/build/lib:$PYTHONPATH" \
  py.test tests/
}

package() {
  cd socketpool
  LC_CTYPE=en_US.UTF-8 python setup.py install --root="${pkgdir}" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
