# Maintainer: Linus Dierheimer <Linus@Dierheimer.de>

pkgname=fastfetch-git
pkgver=r641.d647f9e
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
  "dbus"
  "xfconf"
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
  "xfconf: XFWM theme + xfce-terminal font"
  # "rpm-tools: rpm package count"
)

_provides_and_conflicts=(
  "fastfetch"
)
provides=("${_provides_and_conflicts[@]}")
conflicts=("${_provides_and_conflicts[@]}")

source=("${pkgname}::git+https://github.com/LinusDierheimer/fastfetch.git")
sha256sums=("SKIP")

_src_dir="${pkgname}"
_build_dir="build"

pkgver() {
  cd "${_src_dir}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -B "${_build_dir}" -S "${_src_dir}" -Wno-dev
  cmake --build "${_build_dir}" --target fastfetch # don't build flashfetch, as it is meant to be configured at compile time. So it doesn't make sense to pre build it.
}

package() {
  cmake --install "${_build_dir}" --prefix "${pkgdir}/usr"
}
