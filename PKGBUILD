# Maintainer: Gabriele Musco <gabmus@disroot.org>

pkgname=envision-xr-git
pkgver=r398.35b0ab9
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
)
makedepends=(
    meson
    rust
)
optdepends=(
    'libudev0-shim: steamvr_lh lighthouse driver support'
)
provides=(envision)
conflicts=(envision)
source=("git+${url}.git")
b2sums=('SKIP')
options=(!lto)

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
}
