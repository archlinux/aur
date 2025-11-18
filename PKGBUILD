# Maintainer: Saim <saim20 at github dot com>
pkgname=willow
pkgver=2.1.1
pkgrel=1
pkgdesc="Simple offline configurable voice assistant for gnome"
arch=('x86_64')
url="https://github.com/Saim20/willow"
license=('MIT')
depends=(
    'gnome-shell>=45'
    'sdbus-cpp'
    'jsoncpp'
    'libpulse'
    'ydotool'
)
makedepends=(
    'cmake'
    'git'
    'gcc'
)
optdepends=(
    'cuda: for NVIDIA GPU acceleration'
    'vulkan-icd-loader: for Vulkan GPU acceleration (AMD/Intel/NVIDIA)'
    'vulkan-headers: for Vulkan GPU acceleration build support'
)
options=('!debug')
install=willow.install
source=("willow::git+https://github.com/Saim20/willow.git")
sha256sums=('SKIP')

# Build options - users can enable these before building
# To enable CUDA: export ENABLE_CUDA=1 before running makepkg
# To enable Vulkan: export ENABLE_VULKAN=1 before running makepkg
# Or edit this file and set _enable_cuda=1 or _enable_vulkan=1
: ${ENABLE_CUDA:=1}
: ${ENABLE_VULKAN:=0}
_enable_cuda=${ENABLE_CUDA}
_enable_vulkan=${ENABLE_VULKAN}

prepare() {
    cd "$srcdir/$pkgname"
    
    # Interactive GPU acceleration setup (only if not already set)
    if [ -z "${ENABLE_CUDA+x}" ] && [ -z "${ENABLE_VULKAN+x}" ]; then
        printf "\n"
        printf "===================================================================\n"
        printf "GPU Acceleration Options\n"
        printf "===================================================================\n"
        printf "\n"
        
        # Check for CUDA
        if command -v nvcc &> /dev/null || [ -d "/opt/cuda" ]; then
            printf "NVIDIA CUDA detected. Enable CUDA acceleration? [y/N] "
            read -r response
            if [[ "$response" =~ ^[Yy]$ ]]; then
                export ENABLE_CUDA=1
                _enable_cuda=1
                printf "✓ CUDA enabled\n"
            else
                export ENABLE_CUDA=0
                _enable_cuda=0
                printf "CUDA disabled\n"
            fi
        else
            printf "CUDA toolkit not detected. Skipping CUDA.\n"
            export ENABLE_CUDA=0
            _enable_cuda=0
        fi
        
        printf "\n"
        
        # Check for Vulkan
        if pacman -Qi vulkan-headers &> /dev/null; then
            printf "Vulkan SDK detected. Enable Vulkan acceleration? [y/N] "
            read -r response
            if [[ "$response" =~ ^[Yy]$ ]]; then
                export ENABLE_VULKAN=1
                _enable_vulkan=1
                printf "✓ Vulkan enabled\n"
            else
                export ENABLE_VULKAN=0
                _enable_vulkan=0
                printf "Vulkan disabled\n"
            fi
        else
            printf "Vulkan SDK not detected. Skipping Vulkan.\n"
            printf "(Install with: sudo pacman -S vulkan-headers vulkan-icd-loader)\n"
            export ENABLE_VULKAN=0
            _enable_vulkan=0
        fi
        
        printf "\n"
        printf "Tip: Set ENABLE_CUDA=1 or ENABLE_VULKAN=1 before makepkg to skip prompts\n"
        printf "===================================================================\n"
        printf "\n"
    fi
    
    # Clone whisper.cpp if not present
    if [ ! -d "whisper.cpp" ]; then
        printf "Cloning whisper.cpp...\n"
        git clone --depth 1 https://github.com/ggerganov/whisper.cpp.git
    fi
}

build() {
    cd "$srcdir/$pkgname"
    
    # Build the C++ service with whisper.cpp
    cd service
    
    # Create build directory
    rm -rf build
    mkdir -p build
    cd build
    
    # Configure with CMake
    local cmake_args=(
        -DCMAKE_BUILD_TYPE=Release
        -DCMAKE_INSTALL_PREFIX=/usr
        -DWHISPER_CPP_DIR="$srcdir/$pkgname/whisper.cpp"
    )
    
    # Add GPU acceleration options
    if [ "$_enable_cuda" = "1" ]; then
        cmake_args+=(-DGGML_CUDA=ON)
        printf "\n✓ Building with CUDA support\n\n"
    fi
    
    if [ "$_enable_vulkan" = "1" ]; then
        cmake_args+=(-DGGML_VULKAN=ON)
        printf "\n✓ Building with Vulkan support\n\n"
    fi
    
    cmake "${cmake_args[@]}" ..
    
    # Build
    make -j$(nproc)
    
    printf "\n"
    printf "===================================================================\n"
    printf "Build Configuration:\n"
    printf "  CUDA: $_enable_cuda\n"
    printf "  Vulkan: $_enable_vulkan\n"
    printf "===================================================================\n"
    printf "\n"
}

check() {
    cd "$srcdir/$pkgname/service/build"
    
    # Basic sanity checks
    if [ ! -f "willow-service" ]; then
        printf "ERROR: willow-service binary not found!\n"
        return 1
    fi
    
    # Check if binary is executable
    if [ ! -x "willow-service" ]; then
        printf "ERROR: willow-service is not executable!\n"
        return 1
    fi
    
    printf "✓ Binary checks passed\n"
}

package() {
    cd "$srcdir/$pkgname"
    
    # Install service binary and D-Bus files
    cd service/build
    make DESTDIR="$pkgdir" install
    
    cd "$srcdir/$pkgname"
    
    # Install systemd service
    install -Dm644 systemd/willow.service \
        "$pkgdir/usr/lib/systemd/user/willow.service"
    
    # Install GNOME extension
    local ext_dir="$pkgdir/usr/share/gnome-shell/extensions/willow@saim"
    mkdir -p "$ext_dir"
    cp -r gnome-extension/willow@saim/* "$ext_dir/"
    
    # Compile GSettings schema
    glib-compile-schemas "$ext_dir/schemas/" || true
    
    # Install default configuration
    install -Dm644 config.json \
        "$pkgdir/usr/share/willow/config.json"
    
    # Install context configuration for smart workflows
    install -Dm644 context.json \
        "$pkgdir/usr/share/willow/context.json"
    
    # Install LICENSE
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 SMART_WORKFLOWS.md "$pkgdir/usr/share/doc/$pkgname/SMART_WORKFLOWS.md"
    install -Dm644 SMART_WORKFLOWS_QUICKSTART.md "$pkgdir/usr/share/doc/$pkgname/SMART_WORKFLOWS_QUICKSTART.md"
    
    # Install download helper script
    install -Dm755 download-model.sh "$pkgdir/usr/bin/willow-download-model"
}
