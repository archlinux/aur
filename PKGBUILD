# Maintainer: Yousif Haider <asd22.info@gmail.com>
pkgname=fastfetch-gif-git
pkgver=2.42.0
pkgrel=2
pkgdesc="GIF support for fastfetch (Kitty Image Protocol Only!)"
arch=(x86_64 i686 pentium4 armv7h aarch64 riscv64)
url="https://github.com/neoapps-dev/fastfetch-gif-support"
license=(MIT)
depends=(glibc gcc-libs yyjson)
makedepends=(
  chafa
  cmake
  dbus
  dconf
  ddcutil
  directx-headers
  git
  imagemagick
  libnm
  libpulse
  libxcb
  libxrandr
  mesa
  ocl-icd
  opencl-headers
  vulkan-headers
  vulkan-icd-loader
  wayland
  xfconf
  zlib
)
optdepends=(
  'chafa: Image output as ascii art'
  'dbus: Bluetooth, Player & Media detection'
  'dconf: Needed for values that are only stored in DConf + Fallback for GSettings'
  'ddcutil: Brightness detection of external displays'
  'directx-headers: GPU detection in WSL'
  'glib2: Output for values that are only stored in GSettings'
  'imagemagick: Image output using sixel or kitty graphics protocol'
  'libnm: Wifi detection'
  'libpulse: Sound detection'
  'mesa: Needed by the OpenGL module for gl context creation.'
  'libxrandr: Multi monitor support'
  'ocl-icd: OpenCL module'
  'hwdata: GPU output'
  'vulkan-icd-loader: Vulkan module & fallback for GPU output'
  'xfconf: Needed for XFWM theme and XFCE Terminal font'
  'zlib: Faster image output when using kitty graphics protocol'
  'libdrm: Displays detection'
)
provides=(fastfetch)
conflicts=(fastfetch)
source=("git+https://github.com/neoapps-dev/fastfetch-gif-support.git#branch=dev")
sha256sums=("SKIP")

build() {
  cmake -B build -S "fastfetch-gif-support" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTS=ON \
    -DENABLE_SQLITE3=OFF \
    -DENABLE_RPM=OFF \
    -DENABLE_IMAGEMAGICK6=OFF \
    -DENABLE_SYSTEM_YYJSON=ON

  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -D fastfetch-gif-support/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
