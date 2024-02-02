# PKGBUILD based on the official Arch gamescope PKGBUILD
# Maintainer - Sid Pranjale <sidpranjale127@protonmail.com>

# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Samuel "scrufulufugus" Monson <smonson@irbash.net>
# Contributor: PedroHLC <root@pedrohlc.com>

_pkgname=gamescope
pkgname=${_pkgname}-git
pkgver=3.14.0.r6.g9e46c89
pkgrel=1
pkgdesc='SteamOS session compositing window manager'
arch=(x86_64)
url=https://github.com/ValveSoftware/gamescope
license=(BSD)
depends=(
    gcc-libs
    glibc
    glm
    libcap
    libdrm
    libpipewire-0.3.so
    libvulkan.so
    libx11
    libxcb
    libxcomposite
    libxdamage
    libxext
    libxfixes
    libxkbcommon
    libxmu
    libxrender
    libxres
    libxtst
    libxxf86vm
    sdl2
    vulkan-icd-loader
    wayland
    xorg-server-xwayland
)
makedepends=(
    benchmark
    git
    glslang
    meson
    ninja
    vulkan-headers
    wayland-protocols
)
source=(
    git+https://github.com/ValveSoftware/gamescope.git
)
b2sums=('SKIP')
provides=("$_pkgname")
conflicts=("$_pkgname")

prepare() {
    cd $_pkgname
    git submodule update --init --recursive --depth=1
    git -c protocol.file.allow=always submodule update
}

pkgver() {
    cd $_pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $_pkgname
    meson build \
        -Dforce_fallback_for=stb \
        -Dpipewire=enabled
    ninja -C build
}

package() {
    DESTDIR="${pkgdir}" meson install -C $_pkgname/build \
        --skip-subprojects
    install -Dm 644 $_pkgname/LICENSE -t "${pkgdir}"/usr/share/licenses/gamescope/
}

# vim: ts=2 sw=2 et:
