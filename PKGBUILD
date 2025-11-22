#!/usr/bin/env bash
# AUR package script for MayaFlux-dev
# Maintainer: Ranjith Hegde <mayafluxcollective@proton.me>

pkgname=mayaflux-dev-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="MayaFlux development build - A modern C++ framework for real-time graphics and audio"
arch=('x86_64' 'aarch64')
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
    'vulkan-headers'
    'vulkan-icd-loader'
    'vulkan-tools'
    'vulkan-utility-libraries'
    'vulkan-validation-layers'
    'ffmpeg'
    'stb'
    'magic_enum'
)
makedepends=(
    'git'
)
optdepends=(
    'doxygen: for documentation generation'
    'vulkan-extra-layers: additional Vulkan layers'
    'vulkan-extra-tools: additional Vulkan tools'
)
provides=('MayaFlux')
conflicts=('MayaFlux')
source=("MayaFlux-${pkgver}-dev-Linux.tar.gz::https://github.com/MayaFlux/MayaFlux/releases/download/v${pkgver}-dev/MayaFlux-${pkgver}-dev-Linux.tar.gz")
sha256sums=('ef048fce1072f367558ec63f3e51ff066a27c545a7718ecfd73c552d6d70b449')

prepare() {
    echo "Preparing MayaFlux development build..."
}

package() {
    cd "$srcdir"

    # Create directory structure
    install -d "$pkgdir/usr/lib"
    install -d "$pkgdir/usr/include"
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/share/MayaFlux"
    install -d "$pkgdir/usr/share/licenses/$pkgname"

    # Extract the pre-built tarball
    if [ -f "MayaFlux-${pkgver}-dev-Linux.tar.gz" ]; then
        tar -xzf "MayaFlux-${pkgver}-dev-Linux.tar.gz" -C "$srcdir"
    fi

    # Copy files from extracted package
    if [ -d "MayaFlux-${pkgver}-dev" ]; then
        cd "MayaFlux-${pkgver}-dev"

        # Copy libraries
        if [ -d "lib" ]; then
            cp -r lib/* "$pkgdir/usr/lib/"
        fi

        # Copy headers
        if [ -d "include" ]; then
            cp -r include/* "$pkgdir/usr/include/"
        fi

        # Copy binaries
        if [ -d "bin" ]; then
            cp -r bin/* "$pkgdir/usr/bin/"
        fi

        # Copy share content
        if [ -d "share" ]; then
            cp -r share/* "$pkgdir/usr/share/MayaFlux/"
        fi

        # Copy license if available
        if [ -f "LICENSE" ]; then
            install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
        elif [ -f "LICENSE.txt" ]; then
            install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
        fi

        # Copy README if available
        if [ -f "README.md" ]; then
            install -Dm644 README.md "$pkgdir/usr/share/MayaFlux/README.md"
        fi
    else
        echo "ERROR: Extracted MayaFlux directory not found"
        return 1
    fi

    # Create environment setup file
    install -d "$pkgdir/etc/profile.d"
    cat >"$pkgdir/etc/profile.d/mayaflux.sh" <<'EOF'
#!/bin/sh
# MayaFlux environment configuration

export MAYAFLUX_ROOT="/usr"
export CMAKE_PREFIX_PATH="/usr:$CMAKE_PREFIX_PATH"
EOF

    chmod 755 "$pkgdir/etc/profile.d/mayaflux.sh"

    # Create pkg-config file if needed
    if [ -f "$pkgdir/usr/lib/pkgconfig/MayaFlux.pc" ]; then
        # Fix paths in pkg-config file if necessary
        sed -i 's|^prefix=.*|prefix=/usr|' "$pkgdir/usr/lib/pkgconfig/MayaFlux.pc"
    fi

    # Fix permissions
    find "$pkgdir/usr/lib" -type f -name "*.so*" -exec chmod 755 {} \;
    find "$pkgdir/usr/bin" -type f -exec chmod 755 {} \;
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
