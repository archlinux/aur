# Maintainer: DEX0ZEN <dex0aur@gmail.com>
pkgbase=vulkan-terakan
pkgname=vulkan-terakan
pkgver=1.0
pkgrel=1
pkgdesc="High-performance Vulkan 1.0 for AMD Terascale (HD 2000-7000)"
arch=('x86_64')
url="https://gitlab.freedesktop.org/Triang3l/mesa"
license=('MIT')
depends=(
  'libdrm' 'libxcb' 'libx11' 'libxshmfence' 'zstd' 'expat'
  'vulkan-icd-loader' 'libva' 'libvdpau' 'wayland' 'xorg-xwayland'
)
makedepends=(
  'git' 'meson' 'ninja' 'glslang' 'wayland-protocols' 'xorgproto'
  'python' 'python-mako' 'libelf' 'libunwind' 'clang' 'libclc'
  'llvm' 'rust' 'spirv-tools' 'vulkan-headers' 'directx-shader-compiler'
)
provides=('vulkan-driver')
options=('!lto')
install=${pkgname}.install
source=('git+https://gitlab.freedesktop.org/Triang3l/mesa.git#branch=Terakan')
sha256sums=('SKIP')

# Basic configuration options for Vulkan Terakan build
_use_local_repo=0      # Use local repository if available (1=yes, 0=no)
_enable_advanced_codecs=1   # Enable additional video codecs like H265/HEVC
_optimize_level=3           # Optimization level (1=low, 2=medium, 3=aggressive)
_enable_nine=1        # Enable Direct3D 9 state tracker (for gaming)
_enable_opencl=0      # Enable OpenCL support (may cause build issues)
_enable_threading=1   # Enable threading optimizations

prepare() {
  cd "${srcdir}"
  
  # Clean previous build directories
  rm -rf build build64 2>/dev/null || true

  # Check for local repository
  if [ -d "$startdir/mesa" ] && [ -d "$startdir/mesa/.git" ]; then
    echo "Local mesa repository found. Using local repository instead of cloning."
    _use_local_repo=1
    
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
  
  # Apply any patches if needed
  # cd mesa
  # patch -p1 -i "${srcdir}/fix-something.patch"
}

build() {
  cd "${srcdir}"
  
  # Set performance optimization flags
  case "${_optimize_level}" in
    1)
      _opt_flags="-O1"
      _meson_opt="1"
      ;;
    2)
      _opt_flags="-O2"
      _meson_opt="2"
      ;;
    3|*)
      _opt_flags="-O3 -march=native -pipe"
      _meson_opt="3"
      ;;
  esac

  # Core build flags
  _build_flags=(
    -Dvulkan-drivers=amd_terascale
    -Dgallium-drivers=r600,swrast
    -Dplatforms=x11,wayland
    -Dglx=dri
    -Degl=enabled
    -Dgbm=enabled
    -Dshared-glapi=enabled
    -Dllvm=enabled
    -Dbuildtype=release
    -Doptimization=${_meson_opt}
    -Db_ndebug=true
    -Dlibdir=lib
    -Ddri3=enabled
    -Dgles1=disabled
    -Dgles2=enabled
    -Dosmesa=false
    -Dvulkan-beta=true
    -Dshader-cache=enabled
    -Dtools=[]
  )

  # Add additional video codecs if requested
  if [ "${_enable_advanced_codecs}" -eq 1 ]; then
    _build_flags+=(-Dvideo-codecs=h264dec,h264enc,h265dec,h265enc,vc1dec,vp9dec)
  fi

  # Add OpenCL support if requested
  if [ "${_enable_opencl}" -eq 1 ]; then
    _build_flags+=(-Dgallium-opencl=standalone -Dgallium-rusticl=true)
  else
    _build_flags+=(-Dgallium-opencl=disabled -Dgallium-rusticl=false)
  fi

  # Add Nine (Direct3D 9) support if requested
  if [ "${_enable_nine}" -eq 1 ]; then
    _build_flags+=(-Dgallium-nine=true)
  else
    _build_flags+=(-Dgallium-nine=false)
  fi

  # Enable threading optimizations if requested
  if [ "${_enable_threading}" -eq 1 ]; then
    # Using b_lto option instead of build-id which is not supported
    _build_flags+=(-Db_lto=true)
  fi

  # Add basic media acceleration support
  _build_flags+=(
    -Dgallium-va=enabled
    -Dgallium-vdpau=enabled
    -Dgallium-xa=false
    -Dzstd=enabled
  )
  
  # Add shader optimizations
  _opt_flags="${_opt_flags} -DR600_DEBUG=1"

  echo "Building with flags: ${_build_flags[*]}"
  
  # Meson setup
  meson setup mesa build64 \
    ${_build_flags[@]} \
    -Dc_args="${_opt_flags}" \
    -Dcpp_args="${_opt_flags}"
  
  # Build
  ninja -C build64
}

