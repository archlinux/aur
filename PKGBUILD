# Maintainer: DEX0ZEN <dex0aur@gmail.com>
pkgbase=lib32-vulkan-terakan
pkgname=lib32-vulkan-terakan
pkgver=1.0
pkgrel=1
pkgdesc="High-performance Vulkan 1.0 for AMD Terascale (HD 2000-7000) - 32-bit libraries"
arch=('x86_64')
url="https://gitlab.freedesktop.org/Triang3l/mesa"
license=('MIT')
depends=(
  'lib32-libdrm' 'lib32-libxcb' 'lib32-libx11' 'lib32-libxshmfence' 'lib32-zstd' 'lib32-expat'
  'lib32-vulkan-icd-loader' 'lib32-libva' 'lib32-libvdpau' 'lib32-wayland'
  'lib32-libxxf86vm' 'lib32-libxfixes' 'lib32-libxext' 'lib32-libxrandr' 'lib32-llvm-libs'
  'vulkan-terakan'
)
makedepends=(
  'git' 'meson' 'ninja' 'lib32-gcc-libs' 'lib32-llvm' 'wayland-protocols' 'xorgproto'
  'python' 'python-mako' 'lib32-libelf' 'lib32-libunwind' 'gcc-multilib' 'pkg-config'
)
provides=('lib32-vulkan-driver')
options=('!lto' '!strip')
install=lib32-vulkan-terakan.install
source=('git+https://gitlab.freedesktop.org/Triang3l/mesa.git#branch=Terakan')
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}"
  
  # Clean previous build directories
  rm -rf build build32 2>/dev/null || true

  # Check for local repository
  if [ -d "$startdir/mesa" ] && [ -d "$startdir/mesa/.git" ]; then
    echo "Local mesa repository found. Using local repository instead of cloning."
    
    # Create symlink to local repository
    rm -rf mesa
    ln -sf "$startdir/mesa" mesa
    
    # Ensure we're on the right branch
    cd mesa
    if ! git rev-parse --verify Terakan >/dev/null 2>&1; then
      echo "Terakan branch not found in local repository. Fetching..."
      git fetch origin Terakan:Terakan || echo "Warning: Failed to fetch Terakan branch."
    fi
    
    git checkout Terakan || echo "Warning: Failed to switch to Terakan branch."
    cd ..
  fi
}

build() {
  cd "${srcdir}"
  
  # Create a simple build script to handle all the environment variables and paths
  cat > build-lib32.sh << 'EOF'
#!/bin/bash
set -e

# Configure the 32-bit build environment
export CC="gcc -m32"
export CXX="g++ -m32"
export PKG_CONFIG_PATH="/usr/lib32/pkgconfig:/usr/share/pkgconfig"

# Set strict 32-bit only flags
export CFLAGS="-m32 -O2 -march=i686 -pipe"
export CXXFLAGS="-m32 -O2 -march=i686 -pipe"
export LDFLAGS="-m32 -L/usr/lib32"
export ASFLAGS="-m32"

# Ensure 32-bit libraries are used
export LD_LIBRARY_PATH="/usr/lib32"
export LIBRARY_PATH="/usr/lib32"

# Create meson cross file for 32-bit builds
cat > cross_file.txt << 'CROSSFILE'
[binaries]
c = 'gcc'
cpp = 'g++'
ar = 'ar'
strip = 'strip'
pkgconfig = 'i686-pc-linux-gnu-pkg-config'
llvm-config= '/usr/bin/llvm-config32'

[properties]
c_args = ['-m32']
cpp_args = ['-m32']
c_link_args = ['-m32', '-L/usr/lib32']
cpp_link_args = ['-m32', '-L/usr/lib32']

[host_machine]
system = 'linux'
cpu_family = 'x86'
cpu = 'i686'
endian = 'little'
CROSSFILE

# Minimal working flags for 32-bit Terascale Vulkan driver
MESON_FLAGS=(
  -Dvulkan-drivers=amd_terascale
  -Dgallium-drivers=r600,swrast
  -Dllvm=enabled
  -Dshared-llvm=true
  -Dplatforms=x11,wayland
  -Dglx=dri
  -Degl=enabled
  -Dgbm=enabled
  -Dshared-glapi=enabled
  -Dbuildtype=release
  -Doptimization=3
  -Db_ndebug=true
  -Ddri3=enabled
  -Dgles2=enabled
  -Dvulkan-beta=true
  -Dshader-cache=enabled
  -Dgallium-nine=true
  -Dgallium-va=enabled
  -Dgallium-vdpau=enabled
  -Dgallium-xa=false
  -Dzstd=enabled
  -Dvideo-codecs=h264dec,h264enc,h265dec,h265enc,vc1dec,vp9dec
  -Dtools=[]
)

# Configure the build with meson
meson setup mesa build32 \
  "${MESON_FLAGS[@]}" \
  --cross-file cross_file.txt \
  --prefix=/usr \
  --libdir=lib32

# Build with ninja
ninja -C build32
EOF

  # Make the build script executable
  chmod +x build-lib32.sh
  
  # Run the build script
  ./build-lib32.sh
}

package() {
  cd "${srcdir}"
  
  # Install the built files
  DESTDIR="$pkgdir" ninja -C build32 install

  # Install Vulkan ICD file
  install -Dm644 /dev/stdin "$pkgdir/usr/share/vulkan/icd.d/terascale_icd.i686.json" <<EOF
{
    "file_format_version": "1.0.0",
    "ICD": {
        "library_path": "/usr/lib32/libvulkan_terascale.so",
        "api_version": "1.0.0"
    }
}
EOF

  # Create script to help running 32-bit apps
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/terakan-vulkan32-setup" <<EOF
#!/bin/bash
export VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/terascale_icd.i686.json
export AMD_DEBUG=nohyperz,nofastcolor
export R600_DEBUG=vs,ps,gs,tex,nohyperz
export MESA_EXTENSION_OVERRIDE=+GL_ARB_gpu_shader_fp64

if [ ! -f "/usr/lib32/libvulkan_terascale.so" ]; then
    echo "ERROR: 32-bit Terakan driver not found! Please reinstall the package."
    exit 1
fi

echo "Terakan Vulkan 32-bit environment ready."
if [ \$# -gt 0 ]; then
    exec "\$@"
fi
EOF

  # Remove files that conflict with vulkan-terakan package
  rm -rf "$pkgdir/etc"
  rm -rf "$pkgdir/usr/include"
  rm -rf "$pkgdir/usr/share/licenses/vulkan-terakan"
  rm -rf "$pkgdir/usr/share/vulkan/explicit_layer.d"
  rm -rf "$pkgdir/usr/share/glvnd"
  
  # Remove lib directories that should be in vulkan-terakan package
  rm -rf "$pkgdir/usr/lib"

  # Remove documentation already in the main package
  rm -rf "$pkgdir/usr/share/doc"

  # License
  install -Dm644 mesa/docs/license.rst "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Check if everything was installed correctly
  if [ ! -f "$pkgdir/usr/lib32/libvulkan_terascale.so" ]; then
    echo "Warning: libvulkan_terascale.so not found in package! Trying to find it..."
    _vulkan_lib=$(find build32 -name "libvulkan_terascale.so")
    if [ -n "$_vulkan_lib" ]; then
      echo "Found $_vulkan_lib - copying to package"
      install -Dm755 "$_vulkan_lib" "$pkgdir/usr/lib32/libvulkan_terascale.so"
    else
      echo "ERROR: Could not locate libvulkan_terascale.so - package will be incomplete!"
    fi
  fi
}
