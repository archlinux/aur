# Maintainer: Christoph Haag <christoph.haag@collabora.com>
 
pkgname="monado-git"
_dirname="monado"
pkgver=21.0.0.r4339.gfcdc20645
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
  cd "$_dirname"
  cmake \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_PREFIX=/usr/ \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -GNinja -B"$srcdir"/"$_dirname"-build
  ninja -C "$srcdir"/"$_dirname"-build
}

package() {
  cd "$_dirname"-build
  DESTDIR="$pkgdir" ninja install
}
