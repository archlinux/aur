# Contributor: cqz5555 < cqzw555@163.com >
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=python-visvis
pkgver=1.14.0.r3.gd8f36d4
_commit=d8f36d4b33554a24918c7043188ccffcc054690e
pkgrel=3
pkgdesc="Python library for visualization of 1D to 4D data"
url="https://github.com/almarklein/visvis"
arch=('any')
license=('BSD-3-Clause')
depends=(
  'python'
  'python-imageio'
  'python-numpy'
  'python-opengl'
  'python-pillow'
  'python-scipy'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
optdepends=(
  'pyside6: altenative Qt6 GUI backend'
  'python-glfw: GLFW GUI backend'
  'python-pyfltk: FLTK GUI backend'
  'python-pyqt5: Qt5 GUI backend'
  'python-pyqt6: Qt6 GUI backend'
  'python-wxpython: WxWidgets GUI backend'
)
checkdepends=(
  'python-pytest'
)
source=("${pkgname}::git+${url}.git#commit=${_commit}")
b2sums=('SKIP')

pkgver() {
    cd "${pkgname}"

    # Generate git tag based version. Count only proper (v)#.#* [#=number] tags.
    local _gitversion=$(git describe --long --tags --match '[v0-9][0-9.][0-9.]*' | sed -e 's|^v||' | tr '[:upper:]' '[:lower:]') 

    # Format git-based version for pkgver
    # Expected format: e.g. 1.5.0rc2.r521.g99982a1c
    # Or in case of 'post': 1.5.0.post1.r521.g99982a1c
    echo "${_gitversion}" | sed \
        -e 's;^\([0-9][0-9.]*\)[-_.]\([a-zA-Z]\+\);\1\2;' \
        -e 's;\([0-9]\+-g\);r\1;' \
        -e 's;-;.;g' \
        -e 's;\(post.*\);\.\1;'
}

build() {
  cd "${pkgname}"
  python -m build --wheel --no-isolation
}

check(){
  cd "${pkgname}"
  PYTHONPATH="$PWD/build/lib" pytest
}

package() {
  cd "${pkgname}"
  python -m installer --destdir="$pkgdir/" dist/*.whl
  install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
