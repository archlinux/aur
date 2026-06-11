#!/usr/bin/env bash
# AUR package script for MayaFlux-dev
# Maintainer: Ranjith Hegde <mayafluxcollective@proton.me>

pkgname=mayaflux-dev-bin
pkgver=0.4.0
pkgrel=2
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
)
optdepends=(
    'doxygen: for documentation generation'
    'vulkan-extra-layers: additional Vulkan layers'
    'vulkan-extra-tools: additional Vulkan tools'
)
provides=('MayaFlux')
conflicts=('MayaFlux')
source=(
    "MayaFlux-${pkgver}-dev-linux-arch.tar.gz::https://github.com/MayaFlux/MayaFlux/releases/download/v${pkgver}-dev/MayaFlux-${pkgver}-dev-linux-arch.tar.gz"
    "MayaFlux-${pkgver}-dev-linux-arch.tar.gz::https://github.com/MayaFlux/MayaFlux/releases/download/v${pkgver}-dev/MayaFlux-${pkgver}-dev-linux-arch.tar.gz.sha256"
)
sha256sums=('SKIP' 'SKIP')

prepare() {
    echo "Verifying package integrity..."

    local expected_sha=$(cat "MayaFlux-${pkgver//_/-}-linux-arch.tar.gz.sha256")

    local actual_sha=$(sha256sum "MayaFlux-${pkgver//_/-}-linux-arch.tar.gz" | cut -d' ' -f1)

    echo "Expected SHA256: $expected_sha"
    echo "Actual SHA256:   $actual_sha"

    if [[ "$expected_sha" != "$actual_sha" ]]; then
        error "SHA256 verification failed!"
        error "Expected: $expected_sha"
        error "Actual:   $actual_sha"
        return 1
    fi

    echo "✅ SHA256 verification passed"
}

package() {
    install -d "$pkgdir/usr/lib"
    install -d "$pkgdir/usr/include"
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/share/MayaFlux"
    install -d "$pkgdir/usr/share/licenses/$pkgname"

    local extract_dir="${srcdir}/MayaFlux-${pkgver}-dev-extracted"
    mkdir -p "$extract_dir"
    tar -xzf "${srcdir}/MayaFlux-${pkgver}-dev-linux-arch.tar.gz" -C "$extract_dir"

    [[ -d "$extract_dir/lib" ]]     && cp -r "$extract_dir/lib/"*     "$pkgdir/usr/lib/"
    [[ -d "$extract_dir/include" ]] && cp -r "$extract_dir/include/"* "$pkgdir/usr/include/"
    [[ -d "$extract_dir/bin" ]]     && cp -r "$extract_dir/bin/"*     "$pkgdir/usr/bin/"
    [[ -d "$extract_dir/share" ]]   && cp -r "$extract_dir/share/"*   "$pkgdir/usr/share/"

    if [[ -f "$extract_dir/LICENSE" ]]; then
        install -Dm644 "$extract_dir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi

    if [[ -f "$extract_dir/README.md" ]]; then
        install -Dm644 "$extract_dir/README.md" "$pkgdir/usr/share/MayaFlux/README.md"
    fi

    install -d "$pkgdir/etc/profile.d"
    cat > "$pkgdir/etc/profile.d/mayaflux.sh" <<'EOF'
#!/bin/sh
export MAYAFLUX_ROOT="/usr"
export CMAKE_PREFIX_PATH="/usr:$CMAKE_PREFIX_PATH"
EOF
    chmod 755 "$pkgdir/etc/profile.d/mayaflux.sh"

    if [[ -f "$pkgdir/usr/lib/pkgconfig/MayaFlux.pc" ]]; then
        sed -i 's|^prefix=.*|prefix=/usr|' "$pkgdir/usr/lib/pkgconfig/MayaFlux.pc"
    fi

    find "$pkgdir/usr/lib" -type f -name "*.so*" -exec chmod 755 {} \;
    find "$pkgdir/usr/bin" -type f -exec chmod 755 {} \;

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
    echo "To enable real-time audio scheduling, add your user to the mayaflux group:"
    echo "  sudo usermod -aG mayaflux \$USER"
    echo "Then log out and back in."
    echo ""
    echo "Source /etc/profile.d/mayaflux.sh or restart your shell for environment variables."
}

post_upgrade() {
    post_install
}

post_remove() {
    groupdel mayaflux 2>/dev/null || true
    rm -f /etc/security/limits.d/50-mayaflux.conf
    echo "MayaFlux has been removed. You may want to clean up your environment variables."
    echo "Remove or edit /etc/profile.d/mayaflux.sh if desired."
}
