# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-mamba
pkgname=('python-mamba' 'python2-mamba')
pkgver=0.9.3
pkgrel=2
pkgdesc="The definitive testing tool for Python. Born under the banner of Behavior Driven Development."
arch=('any')
license=('MIT')
url="http://nestorsalceda.github.io/mamba"
makedepends=('python-setuptools' 'python2-setuptools' 'python-clint' 'python2-clint'
             'python-coverage' 'python2-coverage' 'python-watchdog' 'python2-watchdog')
checkdepends=('python-doublex-expects' 'python2-doublex-expects')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/nestorsalceda/mamba/archive/v$pkgver.tar.gz")
sha512sums=('3f9999233a0f7d76f918148d1aa6f994f2ac460cd60df60468ca3bf831e0590fe2169a56bbdae88b4386e45f4df64cefa4c3b5e153cf859a0275d3e2edf768b3')

prepare() {
  cp -a mamba-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/mamba-$pkgver
  python setup.py build

  cd "$srcdir"/mamba-$pkgver-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/mamba-$pkgver
  # Hack entry points by installing it

  cd "$srcdir"/mamba-$pkgver
  python setup.py install --root="$PWD/tmp_install" --optimize=1
  (
    export PATH="$PWD/tmp_install/usr/bin:$PATH" PYTHONPATH="$PWD/tmp_install/usr/lib/python3.7/site-packages:$PYTHONPATH"
    mamba --enable-coverage
  )

  cd "$srcdir"/mamba-$pkgver-py2
  python setup.py install --root="$PWD/tmp_install" --optimize=1
  (
    export PATH="$PWD/tmp_install/usr/bin:$PATH" PYTHONPATH="$PWD/tmp_install/usr/lib/python2.7/site-packages:$PYTHONPATH"
    mamba --enable-coverage
  )
}

package_python-mamba() {
  depends=('python-coverage' 'python-watchdog' 'python-clint' 'python-setuptools')

  cd mamba-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}

package_python2-mamba() {
  depends=('python2-coverage' 'python2-watchdog' 'python2-clint' 'python2-setuptools')

  cd mamba-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING

  mv "$pkgdir"/usr/bin/mamba{,2}
}
