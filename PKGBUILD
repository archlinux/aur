# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-mamba
pkgname=('python-mamba' 'python2-mamba')
pkgver=0.8.6
pkgrel=2
pkgdesc="The definitive testing tool for Python. Born under the banner of Behavior Driven Development."
arch=('any')
license=('MIT')
url="http://nestorsalceda.github.io/mamba"
makedepends=('python-setuptools' 'python2-setuptools' 'python-clint' 'python2-clint'
             'python-coverage' 'python2-coverage' 'python-watchdog' 'python2-watchdog'
             'git')
checkdepends=('python-doublex-expects' 'python2-doublex-expects')
source=("git+https://github.com/nestorsalceda/mamba.git#tag=v$pkgver")
sha512sums=('SKIP')

prepare() {
  cp -a mamba{,-py2}
}

build() {
  cd "$srcdir"/mamba
  python setup.py build

  cd "$srcdir"/mamba-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/mamba
  # Hack entry points by installing it

  cd "$srcdir"/mamba
  python setup.py install --root="$PWD/tmp_install" --optimize=1
  (
    export PATH="$PWD/tmp_install/usr/bin:$PATH" PYTHONPATH="$PWD/tmp_install/usr/lib/python3.5/site-packages:$PYTHONPATH"
    mamba --enable-coverage
  )

  cd "$srcdir"/mamba-py2
  python setup.py install --root="$PWD/tmp_install" --optimize=1
  (
    export PATH="$PWD/tmp_install/usr/bin:$PATH" PYTHONPATH="$PWD/tmp_install/usr/lib/python2.7/site-packages:$PYTHONPATH"
    mamba --enable-coverage
  )
}

package_python-mamba() {
  depends=('python-coverage' 'python-watchdog' 'python-clint' 'python-setuptools')

  cd mamba
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}

package_python2-mamba() {
  depends=('python2-coverage' 'python2-watchdog' 'python2-clint' 'python2-setuptools')

  cd mamba-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING

  mv "$pkgdir"/usr/bin/mamba{,2}
}
