# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Bruno Pagani <archange@archlinux.org>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Rich Li <rich@dranek.com>
# Contributor: Sebastien Binet <binet@lblbox>

pkgname='python2-h5py'
_name="${pkgname#python2-}"
_commit='497d6a8ccbf3519fea2cd10093d0cee5da72358a'  #latest commit on '2.10.x' branch
pkgver=2.10.0.r9.g497d6a8c
pkgrel=2
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
  'git'
  'python2-pkgconfig'
)
# checkdepends=(
#   'python2-pytest' 
#   'python2-unittest2'
# )
conflicts=('hdf5-openmpi')
source=("${pkgname}::git+https://github.com/h5py/h5py.git#commit=${_commit}")
b2sums=('SKIP')

prepare() {
  # Remove RPATH
  sed -i "s/settings\\['runtime_library_dirs'\\] = settings\\['library_dirs'\\]/pass/" ${_name}-${pkgver}/setup_build.py
  cp -a ${_name}-${pkgver}{,-py2}
}

pkgver() {
    cd "${pkgname}"

    # Generate git tag based version. Count only proper (v)#.#* [#=number] tags.
    local _gitversion=$(git describe --long --tags --match '[v0-9][0-9.][0-9.]*' | sed -e 's|^v||' | tr '[:upper:]' '[:lower:]')

    # Format git-based version for pkgver
    # Expected format: e.g. 1.5.0rc2.r521.g99982a1c
    echo "${_gitversion}" | sed \
        -e 's|^\([0-9][0-9.]*\)-\([a-zA-Z]\+\)|\1\2|' \
        -e 's|\([0-9]\+-g\)|r\1|' \
        -e 's|-|.|g'
}

build() {
  cd "${pkgname}"
  python2 setup.py build
}

# check() {
#   cd "${pkgname}"
#   # https://github.com/h5py/h5py/issues/1435
#   python2 setup.py test || warning "Tests failed"
# }

package() {
  cd "${pkgname}"
  python2 setup.py install --root="${pkgdir}" --skip-build --optimize=1

  install -Dm 644 'licenses/license.txt' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
