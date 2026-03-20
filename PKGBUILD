#!/usr/bin/env bash
# AUR package script for MayaFlux
# Maintainer: Ranjith Hegde <mayafluxcollective@proton.me>

pkgname=mayaflux
pkgver=0.2.1
pkgrel=1
pkgdesc="Modern C++23 framework for real-time graphics and audio with JIT live coding"
arch=('x86_64')
url="https://github.com/MayaFlux/MayaFlux"
license=('GPLv3')
depends=(
    'llvm'
    'llvm-libs'
    'clang'
    'cmake'
    'pkg-config'
    'rtaudio'
    'glfw'
    'glm'
    'eigen'
    'spirv-headers'
    'spirv-tools'
    'spirv-cross'
    'vulkan-headers'
    'vulkan-icd-loader'
    'vulkan-tools'
    'vulkan-utility-libraries'
    'vulkan-validation-layers'
    'ffmpeg'
    'hidapi'
    'rtmidi'
    'stb'
    'magic_enum'
)
makedepends=(
    'git'
    'ninja'
    'wayland'
    'wayland-utils'
)
optdepends=(
    'doxygen: for documentation generation'
    'vulkan-extra-layers: additional Vulkan layers'
    'vulkan-extra-tools: additional Vulkan tools'
)
provides=('mayaflux')
conflicts=('mayaflux-bin' 'mayaflux-dev-bin')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/MayaFlux/MayaFlux/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3cfdb7ae14afe18141a3072a362159cb68fd717d2d7e4a02cab551f8c4707a02')

build() {
    cd "MayaFlux-${pkgver}"

    cmake -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_CXX_STANDARD=23

    cmake --build build
}

package() {
    cd "MayaFlux-${pkgver}"

    DESTDIR="$pkgdir" cmake --install build

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    install -d "$pkgdir/etc/profile.d"
    cat >"$pkgdir/etc/profile.d/mayaflux.sh" <<'EOF'
export MAYAFLUX_ROOT="/usr"
export CMAKE_PREFIX_PATH="/usr:${CMAKE_PREFIX_PATH}"
EOF
    chmod 644 "$pkgdir/etc/profile.d/mayaflux.sh"
}

post_install() {
    echo "MayaFlux development version ${pkgver} installed successfully!"
    echo ""
    echo "Environment variables have been set in /etc/profile.d/mayaflux.sh"
    echo "You may need to restart your shell or run:"
    echo "  source /etc/profile.d/mayaflux.sh"
    echo ""
    echo "Documentation: https://github.com/MayaFlux/MayaFlux"
}

post_upgrade() {
    post_install
}

post_remove() {
    echo "MayaFlux has been removed. You may want to clean up your environment variables."
    echo "Remove or edit /etc/profile.d/mayaflux.sh if desired."
}
