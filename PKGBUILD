#!/usr/bin/env bash
# AUR package script for MayaFlux (prebuilt release binaries)
# Maintainer: Ranjith Hegde <mayafluxcollective@proton.me>

pkgname=mayaflux-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Modern C++23 framework for real-time graphics and audio with JIT live coding (prebuilt release)"
arch=('x86_64')
url="https://github.com/MayaFlux/MayaFlux"
license=('GPL-3.0-or-later' 'Apache-2.0' 'BSD-3-Clause' 'MIT')
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
    'alembic'
    'stb'
    'hidapi'
    'asio'
    'freetype2'
    'libutf8proc'
    'fontconfig'
    'nlohmann-json'
    'libpipewire'
    'alsa-lib'
    'tbb'
    'shaderc'
)
optdepends=(
    'doxygen: for documentation generation'
    'vulkan-extra-layers: additional Vulkan layers'
    'vulkan-extra-tools: additional Vulkan tools'
)
provides=("mayaflux=${pkgver}")
conflicts=('mayaflux' 'mayaflux-dev-bin')
install="${pkgname}.install"
_tarball="MayaFlux-${pkgver}-linux-arch.tar.gz"
source=("${_tarball}::https://github.com/MayaFlux/MayaFlux/releases/download/v${pkgver}/${_tarball}")
noextract=("${_tarball}")
DLAGENTS=('http::/usr/bin/aria2c -UWget -c -x16 -s16 -k1M --allow-overwrite=true --auto-file-renaming=false --file-allocation=none --console-log-level=warn --download-result=hide --max-tries=5 --retry-wait=3 %u -o %o'
    'https::/usr/bin/aria2c -UWget -c -x16 -s16 -k1M --allow-overwrite=true --auto-file-renaming=false --file-allocation=none --console-log-level=warn --download-result=hide --max-tries=5 --retry-wait=3 %u -o %o')
makedepends=('aria2')
sha256sums=('9422e6af83ec685c45ff25cc8763cc65178b1b99b1de3680e41b5175807228ee')

package() {
    install -d "$pkgdir/usr/lib"
    install -d "$pkgdir/usr/include"
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/share/MayaFlux"
    install -d "$pkgdir/usr/share/licenses/$pkgname"

    local extract_dir="${srcdir}/MayaFlux-${pkgver}-extracted"
    mkdir -p "$extract_dir"
    tar -xzf "${srcdir}/${_tarball}" -C "$extract_dir"

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
