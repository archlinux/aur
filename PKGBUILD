# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-mamba
pkgver=0.11.0
pkgrel=1
pkgdesc="The definitive testing tool for Python. Born under the banner of Behavior Driven Development."
arch=('any')
license=('MIT')
url="https://nestorsalceda.github.io/mamba"
depends=('python-coverage' 'python-watchdog' 'python-clint' 'python-setuptools')
checkdepends=('python-doublex-expects')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nestorsalceda/mamba/archive/v$pkgver.tar.gz")
sha512sums=('2faf941700800ba0432bfd170d6ff2278e5fc3ba4e85f486d33ed5f07e148284d400e2b02ac0f957a27d47b705fc52b042dc4311bdd175907e307e4dbfa95246')

build() {
  cd mamba-$pkgver
  python setup.py build
}

check() {
  cd mamba-$pkgver
  # Hack entry points by installing it

  python setup.py install --root="$PWD/tmp_install" --optimize=1
  (
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    export PATH="$PWD/tmp_install/usr/bin:$PATH" PYTHONPATH="$PWD/tmp_install/${site-packages}:$PYTHONPATH"
    mamba --enable-coverage
  )
}

package() {
  cd mamba-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 COPYING -t "$pkgdir"/usr/share/licenses/$pkgname/
}
