# Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
pkgname=metapod-git
pkgver=1.0.7.r110.g39b100a
pkgrel=1
pkgdesc="META-Programming Optimized Dynamics library that provides robot dynamics algorithms."
arch=('i686' 'x86_64')
url="http://gazebosim.org/"
license=('BSD')
depends=('boost>=1.40' 'eigen3')
makedepends=('git' 'cmake' 'pkg-config')
optdepends=('urdfdom: urdfdom support')
provides=('metapod')
conflicts=('metapod')

_gitroot=https://github.com/laas
_gitrepo=metapod

_branch=master
_dir=${_gitrepo}
source=("${_dir}"::"git+${_gitroot}/${_gitrepo}.git"#branch=${_branch})
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_dir}"
  git describe --long | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  # Get Git submodules
  cd "${srcdir}/${_dir}"
  git submodule init
  git submodule update

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd "${srcdir}/build"

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX="/usr"
  make
}

check() {
  cd "${srcdir}/build"
  make test
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="$pkgdir/" install
}
