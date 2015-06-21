# Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
pkgname=urdfdom
pkgver=0.3.0
pkgrel=5
pkgdesc="The URDF (U-Robot Description Format) library provides core data structures and a simple XML parsers for populating the class data structures from an URDF file."
arch=('i686' 'x86_64')
url="https://github.com/ros/urdfdom"
license=('BSD')
depends=( 'boost' 'tinyxml' 'console-bridge' 'urdfdom-headers')
makedepends=('git' 'cmake')

_gitroot=https://github.com/ros
_gitrepo=urdfdom

_tag=${pkgver}
_dir=${_gitrepo}
source=("${_dir}"::"git+${_gitroot}/${_gitrepo}.git"#tag=${_tag}
        "soname.patch")
md5sums=('SKIP'
         'ec2aeff2e5cc0d4dba6010bf7a33e81a')

build() {
  cd ${srcdir}/${_dir}
  patch -p1 -i ${srcdir}/soname.patch

  # Create build directory
  rm -rf ${srcdir}/build && mkdir -p ${srcdir}/build
  cd ${srcdir}/build

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX="/usr"
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR="$pkgdir/" install
}
