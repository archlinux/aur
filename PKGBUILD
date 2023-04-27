# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve> 

pkgname=python-numpy
pkgver=1.24.3
pkgrel=2
pkgdesc="Scientific tools for Python"
arch=('x86_64')
license=('custom')
url="https://www.numpy.org/"
depends=('cblas' 'lapack' 'python')
optdepends=('openblas: faster linear algebra')
makedepends=('python-setuptools' 'gcc-fortran' 'cython')
checkdepends=('python-pytest' 'python-hypothesis')
options=('staticlibs')
source=("https://github.com/numpy/numpy/releases/download/v$pkgver/numpy-$pkgver.tar.gz")
sha512sums=('d4b5841cbe68ee6653f99018e4e0182f2e5519a1cd69c14e0a95aa180f878e6a6786ccf0a7c78bf0d511c53e7535d7144fee428572dec7a4b60b25c8a1c0c9e1')

build() {
  cd numpy-$pkgver
  python setup.py build
}

check() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd numpy-$pkgver
  python setup.py install --root="$PWD/tmp_install" --optimize=1
  cd "$PWD/tmp_install"
  PATH="$PWD/usr/bin:$PATH" PYTHONPATH="$PWD/$site_packages:$PYTHONPATH" python -c 'import numpy; numpy.test()'
}

package() {
  cd numpy-$pkgver
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1

  install -D -m644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/python-numpy/
}
