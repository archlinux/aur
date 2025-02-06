# Maintainer: rpx <rpx at clearlight dot systems>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
pkgname=openvsp
pkgdesc='A parametric aircraft geometry tool'
pkgver=3.42.2
pkgrel=1
arch=('i686' 'x86_64')
url='https://openvsp.org'
license=('NASA OPEN SOURCE AGREEMENT VERSION 1.3')
depends=(
  'cblas'
  'cminpack'
  'freeglut'
  'gcc'
  'git'
  'glew'
  'libxml2'
  'pandoc')
optdepends=(
  'doxygen: generate documentation'
  'graphviz: generate documentation'
  'python: python API module'
  'swig: build interface to APIs')
makedepends=('cmake' 'unzip')

#_name=OpenVSP-main
_name=OpenVSP-OpenVSP_${pkgver}

#source=("${pkgname}-${pkgver}.zip"::"https://github.com/rpxpx/OpenVSP/archive/refs/heads/main.zip")
#sha256sums=('d3bcdacb23d62f0ceb94356adb332a1512b8c8c2173f43955092b4bb2bab8601')

source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/OpenVSP/OpenVSP/archive/OpenVSP_${pkgver}.tar.gz")
sha256sums=('b36e9d6dc9044a7a49b24cfc5cd6f38c7870bbc119eafbd64da004ae8b2d9107')

prepare() {
  cd "${srcdir}/${_name}"
}

build() {
  # Create a build directory
  mkdir -p "${srcdir}/build"
  mkdir -p "${srcdir}/buildlibs"

  cd "${srcdir}/buildlibs"

  cmake ../${_name}/Libraries \
        -DCMAKE_PREFIX_PATH='/usr' \
        -DVSP_USE_SYSTEM_ADEPT2=false \
        -DVSP_USE_SYSTEM_CLIPPER2=false \
        -DVSP_USE_SYSTEM_CMINPACK=false \
        -DVSP_USE_SYSTEM_CODEELI=false \
        -DVSP_USE_SYSTEM_CPPTEST=false \
        -DVSP_USE_SYSTEM_DELABELLA=false \
        -DVSP_USE_SYSTEM_EIGEN=false \
        -DVSP_USE_SYSTEM_EXPRPARSE=false \
        -DVSP_USE_SYSTEM_FLTK=false \
        -DVSP_USE_SYSTEM_GLEW=true \
        -DVSP_USE_SYSTEM_GLM=false \
        -DVSP_USE_SYSTEM_LIBIGES=false \
        -DVSP_USE_SYSTEM_LIBXML2=true \
        -DVSP_USE_SYSTEM_OPENABF=false \
        -DVSP_USE_SYSTEM_PINOCCHIO=false \
        -DVSP_USE_SYSTEM_STEPCODE=false \
        -DVSP_USE_SYSTEM_TRIANGLE=false

  make -j8

  cd "${srcdir}/build"

  cmake ../${_name}/src \
      -DVSP_LIBRARY_PATH="${srcdir}/buildlibs" \
      -DCMAKE_BUILD_TYPE=Release

  make -j8

  make package
}

package() {
  cd ${srcdir}/build
  unzip "OpenVSP-${pkgver}-Linux.zip"
  cd "OpenVSP-${pkgver}-Linux"

  mkdir -p ${pkgdir}/usr/share/${pkgname}

  # binaries
  cp vsp vspaero vspscript vsploads vspaero_adjoint vspaero_complex vspaero_opt vspviewer \
    ${pkgdir}/usr/share/${pkgname}
 
  # misc
  cp README.md ${pkgdir}/usr/share/${pkgname}
  cp LICENSE ${pkgdir}/usr/share/${pkgname}
  cp vspIcon.png ${pkgdir}/usr/share/${pkgname}
  cp -r airfoil ${pkgdir}/usr/share/${pkgname}
  cp -r CustomScripts ${pkgdir}/usr/share/${pkgname}
  cp -r help ${pkgdir}/usr/share/${pkgname}
  cp -r matlab ${pkgdir}/usr/share/${pkgname}
  cp -r python ${pkgdir}/usr/share/${pkgname}
  cp -r scripts ${pkgdir}/usr/share/${pkgname}
  cp -r textures ${pkgdir}/usr/share/${pkgname}
  cp -r vspaero_ex ${pkgdir}/usr/share/${pkgname}

  # binary symlinks, relative
  mkdir -p ${pkgdir}/usr/bin
  cd ${pkgdir}/usr/share/${pkgname}
  ln -sr vsp vspaero vspscript vsploads vspaero_adjoint vspaero_complex vspaero_opt vspviewer \
    ${pkgdir}/usr/bin/
}
