# Maintainer: Tomas Runz Jensen <tomasrj@outlook.dk>

pkgname=pyrite64-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="N64 Game-Engine and Editor using libdragon & tiny3d"
arch=('x86_64')
url="https://github.com/HailToDodongo/pyrite64"
license=('MIT')
depends=('libpng' 'libusb' 'zlib' 'libmpc' 'mpfr' 'gmp')
makedepends=('git' 'make')
provides=('pyrite64' 'libdragon' 'libdragon-toolchain' 'mips64-elf-gcc' 'tiny3d')
conflicts=('libdragon' 'libdragon-git' 'libdragon-tools-git' 'mips64-elf-gcc' 'tiny3d' 'tiny3d-git')
source=(
    "https://github.com/DragonMinded/libdragon/releases/download/toolchain-continuous-prerelease/gcc-toolchain-mips64-x86_64.deb"
    "git+https://github.com/DragonMinded/libdragon.git#branch=preview"
    "https://github.com/HailToDodongo/pyrite64/releases/download/v${pkgver}/pyrite64-${pkgver//./_}-linux.zip"
    "git+https://github.com/HailToDodongo/tiny3d.git"
    "pyrite64.desktop"
)
sha512sums=('a548820c814d3ca10ad1f6c5b1a32c9006215cba5f8a21132392cbd831b0f7bc7e34b3c4d2f4568563e932e756fc418e457f682504e060101d89a2e9fcea4cae'
            'SKIP'
            '7bdfdeb5395418020f409110abf90e957b01eae68f844b7326ed46599433ce78a7c0f2d2033cbd1ecec638a18f5ced4090a30b85f7179d115e517b1080b489a2'
            'SKIP'
            '7fa6cf338fe0c7d18122239a5dda749a3b08a18e64b76d6e042b005a89f01656641639d0d0584f91554d2a8c6c0614294dc7d6c013652f37b9efb1c70e37ce47')
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
    
    install -d "${pkgdir}/etc/profile.d"
    echo 'export N64_INST=/opt/libdragon' > "${pkgdir}/etc/profile.d/libdragon.sh"
    chmod 755 "${pkgdir}/etc/profile.d/libdragon.sh"
    
    msg2 "Installing Tiny3D..."
    
    export N64_INST="${pkgdir}/opt/libdragon"
    
    cd "$srcdir/tiny3d"
    make install
    
    local gltf_bin="tools/gltf_importer/gltf_to_t3d"
    if [ -f "$gltf_bin" ]; then
        install -d "${pkgdir}/opt/libdragon/bin"
        install -m755 "$gltf_bin" "${pkgdir}/opt/libdragon/bin/"
    else
        warning "gltf_to_t3d binary not found."
    fi
    cd "$srcdir"

    msg2 "Installing Pyrite64..."
    
    install -d "${pkgdir}/opt/pyrite64"

    if [ -f "pyrite64" ]; then
        install -m755 "pyrite64" "${pkgdir}/opt/pyrite64/"
    fi
    
    # Install directories found in zip (n64, data)
    for dir in n64 data; do
         if [ -d "$dir" ]; then
             cp -r "$dir" "${pkgdir}/opt/pyrite64/"
         fi
    done

    install -d "${pkgdir}/usr/bin"
    ln -sf /opt/pyrite64/pyrite64 "${pkgdir}/usr/bin/pyrite64"
    if [ -f "${pkgdir}/opt/libdragon/bin/gltf_to_t3d" ]; then
        ln -sf /opt/libdragon/bin/gltf_to_t3d "${pkgdir}/usr/bin/gltf_to_t3d"
    fi
    
    # Ensure permissions for toolchain binaries
    chmod +x "${pkgdir}/opt/libdragon/bin/"* 2>/dev/null || true

    if [ -f "LICENSE" ]; then
        install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi

    install -Dm644 "${srcdir}/pyrite64.desktop" "${pkgdir}/usr/share/applications/pyrite64.desktop"
}