package() {
  cd "${srcdir}"
  
  # Install the built files
  DESTDIR="$pkgdir" ninja -C build64 install

  # Install Vulkan ICD file
  install -Dm644 /dev/stdin "$pkgdir/usr/share/vulkan/icd.d/terascale_icd.x86_64.json" <<EOF
{
    "file_format_version": "1.0.0",
    "ICD": {
        "library_path": "/usr/lib/libvulkan_terascale.so",
        "api_version": "1.0.0"
    }
}
EOF

  # Create modprobe configuration
  install -Dm644 /dev/stdin "$pkgdir/etc/modprobe.d/terakan.conf" <<EOF
# Terakan Vulkan driver configuration
options radeon si_support=0
options radeon cik_support=0
options amdgpu si_support=0
options amdgpu cik_support=0
EOF

  # Helper scripts
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/terakan-vulkan-setup" <<EOF
#!/bin/bash
export VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/terascale_icd.x86_64.json
export AMD_DEBUG=nohyperz,nofastcolor
export R600_DEBUG=vs,ps,gs,tex,nohyperz
export MESA_EXTENSION_OVERRIDE=+GL_ARB_gpu_shader_fp64

if [ ! -f "/usr/lib/libvulkan_terascale.so" ]; then
    echo "ERROR: Terakan driver not found! Please reinstall the package."
    exit 1
fi

echo "Terakan Vulkan environment ready."
if [ \$# -gt 0 ]; then
    exec "\$@"
fi
EOF

  # DirectX helper script
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/terakan-dx-setup" <<EOF
#!/bin/bash
# Setup script for DirectX compatibility with Terakan
export VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/terascale_icd.x86_64.json
export PROTON_USE_WINED3D=1
export PROTON_NO_GLSL=1 
export PROTON_NO_D3D11=0
export PROTON_NO_D3D10=0
export PROTON_NO_ESYNC=1
export R600_DEBUG=nohyperz
export WINEDLLOVERRIDES="d3d10,d3d11,dxgi=n"

if [ ! -f "/usr/lib/libvulkan_terascale.so" ]; then
    echo "ERROR: Terakan driver not found! Please reinstall the package."
    exit 1
fi

echo "Terakan DirectX compatibility environment ready."
if [ \$# -gt 0 ]; then
    exec "\$@"
fi
EOF

  # License
  install -Dm644 mesa/docs/license.rst "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
  # Documentation
  install -Dm644 /dev/stdin "$pkgdir/usr/share/doc/$pkgname/README.md" <<EOF
# Terakan Vulkan Driver

High-performance Vulkan 1.0 implementation for AMD Terascale GPUs (HD 2000-7000 series).

## Basic Usage

To use with any Vulkan application:

\`\`\`
export VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/terascale_icd.x86_64.json
application_name
\`\`\`

Or use the provided helper script:

\`\`\`
terakan-vulkan-setup application_name
\`\`\`

## DirectX Compatibility

For DirectX 9/10/11/12 compatibility, use the DirectX helper script:

\`\`\`
terakan-dx-setup application_name
\`\`\`

## Performance Optimization

Some applications may benefit from these environment variables:

\`\`\`
# Vulkan driver selection
export VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/terascale_icd.x86_64.json

# Performance tweaks
export RADV_PERFTEST=local_infinity_cache,gpl
export MESA_GLSL_CACHE_DISABLE=false
export MESA_SHADER_CACHE_DIR=~/.cache/mesa_shader_cache
export R600_DEBUG=noopt,nosb
\`\`\`

## Troubleshooting

Enable debug mode:

\`\`\`
VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/terascale_icd.x86_64.json MESA_DEBUG=1 app
\`\`\`

Force software rendering (if hardware rendering fails):

\`\`\`
LIBGL_ALWAYS_SOFTWARE=1 terakan-vulkan-setup app
\`\`\`

## Supported GPUs

- AMD Radeon HD 2000 series (R600)
- AMD Radeon HD 3000 series (R600)
- AMD Radeon HD 4000 series (R700)
- AMD Radeon HD 5000 series (Evergreen)
- AMD Radeon HD 6000 series (Northern Islands)
- AMD Radeon HD 7000 series - TeraScale variants (not GCN)
EOF

  # Fallback for missing library
  if [ ! -f "$pkgdir/usr/lib/libvulkan_terascale.so" ]; then
    echo "Warning: libvulkan_terascale.so not found in package! Trying to find it..."
    _vulkan_lib=$(find build64 -name "libvulkan_terascale.so")
    if [ -n "$_vulkan_lib" ]; then
      echo "Found $_vulkan_lib - copying to package"
      install -Dm755 "$_vulkan_lib" "$pkgdir/usr/lib/libvulkan_terascale.so"
    else
      echo "ERROR: Could not locate libvulkan_terascale.so - package will be incomplete!"
    fi
  fi
}
