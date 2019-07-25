# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=openvsp
pkgver=3.17.1
pkgrel=1
pkgdesc='OpenVSP allows the user to create a 3D model of an aircraft defined by
         common engineering parameters.'
arch=('i686' 'x86_64')
url='http://www.openvsp.org'
license=('NASA OPEN SOURCE AGREEMENT VERSION 1.3')
depends=('cblas'
         'cminpack'
         'eigen'
         'fltk'
         'freeglut'
         'gcc'
         'glew'
         'glm'
         'libxml2')
optdepends=('doxygen: generate documentation'
            'graphviz: generate documentation'
            'python: python API module'
            'swig: build interface to APIs')
makedepends=('cmake')
provides=('openvsp')
_name=OpenVSP-OpenVSP_${pkgver}
source=("https://github.com/OpenVSP/OpenVSP/archive/OpenVSP_${pkgver}.tar.gz")
sha256sums=('f0468b22a577c636943a4c17e07ffa4ceb0817f59374be404b581da15bd841c4')

prepare() {

  # Add -lcblas to cmake flags
  sed -i -e 's/X_FLAGS} -fPIC/X_FLAGS} -lcblas -fPIC/g' ${srcdir}/${_name}/SuperProject/CMakeLists.txt

}

_buildtype="Release"

build() {

  # Create a build directory
  mkdir -p "${srcdir}/${_name}/SuperProject/build"
  cd "${srcdir}/${_name}/SuperProject/build"

  msg "Starting CMake (build type: ${_buildtype})"

  cmake .. \
        -DCMAKE_BUILD_TYPE=${_buildtype} \
        -DCMAKE_PREFIX_PATH='/usr' \
        -DVSP_USE_SYSTEM_FLTK=true \
        -DVSP_USE_SYSTEM_GLEW=true

  msg "Building the project"
  make || return 0
}

package() {
  cd "${srcdir}/${_name}/SuperProject/build/OpenVSP-prefix/src/OpenVSP-build/_CPack_Packages/Linux/ZIP/OpenVSP-${pkgver}-Linux"

  msg "Installing files"

  # binary
  mkdir -p ${pkgdir}/usr/bin
  cp vsp vspaero vspscript vspslicer vspviewer ${pkgdir}/usr/bin/

  # misc
  mkdir -p ${pkgdir}/usr/share
  cp README.md ${pkgdir}/usr/share/
  cp LICENSE ${pkgdir}/usr/share/
  cp -r CustomScripts ${pkgdir}/usr/share/
  cp -r airfoil ${pkgdir}/usr/share/
  cp -r matlab ${pkgdir}/usr/share/
  cp -r scripts ${pkgdir}/usr/share/
  cp -r textures ${pkgdir}/usr/share/

}
