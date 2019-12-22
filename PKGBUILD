# Contributor: Max Devaine <max@devaine.cz>
# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=openvsp-git
pkgver=r4142.bf787072
pkgrel=1
pkgdesc='OpenVSP allows the user to create a 3D model of an aircraft defined by
         common engineering parameters.'
arch=('i686' 'x86_64')
url='http://www.openvsp.org'
license=('NASA OPEN SOURCE AGREEMENT VERSION 1.3')
depends=('cblas'
         'cminpack'
         'code-eli'
         'cpptest'
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
makedepends=('cmake' 'git')
provides=('openvsp')
conflicts=('openvsp')
_name=OpenVSP
source=("git+https://github.com/OpenVSP/OpenVSP.git")
md5sums=('SKIP')

pkgver() {
  cd "${_name}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

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
        -DVSP_USE_SYSTEM_CPPTEST=true \
        -DVSP_USE_SYSTEM_LIBXML2=true \
        -DVSP_USE_SYSTEM_EIGEN=true \
        -DVSP_USE_SYSTEM_CODEELI=true \
        -DVSP_USE_SYSTEM_FLTK=true \
        -DVSP_USE_SYSTEM_GLM=true \
        -DVSP_USE_SYSTEM_GLEW=true \
        -DVSP_USE_SYSTEM_CMINPACK=true

  msg "Building the project"
  make || return 0
}

package() {
  cd ${srcdir}/${_name}/SuperProject/build/OpenVSP-prefix/src/OpenVSP-build/_CPack_Packages/Linux/ZIP/*/

  msg "Installing files"

  # binary
  mkdir -p ${pkgdir}/usr/bin
  cp vsp vspaero vspscript vspslicer vspviewer ${pkgdir}/usr/bin/

  # misc
  mkdir -p ${pkgdir}/usr/share/openvsp
  cp README.md ${pkgdir}/usr/share/openvsp
  cp LICENSE ${pkgdir}/usr/share/openvsp
  cp -r CustomScripts ${pkgdir}/usr/share/openvsp
  cp -r airfoil ${pkgdir}/usr/share/openvsp
  cp -r matlab ${pkgdir}/usr/share/openvsp
  cp -r scripts ${pkgdir}/usr/share/openvsp
  cp -r textures ${pkgdir}/usr/share/openvsp

}
