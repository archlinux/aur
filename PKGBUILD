# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-mamba
pkgver=0.11.2
pkgrel=6
pkgdesc="The definitive testing tool for Python. Born under the banner of Behavior Driven Development."
arch=('any')
license=('MIT')
url="https://nestorsalceda.github.io/mamba"
depends=('python-coverage' 'python-clint')
makedepends=('python-setuptools')
checkdepends=('python-doublex-expects')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nestorsalceda/mamba/archive/v$pkgver.tar.gz")
sha512sums=('8ca6207c9df7b3388db8ecabd13456e54d8811c24f695ccc638c90bb2c975268f9e803533808f9b099651ee4744376fad3b58eaa84a6c97605631368f979915c')

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
  install -Dm644 COPYING -t "$pkgdir"/usr/share/licenses/$pkgname/
}
