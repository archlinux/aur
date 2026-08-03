# Maintainer: Tomas Runz Jensen <tomasrj@outlook.dk>

pkgname=pyrite64-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="N64 Game-Engine and Editor using libdragon & tiny3d"
arch=('x86_64')
url="https://github.com/HailToDodongo/pyrite64"
license=('MIT')
depends=('libpng' 'libusb' 'zlib' 'libmpc' 'mpfr' 'gmp')
makedepends=('git' 'make')
provides=('pyrite64' 'libdragon' 'libdragon-toolchain' 'mips64-elf-gcc' 'tiny3d')
conflicts=('libdragon' 'libdragon-git' 'libdragon-tools-git' 'mips64-elf-gcc' 'tiny3d' 'tiny3d-git')
install=pyrite64-bin.install
source=(
    "https://github.com/DragonMinded/libdragon/releases/download/toolchain-continuous-prerelease/gcc-toolchain-mips64-x86_64.deb"
    "git+https://github.com/DragonMinded/libdragon.git#branch=preview"
    "https://github.com/HailToDodongo/pyrite64/releases/download/v${pkgver}/pyrite64-linux_${pkgver//./-}.zip"
    "git+https://github.com/HailToDodongo/tiny3d.git"
)
# The gcc-toolchain .deb is a continuous-prerelease asset: upstream CI rebuilds
# it and overwrites it in place at a fixed URL/tag, so any pinned checksum goes
# stale and breaks the build. SKIP it like the moving git sources.
sha512sums=('SKIP'
            'SKIP'
            'f5f5845c8d4b7da6d4ba9d3c852608e6fb0e0ec4eeca8a4ee827e237eaab73fa7c57f844a6da20636739e1731cdef5fcb86d248fcc640e90d1af34154e13a8c6'
            'SKIP')
options=('!strip')

prepare() {
    cd "$srcdir"
    
    if [ -f "gcc-toolchain-mips64-x86_64.deb" ]; then
        msg2 "Extracting gcc-toolchain-mips64-x86_64.deb..."
        rm -rf toolchain-deb
        mkdir -p toolchain-deb
        cd toolchain-deb
        ar x ../gcc-toolchain-mips64-x86_64.deb
        
        # Extract the data tarball found inside the deb
        if [ -f "data.tar.xz" ]; then
            tar -xf data.tar.xz
        elif [ -f "data.tar.gz" ]; then
            tar -xf data.tar.gz
        elif [ -f "data.tar.zst" ]; then
            tar -xf data.tar.zst
        else
            error "Could not find data tarball in .deb"
            return 1
        fi
        cd ..
    fi

    msg2 "Extracting Pyrite64 AppImage..."
    rm -rf squashfs-root
    local appimage="Pyrite64-x86_64.AppImage"
    if [ -f "$appimage" ]; then
        chmod +x "$appimage"
        "./$appimage" --appimage-extract >/dev/null
    else
        error "Pyrite64 AppImage not found: $appimage"
        return 1
    fi
}

build() {
    cd "$srcdir"
    
    if [ ! -d "toolchain-deb/opt/libdragon" ]; then
        error "Toolchain not found in toolchain-deb/opt/libdragon"
        return 1
    fi

    # Setup environment to use the extracted toolchain
    export N64_INST="$(pwd)/toolchain-deb/opt/libdragon"
    export PATH="$N64_INST/bin:$PATH"
    
    if ! command -v mips64-elf-gcc >/dev/null; then
        error "Toolchain compiler not found or not executable. PATH: $PATH"
        return 1
    fi
        
    # Clear flags for cross-compilation
    # makepkg sets CFLAGS/CXXFLAGS/LDFLAGS for the host (x86_64), which breaks mips64 compilation
    unset CFLAGS CXXFLAGS LDFLAGS ASFLAGS CPPFLAGS

    # The prebuilt toolchain provides GCC, but we need libdragon header/libs/tools
    msg2 "Building Libdragon..."
    if [ -d "libdragon" ]; then
        cd libdragon
        
        make clean
        
        make -j$(nproc) libdragon
        make -j$(nproc) tools
        
        # Install libdragon into our temporary toolchain location so Tiny3D can find it
        make install
        make -C tools install
        cd ..
    else
        error "Libdragon source not found."
        return 1
    fi

    msg2 "Building Tiny3D..."
    if [ -d "tiny3d" ]; then
        cd tiny3d
        make clean
        
        make -j$(nproc)
        make install
        
        # Build gltf_importer (host tool)
        msg2 "Building gltf_importer..."
        make -C tools/gltf_importer clean
        make -C tools/gltf_importer -j$(nproc)
        cd ..
    else
        error "Tiny3D source not found."
        return 1
    fi
}

