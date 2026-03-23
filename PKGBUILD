# Maintainer: Gabriele Musco <gabmus@disroot.org>

pkgname=envision-xr-git
pkgver=3.2.0.r53.gf54b882
pkgrel=1
pkgdesc='GUI for Monado'
arch=(x86_64 aarch64)
url='https://gitlab.com/gabmus/envision'
license=(AGPL-3.0-or-later)
depends=(
    gtk4
    libadwaita
    openxr
    libgl
    libdrm
    vulkan-icd-loader
    wayland
    wayland-protocols
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
    monado-git
    xrizer-git
)
makedepends=(
    meson
    rust
)
optdepends=(
    'opencomposite: legacy alternative to xrizer for openvr compatibility'
)
provides=(envision)
conflicts=(envision)
source=("git+${url}.git")
b2sums=('SKIP')
options=(!lto)

pkgver() {
    cd envision
    (
        set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' \
            || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    arch-meson envision build
    meson compile -C build
}

package() {
    meson install -C build --no-rebuild --destdir "${pkgdir}"
}
