# Maintainer: Christoph Haag <christoph.haag@collabora.com>
 
pkgname="monado-git"
_dirname="monado"
pkgver=25.0.0.r227.g0d513229f
pkgrel=1
pkgdesc='The open source OpenXR runtime.'
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
  cmake \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_PREFIX=/usr/ \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -GNinja -B"$srcdir"/"$_dirname"-build \
    -DXRT_HAVE_SYSTEM_CJSON:BOOL='OFF' \

  ninja -C "$srcdir"/"$_dirname"-build
}

package() {
  cd "$_dirname"-build
  DESTDIR="$pkgdir" ninja install
}
