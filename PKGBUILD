# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Gaël Donval <gdonval+aur at google mail>
_base=dynd
pkgname=python-${_base}
pkgver=0.7.2
pkgrel=7
pkgdesc="Python exposure of dynd"
groups=('blaze-ecosystem')
arch=('x86_64')
url="http://lib${_base}.org"
license=('custom:BSD-2-clause')
depends=(python-numpy ${_base})
makedepends=(python-setuptools cython cmake)
source=(https://github.com/lib${_base}/${_base}-python/archive/v${pkgver}.tar.gz set_version_without_git.patch numpy-compatibility.patch)
sha512sums=('e51df7b368b1f6869338cb12a2f093064b1e7531ef674a83dbc7b9cc1dc6143cbe12cb37273bcc01e7b1066eda541b3b15473bc01e88fd9a8d1b594f6f37eaba'
  '60f3478c033c6cc284f51b5ab6313f77b3328ef21a707e048de95a0b1bcce1a4f362a898287968cfa060c2d603434e0eed1d9889233dd8cf559435d99cf8cc14'
  '92d5c4b36016e00cb1b063505382b81958163ba49841fee0bae9929db4e13efc383138a973bc98971c071b2ec35bd04d2612b5a0c5cf6c59817f0bc3992a7f7e')

prepare() {
  # https://github.com/libdynd/dynd-python/issues/746
  # sed -i 's/NPY_ARRAY_UPDATEIFCOPY/NPY_ITER_UPDATEIFCOPY/' ${_base}-python-${pkgver}/${_base}/src/numpy_interop.cpp
  cd ${_base}-python-${pkgver}
  patch -p1 -i ../numpy-compatibility.patch
  patch setup.py ${srcdir}/set_version_without_git.patch
}

build() {
  cd ${_base}-python-${pkgver}
  python setup.py build_py -cO1
  python setup.py build_ext --extra-cmake-args="-DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_CXX_STANDARD=14 -DBUILD_SHARED_LIBS=TRUE"
  python setup.py build_clib
  python setup.py build_scripts
}

package_python-dynd() {
  cd ${_base}-python-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
