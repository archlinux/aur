# Maintainer: Linus Dierheimer <Linus@Dierheimer.de>

pkgname=fastfetch-git
pkgver=r543.322e5c5
pkgrel=1
pkgdesc="Like neofetch, but much faster because written in c"
arch=("any")
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
  "xfconf: XFWM theme + xfce-terminal font"
  # "rpm-tools: rpm package count"
)
_provides_and_conflicts=(
  "fastfetch"
  "fastfetch-garuda"
  "flashfetch"
)
provides=("${_provides_and_conflicts[@]}")
conflicts=("${_provides_and_conflicts[@]}")
source=("git+https://github.com/LinusDierheimer/fastfetch.git")
sha256sums=("SKIP")

pkgver() {
  cd "fastfetch/"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build()
{
    cd "${srcdir}/fastfetch"
    mkdir -p build/
    cd build/
    cmake ..
    cmake --build . --target fastfetch # don't build flashfetch, as it is meant to be configured at compile time. So it doesn't make sense to pre build it.
}

package() {
    cd ${srcdir}/fastfetch

    install -D "build/fastfetch" "${pkgdir}/usr/bin/fastfetch"
    install -D "completions/bash" "${pkgdir}/usr/share/bash-completion/completions/fastfetch"

    install -Dd "${pkgdir}/usr/share/fastfetch/presets/"
    for file in presets/*; do
      install -D "$file" "${pkgdir}/usr/share/fastfetch/presets/"
    done
}
