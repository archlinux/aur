# Maintainer: Ferenc Czirok <ferenc@czirok.net>
# Packager: Ferenc Czirok <ferenc@czirok.net>

pkgname=dotnet-aot-xc
pkgver=2025.08
pkgrel=2
pkgdesc="Complete cross-compilation toolchain for .NET AOT (linux-x64, linux-arm64, linux-musl-x64, linux-musl-arm64). Run 'dotnet-aot-xc --help' for usage"
arch=("x86_64")
url="https://toolchains.bootlin.com"
license=(
    'GPL-2.0-or-later'
    'GPL-3.0-or-later'
    'GPL-3.0-or-later WITH GCC-exception-3.1'
    'ISC'
    'LGPL-3.0-or-later'
    'MIT'
    'Python-2.0'
    'Zlib'
)
groups=('devel')

options=('!strip' '!emptydirs')

source=("https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--glibc--bleeding-edge-2025.08-1.tar.xz"
        "https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--musl--bleeding-edge-2025.08-1.tar.xz"
        "https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--glibc--bleeding-edge-2025.08-1.tar.xz"
        "https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--musl--bleeding-edge-2025.08-1.tar.xz"
        "dotnet-aot-xc.sh")

sha256sums=('dc986211c6a8701868277d52e8f5061ea13d119ce0d9f23b61f1b0373984479b'
            '830644a5f9c921fd8df2d40ab80dd81f03a662e5a7ad3cee20dbe2fde0de272e'
            '54875d12829a792b8d4d1c9fb1f736afc60f514b0d260616f188eafafaac7cb5'
            'e102fe06809440bbca3b6d0d8837ffdb5122b07386d1d2ac023084d898aafe7b'
            'acd6a47a60fef238101f948ae20bc7f27f9852e8c6eadd0d88878a643e78fe23')

build() {
    cd "$srcdir"
    
    declare -A relocations=(
        ["aarch64--glibc--bleeding-edge-2025.08-1"]="/opt/dotnet-aot-xc/linux-arm64"
        ["aarch64--musl--bleeding-edge-2025.08-1"]="/opt/dotnet-aot-xc/linux-musl-arm64"
        ["x86-64--glibc--bleeding-edge-2025.08-1"]="/opt/dotnet-aot-xc/linux-x64"
        ["x86-64--musl--bleeding-edge-2025.08-1"]="/opt/dotnet-aot-xc/linux-musl-x64"
    )
    
    for dir in "${!relocations[@]}"; do
        msg2 "Relocating $dir to ${relocations[$dir]}"
        cd "$dir"
        sh relocate-sdk.sh "${relocations[$dir]}"
        cd "$srcdir"
    done
}

package() {
    cd "$srcdir"
    
    # Create base directory
    install -dm755 "$pkgdir/opt/dotnet-aot-xc"
    
    # Install toolchains
    msg2 "Installing toolchains..."
    cp -a "aarch64--glibc--bleeding-edge-2025.08-1" "$pkgdir/opt/dotnet-aot-xc/linux-arm64"
    cp -a "aarch64--musl--bleeding-edge-2025.08-1" "$pkgdir/opt/dotnet-aot-xc/linux-musl-arm64"
    cp -a "x86-64--glibc--bleeding-edge-2025.08-1" "$pkgdir/opt/dotnet-aot-xc/linux-x64"
    cp -a "x86-64--musl--bleeding-edge-2025.08-1" "$pkgdir/opt/dotnet-aot-xc/linux-musl-x64"
    
    # Install helper script
    install -Dm755 "$srcdir/dotnet-aot-xc.sh" "$pkgdir/opt/dotnet-aot-xc/dotnet-aot-xc.sh"
    
    # Symlink to /usr/bin
    install -dm755 "$pkgdir/usr/bin"
    ln -s /opt/dotnet-aot-xc/dotnet-aot-xc.sh "$pkgdir/usr/bin/dotnet-aot-xc"
    
    # Create GCC wrapper scripts to filter --target flag
    msg2 "Creating GCC wrapper scripts..."

    # linux-x64 wrapper (passthrough for consistency)
    cat > "$pkgdir/opt/dotnet-aot-xc/linux-x64/bin/x86_64-linux-gcc" << 'EOF'
#!/bin/bash
exec x86_64-buildroot-linux-gnu-gcc.br_real "$@"
EOF
    chmod +x "$pkgdir/opt/dotnet-aot-xc/linux-x64/bin/x86_64-linux-gcc"

    # linux-arm64 wrapper
    cat > "$pkgdir/opt/dotnet-aot-xc/linux-arm64/bin/aarch64-linux-gcc" << 'EOF'
#!/bin/bash
args=()
for arg in "$@"; do
    [[ "$arg" != --target=* ]] && args+=("$arg")
done
exec aarch64-buildroot-linux-gnu-gcc.br_real "${args[@]}"
EOF
    chmod +x "$pkgdir/opt/dotnet-aot-xc/linux-arm64/bin/aarch64-linux-gcc"
    
    # linux-musl-arm64 wrapper
    cat > "$pkgdir/opt/dotnet-aot-xc/linux-musl-arm64/bin/aarch64-linux-musl-gcc" << 'EOF'
#!/bin/bash
args=()
for arg in "$@"; do
    [[ "$arg" != --target=* ]] && args+=("$arg")
done
exec aarch64-buildroot-linux-musl-gcc.br_real "${args[@]}"
EOF
    chmod +x "$pkgdir/opt/dotnet-aot-xc/linux-musl-arm64/bin/aarch64-linux-musl-gcc"
    
    # linux-musl-x64 wrapper
    cat > "$pkgdir/opt/dotnet-aot-xc/linux-musl-x64/bin/x86_64-linux-musl-gcc" << 'EOF'
#!/bin/bash
args=()
for arg in "$@"; do
    [[ "$arg" != --target=* ]] && args+=("$arg")
done
exec x86_64-buildroot-linux-musl-gcc.br_real "${args[@]}"
EOF
    chmod +x "$pkgdir/opt/dotnet-aot-xc/linux-musl-x64/bin/x86_64-linux-musl-gcc"
}