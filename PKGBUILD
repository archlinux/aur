# Maintainer: Linus Dierheimer <Linus@Dierheimer.de>

pkgname=fastfetch-git
pkgver=1.2.3.r25.g6accb58
pkgrel=1
pkgdesc="Like neofetch, but much faster because written in c"
arch=("x86_64" "i686" "pentium4" "armv5" "armv6h" "armv7h" "aarch64")
url="https://github.com/LinusDierheimer/fastfetch"
license=("MIT")

depends=()
makedepends=(
  "git"
  "cmake"
  "pciutils"
  "vulkan-headers"
  "vulkan-icd-loader"
  "wayland"
  "libxcb"
  "libxrandr" # Depends on libX11, which headers are also needed
  "dconf"     # Depends on glib2, which headers are also needed
  "imagemagick"
  "zlib"
  "dbus"
  "xfconf"
  # "libmagick6"
  # "rpm-tools"
)
optdepends=(
  "pciutils: GPU output"
  "vulkan-icd-loader: GPU fallback"
  "wayland: Improved Wayland support (resolution + multi monitor)"
  "libxcb: Improved X11 support (resolution + multi monitor)" 
  "libx11: Improved X11 support (resolution)"
  "libxrandr: Improved X11 support (resolution + multi monitor)"
  "glib2: Output for values that are only stored in GSettings"
  "dconf: Output for values that are only stored in DConf"
  "dbus: Media player and song output"
  "imagemagick: Image output using sixel or kitty graphics protocol"
  "zlib: Faster image output when using kitty graphics protocol"
  "xfconf: XFWM theme + xfce-terminal font"
  # "libmagick6: ImageMagick 6 support" 
  # "rpm-tools: rpm package count"
)

_provides_and_conflicts=(
  "fastfetch"
)
provides=("${_provides_and_conflicts[@]}")
conflicts=("${_provides_and_conflicts[@]}")

_src_dir="${pkgname}"
source=("${_src_dir}::git+https://github.com/LinusDierheimer/fastfetch.git")
sha256sums=("SKIP")

_build_dir="build"

pkgver() {
  cd "${_src_dir}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake \
    -B "${_build_dir}" \
    -S "${_src_dir}" \
    -DENABLE_RPM=OFF \
    -DENABLE_IMAGEMAGICK6=OFF \
    -Wno-dev

  cmake \
    --build "${_build_dir}" \
    --target fastfetch \
    --target flashfetch
}

package() {
  cmake \
    --install "${_build_dir}" \
    --prefix "${pkgdir}/usr"
}
