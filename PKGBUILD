# Maintainer: Gabriele Musco <gabmus@disroot.org>

pkgname=envision-xr-git
pkgver=r620.b63b63e
pkgrel=1
pkgdesc='GUI for Monado'
arch=(x86_64 aarch64)
url='https://gitlab.com/gabmus/envision'
license=(GPL)
depends=(
    gtk4
    libadwaita
    openxr
    libgl
    libdrm
    vulkan-icd-loader
    wayland
    xr-hardware
    cmake
    eigen
    git
    ninja
    shaderc
    vulkan-headers
    vte4
    polkit
    base-devel
    jq
    libx11
    libxcb
)
makedepends=(
    meson
    rust
)
optdepends=(
    'libudev0-shim: steamvr_lh lighthouse driver support'
    'monado-vulkan-layers-git: Vulkan layers for NVIDIA users'
)
provides=(envision)
conflicts=(envision)
source=("git+${url}.git")
b2sums=('SKIP')
options+=('!lto')

pkgver() {
    cd envision
    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    arch-meson envision build
    meson compile -C build
}

# check() {
#     meson test -C build --print-errorlogs
# }


package() {
    meson install -C build --destdir "${pkgdir}"

    # We will check for optional packages here:
    # Check for NVIDIA GPU and if monado-vulkan-layers-git is not already installed
    if lspci | grep -qi nvidia && ! pacman -Qm monado-vulkan-layers-git &>/dev/null; then
        printf "\033[0;31m" # red
        echo -e "\n"
        echo "An NVIDIA GPU has been detected on your system."
        echo "For NVIDIA GPU, 'monado-vulkan-layers-git' from the AUR is recommended."
        echo "Please install it manually using an AUR helper, e.g., yay -S monado-vulkan-layers-git"
        printf "\033[0m" # no color
    fi

    # Ask to install libudev0-shim
    if ! pacman -Q libudev0-shim &>/dev/null; then
        printf "\033[0;31m" # red
        echo -e "\n"
        echo "The package 'libudev0-shim' is recommended for lighthouse driver support."
        printf "\033[0m" # no color
    fi
}


