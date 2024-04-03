# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>

pkgname=python-numpy
pkgver=1.26.4
pkgrel=2
pkgdesc="Scientific tools for Python"
arch=('x86_64')
license=('custom')
url="https://www.numpy.org/"
depends=('cblas' 'lapack' 'python')
optdepends=('blas-openblas: faster linear algebra')
makedepends=('python-build' 'python-installer' 'meson-python' 'cmake' 'gcc-fortran' 'cython')
checkdepends=('python-pytest' 'python-hypothesis')
source=("https://github.com/numpy/numpy/releases/download/v$pkgver/numpy-$pkgver.tar.gz")
sha512sums=('f7121ab4099fa0686f9c095d456baa4a5869d651d7b7a06385f885f329cf08f11024b5df5e7b4ee705970062a8102ec4f709512eabbfd5c9fccce4ef83b9c208')

build() {
  cd numpy-$pkgver
  CFLAGS+=" -ffat-lto-objects" \
  CXXFLAGS+=" -ffat-lto-objects" \
  python -m build --wheel --no-isolation \
    -Csetup-args="-Dblas=cblas" \
    -Csetup-args="-Dlapack=lapack"
}

check() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd numpy-$pkgver
  python -m installer --destdir="$PWD/tmp_install" dist/*.whl
  cd "$PWD/tmp_install"
  PATH="$PWD/usr/bin:$PATH" PYTHONPATH="$PWD/$site_packages:$PYTHONPATH" python -c 'import numpy; numpy.test()'
}

package() {
  cd numpy-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -D -m644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/python-numpy/
}
