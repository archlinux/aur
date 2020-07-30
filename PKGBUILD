# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-mamba
pkgver=0.11.1
pkgrel=1
pkgdesc="The definitive testing tool for Python. Born under the banner of Behavior Driven Development."
arch=('any')
license=('MIT')
url="https://nestorsalceda.github.io/mamba"
depends=('python-coverage' 'python-watchdog' 'python-clint' 'python-setuptools')
checkdepends=('python-doublex-expects')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nestorsalceda/mamba/archive/v$pkgver.tar.gz")
sha512sums=('2b28415e5352fcec8028a8ddef6ff83a0cf2ebbb385506eb97f6a46be619277136a61180e8cf30047efd7807f867a03a0d1032dbfed27e2fc050a8639f67814c')

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
