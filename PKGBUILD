# Maintainer:  Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: UnicornDarkness (AUR user)
# PKGBUILD based on original AUR/cpu-x: https://aur.archlinux.org/packages/cpu-x

_realname=CPU-X
_basename=cpu-x
pkgname="${_basename}-opencl"
pkgver=5.0.3
pkgrel=1
pkgdesc='Gathers information on CPU, motherboard, GPU and more (with OpenCL support)'
arch=('i686' 'x86_64')
url="https://thetumultuousunicornofdarkness.github.io/${_realname}"
_repourl="https://github.com/TheTumultuousUnicornOfDarkness/${_realname}"
license=('GPL3')
depends=(
  'dconf'
  'glfw'
  'gtk3'
  'gtkmm3'
  'hicolor-icon-theme'
  'libcpuid>=0.6.0'
  'libgl'
  'ncurses'
  'opencl-icd-loader'
  'pciutils'
  'procps-ng>=4.0.0'
  'vulkan-icd-loader'
)
makedepends=(
  'cmake'
  'nasm'
  'ninja'
  'opencl-headers>=2:2023.02.06'
  'vulkan-headers'
)
optdepends=(
  'opencl-driver: packaged OpenCL driver'
  'opengl-driver: packaged OpenGL driver'
  'vulkan-driver: packaged Vulkan driver'
)
provides=("${_basename}=${pkgver}")
conflicts=("${_basename}")
_tarname="${_basename}-${pkgver}"
source=("${_tarname}.tar.gz::${_repourl}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('d9a29a5303101a6c00d9145265d85acec865833f175246bde550ba2dff24a924c1b2de7579b3d8e20aa163092d269af9bbb24e073585d3e18a2c726e48d9be41')

prepare() {
  cmake -S "${_realname}-${pkgver}" -B build \
    -GNinja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBEXECDIR='lib/cpu-x' \
    -DWITH_GTK=ON \
    -DWITH_NCURSES=ON \
    -DWITH_GETTEXT=ON \
    -DWITH_LIBCPUID=ON \
    -DWITH_LIBPCI=ON \
    -DWITH_LIBGLFW=ON \
    -DWITH_VULKAN=ON \
    -DWITH_OPENCL=ON \
    -DWITH_LIBPROCPS=ON \
    -DWITH_LIBSTATGRAB=OFF \
    -DWITH_DMIDECODE=ON \
    -DWITH_BANDWIDTH=ON \
    -DFORCE_LIBSTATGRAB=OFF
}

build() {
  cmake --build build
}

check() {
  ninja -C build test
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
