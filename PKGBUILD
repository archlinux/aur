#!/usr/bin/env bash
# AUR package script for MayaFlux
# Maintainer: Ranjith Hegde <mayafluxcollective@proton.me>

pkgname=mayaflux
pkgver=0.4.0
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
    'wayland'
    'wayland-protocols'
    'libxkbcommon'
    'dbus'
    'ffmpeg'
    'assimp'
    'stb'
    'hidapi'
    'asio'
    'freetype2'
    'libutf8proc'
    'fontconfig'
    'nlohmann-json'
    'libpipewire'
)
makedepends=(
    'git'
    'ninja'
    'shaderc'
    'ccache'
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
sha256sums=('879b2270db09be676445d4a3a9ae591aca0491cdc568d9451a470e6ac0fe2156')

build() {
    cd "MayaFlux-${pkgver}"
    export CCACHE_SLOPPINESS="pch_defines,time_macros,include_file_mtime,include_file_ctime"
    cmake --preset linux-ship-rel
    cmake --build --preset linux-ship-rel
}

package() {
    cd "MayaFlux-${pkgver}"
    DESTDIR="$pkgdir" cmake --install build --prefix /usr
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    install -d "$pkgdir/etc/profile.d"
    cat > "$pkgdir/etc/profile.d/mayaflux.sh" <<'EOF'
#!/bin/sh
export MAYAFLUX_ROOT="/usr"
export CMAKE_PREFIX_PATH="/usr:$CMAKE_PREFIX_PATH"
EOF
    chmod 755 "$pkgdir/etc/profile.d/mayaflux.sh"

    install -d "$pkgdir/etc/security/limits.d"
    cat > "$pkgdir/etc/security/limits.d/50-mayaflux.conf" <<'EOF'
@mayaflux    -    rtprio     95
@mayaflux    -    memlock    unlimited
@mayaflux    -    nice       -19
EOF
}

post_install() {
    if ! getent group mayaflux > /dev/null 2>&1; then
        groupadd --system mayaflux
    fi

    echo "MayaFlux ${pkgver} installed."
    echo ""
    echo "To enable real-time scheduling, add your user to the mayaflux group:"
    echo "  sudo usermod -aG mayaflux \$USER"
    echo "Then log out and back in."
    echo ""
    echo "Source /etc/profile.d/mayaflux.sh or restart your shell for environment variables."
    echo ""
    echo "Documentation: https://github.com/MayaFlux/MayaFlux"
}

post_upgrade() {
    post_install
}

post_remove() {
    groupdel mayaflux 2>/dev/null || true
    rm -f /etc/security/limits.d/50-mayaflux.conf
    echo "MayaFlux has been removed."
    echo "Remove or edit /etc/profile.d/mayaflux.sh if desired."
}
