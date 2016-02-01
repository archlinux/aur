# Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
pkgname=roboptim-core-python-git
pkgver=3.2.r0.gb93f7f7
pkgrel=1
pkgdesc="Python bindings for RobOptim"
arch=('i686' 'x86_64')
url="http://roboptim.net/"
license=('(L)GPL2')
depends=('boost>=1.41' 'eigen3' 'python2' 'python2-numpy' 'python2-futures' 'roboptim-core-git')
optdepends=('python2-matplotlib: visualization')
makedepends=('git' 'cmake>=2.8' 'doxygen')
provides=('roboptim-core-python')
conflicts=('roboptim-core-python')

# Repository location
_gitroot="git+https://github.com/roboptim/roboptim-core-python.git#branch=master"
_gitname="roboptim-core-python"

source=("${_gitname}"::${_gitroot})
md5sums=('SKIP')

# Build type
_buildtype="Release"

# Build directory
_builddir="${_gitname}-build"

_doxytag="usr/share/doc/roboptim-core-python/doxygen-html/roboptim-core-python.doxytag"

pkgver() {
    cd "$srcdir/${_gitname}"
    # Use the tag of the last commit
    git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v([0-9])/\1/'
}

prepare() {
  cd "${srcdir}/${_gitname}"
  git submodule init
  git submodule update

  cd "${srcdir}"
  mkdir -p ${_builddir}
  cd "${_builddir}"

  cmake -DCMAKE_BUILD_TYPE="${_buildtype}" \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_INSTALL_LIBDIR="lib" \
        -DPYTHON_EXECUTABLE=/usr/bin/python2 \
        -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 \
        -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so \
        "${srcdir}/${_gitname}"
}

build() {
  cd "${srcdir}/${_builddir}"
  make
}

check() {
  cd "${srcdir}/${_builddir}"
  export PYTHONPATH=$(pwd)/src
  make test
}

# Create the package
package() {
  cd "${srcdir}/${_builddir}"
  make --silent DESTDIR="${pkgdir}/" install

  # Remove ${src_dir} from the doxytag
  msg "Correcting doxytag file"
  sed -i "s:${srcdir}::g" ${pkgdir}/${_doxytag}
}
