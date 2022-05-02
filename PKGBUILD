# Maintainer: Christoph Haag <christoph.haag@collabora.com>
 
pkgname="monado-git"
_dirname="monado"
pkgver=21.0.0.r1747.g7a039543d
pkgrel=1
pkgdesc='The open source OpenXR runtime.'
arch=('i686' 'x86_64')
url='https://monado.dev'
depends=('openxr' 'vulkan-icd-loader' 'libgl' 'wayland' 'xr-hardware' 'libcap' 'libbsd' 'libdrm')
#'doxygen' #When building docs
makedepends=('eigen' 'ninja' 'shaderc' 'cmake' 'git' 'vulkan-headers')
optdepends=('libuvc: optical tracking support'
            'opencv: optical tracking support'
            'onnxruntime: optical hand tracking support'
            'librealsense: intel realsense camera support'
            'libsurvive-git: lighthouse positional tracking support'
            'openhmd: additional hardware support (Oculus Rift, Nolo)'
            'basalt-monado-git: experimental SLAM tracking through basalt'
            'kimera-vio-monado-git: experimental SLAM tracking through kimera'
            'percetto: tracing support for performance debugging')
provides=("openxr-runtime" "monado")
install=monado.install

license=('boost')
source=("$_dirname::git+https://gitlab.freedesktop.org/monado/monado.git#branch=main")
md5sums=('SKIP')

#options=('debug' '!strip')

pkgver() {
  cd "$_dirname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  cd "$_dirname"
}

build() {

  BASALT_EIGEN_INCLUDE=""
  BASALT_C_FLAGS=""
  BASALT_CXX_FLAGS=""

  # If compiling with basalt support, we have to use basalt's eigen version
  # https://gitlab.freedesktop.org/mateosss/basalt#monado-specifics
  if [ -d "/usr/share/basalt/thirdparty/eigen" ]
  then
      echo "Found eigen headers form basalt. Using them and compiling for march=native..."
      BASALT_EIGEN_INCLUDE="-DEIGEN3_INCLUDE_DIR=/usr/share/basalt/thirdparty/eigen"
      BASALT_C_FLAGS="-DCMAKE_C_FLAGS=-march=native"
      BASALT_CXX_FLAGS="-DCMAKE_CXX_FLAGS=-march=native"
  else
      echo "Using system eigen."
  fi

  cd "$_dirname"
  cmake $BASALT_EIGEN_INCLUDE $BASALT_C_FLAGS $BASALT_CXX_FLAGS \
    -DCMAKE_LIBDIR=lib \
    -DCMAKE_INSTALL_PREFIX=/usr/ \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -GNinja -B"$srcdir"/"$_dirname"-build
  ninja -C "$srcdir"/"$_dirname"-build
}

package() {
  cd "$_dirname"-build
  DESTDIR="$pkgdir" ninja install
}
