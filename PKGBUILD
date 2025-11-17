# Maintainer: Saim <saim20 at github dot com>
pkgname=gnome-assistant
pkgver=2.0.0
pkgrel=1
pkgdesc="Advanced voice control for GNOME Shell with whisper.cpp offline speech recognition"
arch=('x86_64')
url="https://github.com/Saim20/gnome-assistant"
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
install=gnome-assistant.install
source=("gnome-assistant::git+https://github.com/Saim20/gnome-assistant.git")
sha256sums=('SKIP')

# Build options - users can enable these before building
# To enable CUDA: export ENABLE_CUDA=1 before running makepkg
# To enable Vulkan: export ENABLE_VULKAN=1 before running makepkg
# Or edit this file and set _enable_cuda=1 or _enable_vulkan=1
: ${ENABLE_CUDA:=0}
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
        git clone --depth 1 https://github.com/ggerganov/whisper.cpp.git whisper.cpp
    fi
    
    # Validate whisper.cpp
    if [ ! -f "whisper.cpp/CMakeLists.txt" ]; then
        printf "ERROR: Failed to clone whisper.cpp properly\n" >&2
        return 1
    fi
    
    # Display build configuration
    printf "===================================================================\n"
    printf "Build configuration:\n"
    printf "  CUDA support: %s\n" "$([ $_enable_cuda -eq 1 ] && echo 'enabled' || echo 'disabled')"
    printf "  Vulkan support: %s\n" "$([ $_enable_vulkan -eq 1 ] && echo 'enabled' || echo 'disabled')"
    printf "===================================================================\n"
    printf "\n"
    printf "To enable GPU acceleration:\n"
    printf "  CUDA: export ENABLE_CUDA=1 before running makepkg\n"
    printf "  Vulkan: export ENABLE_VULKAN=1 before running makepkg\n"
    printf "===================================================================\n"
    
    # Check dependencies if GPU acceleration is requested
    if [ $_enable_cuda -eq 1 ]; then
        if ! command -v nvcc &> /dev/null && [ ! -d "/opt/cuda" ]; then
            printf "WARNING: CUDA support requested but CUDA toolkit not found.\n" >&2
            printf "WARNING: Install CUDA: sudo pacman -S cuda (or cuda from AUR)\n" >&2
        fi
    fi
    
    if [ $_enable_vulkan -eq 1 ]; then
        if ! pacman -Qi vulkan-headers &> /dev/null; then
            printf "WARNING: Vulkan support requested but vulkan-headers not installed.\n" >&2
            printf "WARNING: Install Vulkan: sudo pacman -S vulkan-headers vulkan-icd-loader\n" >&2
        fi
    fi
}

build() {
    cd "$srcdir/$pkgname"
    
    # Validate whisper.cpp was cloned
    if [ ! -d "whisper.cpp" ] || [ ! -f "whisper.cpp/CMakeLists.txt" ]; then
        printf "ERROR: whisper.cpp not found or incomplete. Run prepare() first.\n" >&2
        return 1
    fi
    
    # Build whisper.cpp first
    printf "Building whisper.cpp...\n"
    cd whisper.cpp
    
    local cmake_opts="-DCMAKE_BUILD_TYPE=Release"
    
    if [ $_enable_cuda -eq 1 ]; then
        printf "Configuring whisper.cpp with CUDA support...\n"
        cmake_opts="$cmake_opts -DGGML_CUDA=ON"
        if [ -d "/opt/cuda" ]; then
            cmake_opts="$cmake_opts -DCUDAToolkit_ROOT=/opt/cuda"
        fi
    fi
    
    if [ $_enable_vulkan -eq 1 ]; then
        printf "Configuring whisper.cpp with Vulkan support...\n"
        cmake_opts="$cmake_opts -DGGML_VULKAN=ON"
    fi
    
    cmake -B build $cmake_opts
    cmake --build build --parallel $(nproc)
    cd ..
    
    # Build the service
    printf "Building GNOME Assistant service...\n"
    cd service
    
    cmake_opts="-DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DWHISPER_CPP_DIR=$srcdir/$pkgname/whisper.cpp"
    
    if [ $_enable_cuda -eq 1 ]; then
        cmake_opts="$cmake_opts -DGGML_CUDA=ON"
        if [ -d "/opt/cuda" ]; then
            cmake_opts="$cmake_opts -DCUDAToolkit_ROOT=/opt/cuda -DCMAKE_CUDA_COMPILER=/opt/cuda/bin/nvcc"
        fi
    fi
    
    if [ $_enable_vulkan -eq 1 ]; then
        cmake_opts="$cmake_opts -DGGML_VULKAN=ON"
    fi
    
    cmake -B build $cmake_opts
    cmake --build build --parallel $(nproc)
}

package() {
    cd "$srcdir/$pkgname"
    
    # Install the service binary
    cd service/build
    DESTDIR="$pkgdir" cmake --install .
    
    cd "$srcdir/$pkgname"
    
    # Install systemd service file
    install -Dm644 systemd/gnome-assistant.service \
        "$pkgdir/usr/lib/systemd/user/gnome-assistant.service"
    
    # Install GNOME extension
    local ext_dir="$pkgdir/usr/share/gnome-shell/extensions/gnome-assistant@saim"
    install -dm755 "$ext_dir"
    cp -r gnome-extension/gnome-assistant@saim/* "$ext_dir/"
    
    # Compile extension schemas
    if [ -d "$ext_dir/schemas" ]; then
        glib-compile-schemas "$ext_dir/schemas/"
    fi
    
    # Install default configuration
    install -Dm644 config.json \
        "$pkgdir/usr/share/gnome-assistant/config.json"
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 docs/GPU_ACCELERATION.md "$pkgdir/usr/share/doc/$pkgname/GPU_ACCELERATION.md"
    
    # Install LICENSE
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    # Install model download helper
    install -Dm755 download-model.sh "$pkgdir/usr/bin/gnome-assistant-download-model"
}
