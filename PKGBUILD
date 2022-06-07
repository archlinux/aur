# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Bruno Pagani <archange@archlinux.org>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Rich Li <rich@dranek.com>
# Contributor: Sebastien Binet <binet@lblbox>

pkgname='python2-h5py'
_name="${pkgname#python2-}"
pkgver=2.10.0
pkgrel=3
pkgdesc='General-purpose Python bindings for the HDF5 library'
arch=('x86_64')
url='https://www.h5py.org/'
license=('BSD')
depends=(
  'hdf5'
  'python2-numpy'
  'python2-six'
)
makedepends=(
  'cython2'
  'python2-pkgconfig'
)
# checkdepends=(
#   'python2-pytest' 
#   'python2-unittest2'
# )
conflicts=('hdf5-openmpi')
_tarname="${_name}-${pkgver}"
source=("${_tarname}.tar.gz::https://pypi.python.org/packages/source/${_name::1}/${_name}/${_tarname}.tar.gz")
b2sums=('2e9da02224493b79b2df75ff9aa5cb16ab668d07bb95066356749be09091c54032efb3db8b53bdf0fbbbac2bcde532f9f051627327dcf3f35fb578b701ecc165')

prepare() {
  # Remove RPATH
  sed -i "s/settings\\['runtime_library_dirs'\\] = settings\\['library_dirs'\\]/pass/" ${_name}-${pkgver}/setup_build.py
  cp -a ${_name}-${pkgver}{,-py2}
}

build() {
  cd "${_tarname}"
  python2 setup.py build
}

# check() {
#   cd "${_tarname}"
#   # https://github.com/h5py/h5py/issues/1435
#   python2 setup.py test || warning "Tests failed"
# }

package() {
  cd "${_tarname}"
  python2 setup.py install --root="${pkgdir}" --skip-build --optimize=1

  install -Dm 644 'licenses/license.txt' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
