# Contributor: Online122228 <premtimdukaj@hotmail.com>
# Contributor: Adam Goldsmith <contact@adamgoldsmith.name>
# Contributor: neodarz <neodarz@neodarz.net>
# Contributor: brodokk <brodokk@brodokk.space>

pkgname=libsavitar-git
_pkgbase=libSavitar
pkgver=5.3.0.r5.g94ad4be
pkgrel=0.1
pkgdesc="c++ implementation of 3mf loading with SIP python bindings"
arch=('i686' 'x86_64')
url="https://github.com/Ultimaker/$_pkgbase"
license=('LGPL')
depends=('python' 'pugixml')
makedepends=(
  'cmake'
  'git'
  'python-pyqt5-sip'
  'sip'
)
provides=('libsavitar')
conflicts=('libsavitar')
source=("git+https://github.com/Ultimaker/$_pkgbase.git")
b2sums=('SKIP')

pkgver() {
    cd "${_pkgbase}"

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

prepare() {
  cd "${_pkgbase}"
  sed -i 's,DESTINATION lib/python${PYTHON_VERSION_MAJOR}/dist-packages,DESTINATION lib/python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/site-packages,g' CMakeLists.txt
  sed -i 's,DESTINATION lib/python${PYTHON_VERSION_MAJOR}/dist-packages/cura),DESTINATION lib/python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/site-packages/cura),g' CMakeLists.txt
}

build() {
  cd "${_pkgbase}"
  mkdir -p build && cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "${_pkgbase}/build"
  make DESTDIR="${pkgdir}" install
}
