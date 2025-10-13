# Maintainer: Christoph Haag <christoph.haag@collabora.com>
 
pkgname="monado-multilib-git"
_dirname="monado"
pkgver=25.0.0.r317.gbf6080c3b
pkgrel=1
pkgdesc='The open source OpenXR runtime. (32 bit support)'
arch=('i686' 'x86_64')
url='https://monado.dev'
depends=('openxr' 'vulkan-icd-loader' 'libgl' 'wayland' 'xr-hardware' 'libcap' 'libbsd' 'libdrm' 'openvr')
conflicts=('monado')
#'doxygen' #When building docs
makedepends=('eigen' 'ninja' 'shaderc' 'cmake' 'git' 'vulkan-headers' 'python' 'wayland-protocols')
optdepends=('libuvc: optical tracking support (must be present at build time)'
            'opencv: optical tracking support (must be present at build time)'
            'onnxruntime: optical hand tracking support (must be present at build time)'
            'librealsense: intel realsense camera support (must be present at build time)'
            'libsurvive-git: lighthouse positional tracking support (must be present at build time)'
            'openhmd: additional hardware support (Oculus Rift, Nolo) (must be present at build time)'
            'basalt-monado-git: experimental SLAM tracking through basalt'
            'percetto: tracing support for performance debugging (must be present at build time)')
provides=("openxr-runtime" "monado=${pkgver}")
install=monado.install

license=('BSL-1.0')
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
  cd "$_dirname"

  # 64-bit build with server
  cmake \
    -B"$srcdir"/"$_dirname"-build64 \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_PREFIX=/usr/ \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DXRT_HAVE_SYSTEM_CJSON:BOOL='OFF' \
    -DXRT_FEATURE_STEAMVR_PLUGIN=OFF \
    -DXRT_OPENXR_INSTALL_ABSOLUTE_RUNTIME_PATH=OFF \
    -DXRT_OPENXR_INSTALL_MANIFEST_RELATIVE_RUNTIME_PATH=OFF \
    -GNinja
  cmake --build "$srcdir"/"$_dirname"-build64

  # 32-bit build
  export PKG_CONFIG_PATH="/usr/lib/pkgconfig"
  export LDFLAGS="-m32 ${LDFLAGS}"
  cmake \
    -B"$srcdir"/"$_dirname"-build32 \
    -DXRT_OPENXR_INSTALL_ABSOLUTE_RUNTIME_PATH=OFF \
    -DXRT_OPENXR_INSTALL_MANIFEST_RELATIVE_RUNTIME_PATH=OFF \
    -DXRT_MODULE_AUX_VIVE=OFF \
    -DXRT_MODULE_COMPOSITOR=ON \
    -DXRT_MODULE_COMPOSITOR_MAIN=OFF \
    -DXRT_MODULE_COMPOSITOR_NULL=ON \
    -DXRT_MODULE_IPC=ON \
    -DXRT_MODULE_MONADO_GUI=OFF \
    -DXRT_MODULE_MONADO_CLI=OFF \
    -DXRT_MODULE_OPENXR_STATE_TRACKER=ON \
    -DXRT_FEATURE_STEAMVR_PLUGIN=OFF \
    -DXRT_FEATURE_SERVICE=OFF \
    -DXRT_FEATURE_CLIENT_WITHOUT_SERVICE=ON \
    -DXRT_BUILD_DRIVER_ARDUINO=OFF \
    -DXRT_BUILD_DRIVER_BLUBUR_S1=OFF \
    -DXRT_BUILD_DRIVER_DAYDREAM=OFF \
    -DXRT_BUILD_DRIVER_EUROC=OFF \
    -DXRT_BUILD_DRIVER_HDK=OFF \
    -DXRT_BUILD_DRIVER_HYDRA=OFF \
    -DXRT_BUILD_DRIVER_NS=OFF \
    -DXRT_BUILD_DRIVER_OHMD=OFF \
    -DXRT_BUILD_DRIVER_OPENGLOVES=OFF \
    -DXRT_BUILD_DRIVER_PSMV=OFF \
    -DXRT_BUILD_DRIVER_PSSENSE=OFF \
    -DXRT_BUILD_DRIVER_PSVR=OFF \
    -DXRT_BUILD_DRIVER_QWERTY=OFF \
    -DXRT_BUILD_DRIVER_REMOTE=OFF \
    -DXRT_BUILD_DRIVER_RIFT=OFF \
    -DXRT_BUILD_DRIVER_RIFT_S=OFF \
    -DXRT_BUILD_DRIVER_ROKID=OFF \
    -DXRT_BUILD_DRIVER_SIMULATED=OFF \
    -DXRT_BUILD_DRIVER_STEAMVR_LIGHTHOUSE=OFF \
    -DXRT_BUILD_DRIVER_TWRAP=OFF \
    -DXRT_BUILD_DRIVER_VF=OFF \
    -DXRT_BUILD_DRIVER_VIVE=OFF \
    -DXRT_BUILD_DRIVER_WMR=OFF \
    -DXRT_BUILD_DRIVER_XREAL_AIR=OFF \
    -DXRT_BUILD_SAMPLES=OFF \
    -DXRT_HAVE_SYSTEM_CJSON:BOOL='OFF' \
    -DXRT_HAVE_OPENCV:BOOL='OFF' \
    -DXRT_HAVE_OPENVR:BOOL='OFF' \
    -DBUILD_TESTING='OFF' \
    -DCMAKE_INSTALL_LIBDIR=lib32 \
    -DCMAKE_INSTALL_PREFIX=/usr/ \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_C_FLAGS='-m32' \
    -DCMAKE_CXX_FLAGS='-m32' \
    -DVulkan_LIBRARY=/usr/lib32/libvulkan.so \
    -DVulkan_INCLUDE_DIR=/usr/include \
    -GNinja
  cmake --build "$srcdir"/"$_dirname"-build32
}

package() {
  cd "$_dirname"-build32
  DESTDIR="$pkgdir" ninja install
  rm -rf "$pkgdir"/usr/share/openxr
  cd ../"$_dirname"-build64
  DESTDIR="$pkgdir" ninja install
}
