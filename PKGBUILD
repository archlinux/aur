# Maintainer: Linus Dierheimer <Linus@Dierheimer.de>

pkgname=fastfetch-git
pkgver=1.9.1.r25.gb0c1925
pkgrel=1
pkgdesc="Like neofetch, but much faster because written in c"
arch=("x86_64" "i686" "pentium4" "armv5" "armv6h" "armv7h" "aarch64" "riscv64")
url="https://github.com/LinusDierheimer/fastfetch"
license=("MIT")

depends=(
  "glibc"
)
makedepends=(
  "git"
  "cmake"
  "chafa"
  "dbus"
  "dconf"
  "glib2"
  "imagemagick"
  "libnm"
  "libpulse"
  "libx11"
  "libxcb"
  "libxrandr"
  "mesa"
  "ocl-icd"
  "opencl-headers"
  "pciutils"
  "vulkan-headers"
  "vulkan-icd-loader"
  "wayland"
  "xfconf"
  "zlib"
)
optdepends=(
  "chafa: Image output as ascii art"
  "dbus: Bluetooth, Media & Player modules"
  "dconf: Output for values that are only stored in DConf"
  "glib2: Output for values that are only stored in GSettings"
  "imagemagick: Image output using sixel or kitty graphics protocol"
  "libdrm: Improved AMD GPU output"
  "libnm: Better wifi support"
  "libpulse: Sound module"
  "libx11: Improved X11 support (resolution)"
  "libxcb: Improved X11 support (resolution + multi monitor)" 
  "libxrandr: Improved X11 support (resolution + multi monitor)"
  "mesa: OpenGL module"
  "nix: self contained nix package count"
  "ocl-icd: OpenCL module"
  "pciutils: GPU module"
  "vulkan-icd-loader: Vulkan module & GPU module fallback"
  "wayland: Improved Wayland support (resolution + multi monitor)"
  "xfconf: XFWM theme + xfce-terminal font"
  "zlib: Faster image output when using kitty graphics protocol"
)

_provides_and_conflicts=(
  "fastfetch"
)
provides=("${_provides_and_conflicts[@]}")
conflicts=("${_provides_and_conflicts[@]}")

_src_dir="${pkgname}"
source=("${_src_dir}::git+https://github.com/LinusDierheimer/fastfetch.git#branch=dev")
sha256sums=("SKIP")

backup=("etc/fastfetch/config.conf")

_build_dir="build"

pkgver() {
  cd "${_src_dir}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake \
    -B "${_build_dir}" \
    -S "${_src_dir}" \
    -DCMAKE_BUILD_TYPE='RelWithDebInfo' \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTS='ON' \
    -DENABLE_SQLITE3=OFF \
    -DENABLE_RPM=OFF \
    -DENABLE_IMAGEMAGICK6=OFF \
    -DENABLE_LIBCJSON=OFF \
    -Wno-dev

  cmake \
    --build "${_build_dir}"
}

check() {
  ctest --test-dir "${_build_dir}" --output-on-failure
}

package() {
  DESTDIR="${pkgdir}" \
  cmake \
    --install "${_build_dir}"
}
