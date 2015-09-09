# Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
pkgname=choreonoid-git
_name=choreonoid
pkgver=1.5.0.r46f9a54
pkgrel=1
pkgdesc="An integrated robotics GUI environment."
arch=('any')
url="http://choreonoid.org"
license=('LGPL2')
depends=('boost' 'bullet' 'eigen3' 'glew' 'glibc' 'libgl' 'libpng' 'libjpeg-turbo'
         'libyaml' 'libx11' 'openscenegraph' 'python2' 'qt4' 'zlib' 'openrtm-aist'
         'openrtm-aist-python' 'hrpsys-base')
makedepends=('cmake')
conflicts=($_name)
replaces=($_name)
provides=($_name)

source=("git+https://github.com/s-nakaoka/$_name")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_name"
  _revision=$(git rev-parse --short HEAD)
  _major_version=$(sed -ne "s/^set(CNOID_MAJOR_VERSION \([0-9]\+\))\s*/\1/p" CMakeLists.txt)
  _minor_version=$(sed -ne "s/^set(CNOID_MINOR_VERSION \([0-9]\+\))/\1/p" CMakeLists.txt)
  _patch_version=$(sed -ne "s/^set(CNOID_PATCH_VERSION \([0-9]\+\))/\1/p" CMakeLists.txt)
  echo ${_major_version}.${_minor_version}.${_patch_version}.r${_revision}
}

prepare() {
  cd "$srcdir/$_name"

  mkdir -p build
}

build() {
  cd "$srcdir/$_name/build"

  # TODO: re-enable Bullet plugin when fixed upstream
  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX="/usr" \
           -DBUILD_BULLET_PLUGIN:BOOL=FALSE \
           -DBUILD_CORBA_PLUGIN:BOOL=TRUE \
           -DBUILD_HRPSYS31_PLUGIN:BOOL=TRUE \
           -DBUILD_OPENRTM_PLUGIN:BOOL=TRUE \
           -DBUILD_ROBOT_ACCESS_PLUGIN:BOOL=TRUE \
           -DCNOID_ENABLE_GETTEXT:BOOL=TRUE \
           -DENABLE_CORBA:BOOL=TRUE \
           -DENABLE_PYTHON:BOOL=TRUE \
           -DINSTALL_RUNTIME_DEPENDENCIES:BOOL=TRUE \
           -DINSTALL_SDK:BOOL=TRUE \
           -DUSE_EXTERNAL_GLEW:BOOL=TRUE \
           -DUSE_EXTERNAL_YAML:BOOL=TRUE \
           -DPYTHON_EXECUTABLE=/usr/bin/python2 \
           -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 \
           -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so
  make
}

package() {
  cd "$srcdir/$_name/build"

  make DESTDIR="${pkgdir}/" install
}
