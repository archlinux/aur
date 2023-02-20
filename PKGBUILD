# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve> 

pkgname=python-numpy
pkgver=1.24.2
pkgrel=1
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
sha512sums=('145fd7fb3919a185f75076d51b92c54a7fb1b776b637752ca15fdee15b239d6a517ef1bb8cded7c92e059cf6cda0146c24943c042d19b791e81125bc0ad4b820')

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
