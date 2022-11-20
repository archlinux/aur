# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>
# Contributor: Bodor Dávid Gábor <david.gabor.bodor@gmail.com>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>

_name=scipy
pkgname=python38-scipy
pkgver=1.9.3
pkgrel=1
pkgdesc='Open-source software for mathematics, science, and engineering'
arch=(x86_64)
url='https://www.scipy.org/'
license=(BSD)
depends=(python38-numpy)
provides=(scipy)
makedepends=(gcc-fortran cython python-pythran pybind11 meson-python python-build python-installer)
checkdepends=(python38-pytest)
optdepends=('python38-pillow: for image saving module')
source=(https://pypi.python.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('fbc5c05c85c1a02be77b1ff591087c83bc44579c6d2bd9fb798bb64ea5e1a027')

prepare() {
  cd $_name-$pkgver
# meson-python does not allow passing options to meson yet
  sed -e 's|blas=openblas|blas=blas|' -e 's|lapack=openblas|lapack=lapack|' -i meson.build
# Relax dependency versions
  sed -e 's|==|>=|g' -e 's|\,<[0-9]*\(.[0-9]\)*||g' -i pyproject.toml
}

build() {
  cd $_name-$pkgver
  python3.8 -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  python3.8 -m venv --system-site-packages test-env
  test-env/bin/python3.8 -m installer dist/*.whl
  cd test-env
  bin/python3.8 -m "from scipy import test; test('full')"
}

package() {
  cd $_name-$pkgver
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname
}