package() {
    cd "$srcdir"
    
    msg2 "Installing Libdragon Toolchain..."
    
    install -d "${pkgdir}/opt"
    if [ -d "toolchain-deb/opt/libdragon" ]; then
        cp -r toolchain-deb/opt/libdragon "${pkgdir}/opt/"
    else
        error "Toolchain directory missing in package step."
        return 1
    fi
    
    msg2 "Installing Tiny3D..."

    local gltf_bin="${srcdir}/tiny3d/tools/gltf_importer/gltf_to_t3d"
    if [ -f "$gltf_bin" ]; then
        install -d "${pkgdir}/opt/libdragon/bin"
        install -m755 "$gltf_bin" "${pkgdir}/opt/libdragon/bin/"
    else
        warning "gltf_to_t3d binary not found."
    fi

    msg2 "Installing Pyrite64..."

    local appdir="${srcdir}/squashfs-root/usr"

    install -d "${pkgdir}/opt/pyrite64"

    if [ -f "${appdir}/bin/pyrite64" ]; then
        install -m755 "${appdir}/bin/pyrite64" "${pkgdir}/opt/pyrite64/"
    else
        error "pyrite64 binary not found in extracted AppImage."
        return 1
    fi

    # Install runtime assets shipped alongside the binary (n64, data)
    for dir in n64 data; do
         if [ -d "${appdir}/bin/$dir" ]; then
             cp -r "${appdir}/bin/$dir" "${pkgdir}/opt/pyrite64/"
         fi
    done

    install -d "${pkgdir}/usr/bin"

    # Use wrapper scripts instead of symlinks so N64_INST is always set for the
    # editor and importer, regardless of how they are launched (terminal or GUI).
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/pyrite64" << 'EOF'
#!/bin/sh
export N64_INST=/opt/libdragon
export PATH="/opt/libdragon/bin:$PATH"
exec /opt/pyrite64/pyrite64 "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/pyrite64"

    if [ -f "${pkgdir}/opt/libdragon/bin/gltf_to_t3d" ]; then
        cat > "${pkgdir}/usr/bin/gltf_to_t3d" << 'EOF'
#!/bin/sh
export N64_INST=/opt/libdragon
export PATH="/opt/libdragon/bin:$PATH"
exec /opt/libdragon/bin/gltf_to_t3d "$@"
EOF
        chmod 755 "${pkgdir}/usr/bin/gltf_to_t3d"
    fi
    
    # Ensure permissions for toolchain binaries
    chmod +x "${pkgdir}/opt/libdragon/bin/"* 2>/dev/null || true

    if [ -f "${appdir}/bin/LICENSE" ]; then
        install -D -m644 "${appdir}/bin/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi

    # Desktop entry and icon shipped inside the AppImage (Icon=pyrite64 resolves
    # to the hicolor PNG below).
    install -Dm644 "${appdir}/share/applications/pyrite64.desktop" \
        "${pkgdir}/usr/share/applications/pyrite64.desktop"
    install -Dm644 "${appdir}/share/icons/hicolor/256x256/apps/pyrite64.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/pyrite64.png"
}
