# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Max Devaine <max@devaine.cz>
pkgname=openvsp-git
pkgver=r5595.45e46ea8
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
         'libxml2'
         'stepcode')
optdepends=('doxygen: generate documentation'
            'graphviz: generate documentation'
            'python: python API module'
            'swig: build interface to APIs')
makedepends=('cmake' 'unzip' 'git')
provides=('openvsp')
conflicts=('openvsp')
_name=OpenVSP
source=("git+https://github.com/OpenVSP/OpenVSP.git"
        "format.patch"::"https://patch-diff.githubusercontent.com/raw/OpenVSP/OpenVSP/pull/221.patch")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "${_name}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_name}"
  patch --strip=1 < "${srcdir}/format.patch"
}

build() {

  mkdir -p "${srcdir}/build"
  mkdir -p "${srcdir}/buildlibs"

  cd "${srcdir}/buildlibs"

  cmake ../${_name}/Libraries \
        -DCMAKE_PREFIX_PATH='/usr' \
        -DVSP_USE_SYSTEM_CPPTEST=true \
        -DVSP_USE_SYSTEM_LIBXML2=true \
        -DVSP_USE_SYSTEM_EIGEN=true \
        -DVSP_USE_SYSTEM_CODEELI=false \
        -DVSP_USE_SYSTEM_FLTK=true \
        -DVSP_USE_SYSTEM_GLM=true \
        -DVSP_USE_SYSTEM_GLEW=true \
        -DVSP_USE_SYSTEM_CMINPACK=true \
        -DVSP_USE_SYSTEM_LIBIGES=false \
        -DVSP_USE_SYSTEM_STEPCODE=false \
        -DVSP_USE_SYSTEM_EXPRPARSE=false \
        -DVSP_USE_SYSTEM_TRIANGLE=false

  make

  cd "${srcdir}/build"

  cmake ../${_name}/src \
      -DVSP_LIBRARY_PATH="${srcdir}/buildlibs"

  make

  make package
}

package() {
  cd ${srcdir}/build
  unzip -o "OpenVSP-*-Linux.zip"
  re='OpenVSP-*'
  for dir in ${srcdir}/build/*; do
    [[ $dir =~ $re ]] && { cd "$dir" && break; }
  done

  msg $dir

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
  cp -r vspaero_ex ${pkgdir}/usr/share/${pkgname}
}
