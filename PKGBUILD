# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Gaël Donval <gdonval+aur at google mail>
_base=dynd
pkgname=python-${_base}
pkgver=0.7.2
pkgrel=3
pkgdesc="Python exposure of dynd"
groups=('blaze-ecosystem')
arch=('x86_64')
url="http://libdynd.org"
license=('custom:BSD-2-clause')
depends=(python-numpy dynd)
makedepends=(python-setuptools cython cmake)
source=(https://github.com/lib${_base}/${_base}-python/archive/v${pkgver}.tar.gz)
sha512sums=('e51df7b368b1f6869338cb12a2f093064b1e7531ef674a83dbc7b9cc1dc6143cbe12cb37273bcc01e7b1066eda541b3b15473bc01e88fd9a8d1b594f6f37eaba')

prepare() {
  cd "${_base}-python-${pkgver}"
  patch setup.py ${startdir}/set_version_without_git.patch
}

build() {
  cd "${_base}-python-${pkgver}"
  python setup.py --help
  python setup.py build_py -cO1
  python setup.py build_ext --extra-cmake-args="-DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_CXX_STANDARD=14 -DBUILD_SHARED_LIBS=TRUE"
  python setup.py build_clib
  python setup.py build_scripts
}

package_python-dynd() {
  cd "${_base}-python-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
