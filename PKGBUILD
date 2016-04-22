# Maintainer: Det <nimetonmaili g-mail>
# Based on nvidia-beta: https://aur.archlinux.org/packages/nvidia-beta/,
#          nvidia-utils-beta: https://aur.archlinux.org/packages/nvidia-utils-beta/ and
#          lib32-nvidia-utils-beta: https://aur.archlinux.org/packages/lib32-nvidia-utils-beta/

# Build the lib32 packages too? This only needs to be defined once and will
# remain until the packages are removed. "1" to enable.
_lib32=0

pkgname=('nvidia-full-beta' 'nvidia-utils-full-beta' 'nvidia-libgl-full-beta' 'opencl-nvidia-full-beta')
pkgver=364.19
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
license=('custom:NVIDIA')
makedepends=('linux-headers')
options=('!strip')

# Installer name
_pkg="NVIDIA-Linux-x86_64-$pkgver-no-compat32"
if [[ $CARCH = i686 ]]; then
  _pkg="NVIDIA-Linux-x86-$pkgver"
elif [[ $_lib32 = 1 ]] || pacman -Q lib32-nvidia-utils-full-beta &>/dev/null; then
  pkgname+=('lib32-nvidia-utils-full-beta' 'lib32-nvidia-libgl-full-beta' 'lib32-opencl-nvidia-full-beta')
  _pkg="NVIDIA-Linux-x86_64-$pkgver"
fi

# Source
source=('20-nvidia.conf')
source_i686=("http://us.download.nvidia.com/XFree86/Linux-x86/$pkgver/NVIDIA-Linux-x86-$pkgver.run")
source_x86_64=("http://us.download.nvidia.com/XFree86/Linux-x86_64/$pkgver/$_pkg.run")
md5sums=('2640eac092c220073f0668a7aaff61f7')
md5sums_i686=('8a4015213c4a8f1c80e9520d04a32a7b')
md5sums_x86_64=('ad7a0b1855b3913390fb75b4cc3a26dc')
[[ $_pkg = NVIDIA-Linux-x86_64-$pkgver ]] && md5sums_x86_64=('a7ca202401b5fd27f04f89c0dedaaf59')

# Auto-detect patches (e.g. nvidia-linux-4.1.patch)
for _patch in $(ls "$startdir"/*.patch 2>/dev/null); do
  source+=("$_patch")
  md5sums+=('SKIP')
done

_create_links() {
  # create missing soname links
  for _lib in $(find "$pkgdir" -name '*.so*' | grep -v 'xorg/'); do
    # Get soname/base name
    _soname=$(dirname "$_lib")/$(readelf -d "$_lib" | grep -Po 'SONAME.*: \[\K[^]]*' || true)
    _base=$(echo "$_soname" | sed -r 's/(.*).so.*/\1.so/')

    # Create missing links
    [[ -e $_soname ]] || ln -s $(basename "$_lib") "$_soname"
    [[ -e $_base ]] || ln -s $(basename "$_soname") "$_base"
  done
}

prepare() {
  # Remove previous builds
  if [[ -d $_pkg ]]; then
    rm -rf $_pkg
  fi

  # Extract
  msg2 "Self-Extracting $_pkg.run..."
  sh $_pkg.run -x
  cd $_pkg
  bsdtar -xf nvidia-persistenced-init.tar.bz2

  # Loop patches
  for _patch in $(ls "$srcdir"/*.patch 2>/dev/null); do
    # Version variables
    _kernel=$(cat /usr/lib/modules/extramodules-*-ARCH/version)
    _major_patch=$(echo $_patch | grep -Po "\d+\.\d+")
      
    # Check version
    if (( $(vercmp $_kernel $_major_patch) >= 0 )); then
      msg2 "Applying $_patch..."
      patch -p1 -i "$_patch"
    fi
  done
}

build() {
  # Version of 'linux'
  _major=$(pacman -Q linux | grep -Po "\d+\.\d+")
  _extramodules=extramodules-$_major-ARCH
  _kernel=$(cat /usr/lib/modules/$_extramodules/version)

  # Build module
  cd $_pkg/kernel
  msg2 "Building Nvidia module for $_kernel..."
  make SYSSRC=/usr/lib/modules/$_kernel/build module
}

package_opencl-nvidia-full-beta() {
  pkgdesc="NVIDIA's OpenCL implemention for 'nvidia-utils-full-beta'"
  depends=('libcl' 'zlib')
  optdepends=('opencl-headers: headers necessary for OpenCL development')
  provides=('opencl-nvidia')
  conflicts=('opencl-nvidia')
  cd $_pkg

  # OpenCL
  install -Dm644 nvidia.icd "$pkgdir"/etc/OpenCL/vendors/nvidia.icd
  install -Dm755 libnvidia-compiler.so.$pkgver "$pkgdir"/usr/lib/libnvidia-compiler.so.$pkgver
  install -Dm755 libnvidia-opencl.so.$pkgver "$pkgdir"/usr/lib/libnvidia-opencl.so.$pkgver

  # create missing soname links
  _create_links

  # License (link)
  install -d "$pkgdir"/usr/share/licenses/
  ln -s nvidia/ "$pkgdir"/usr/share/licenses/opencl-nvidia
}

package_nvidia-libgl-full-beta() {
  pkgdesc="NVIDIA driver library symlinks for 'nvidia-utils-full-beta'"
  depends=('nvidia-utils-full-beta')
  provides=('libgl' 'nvidia-libgl')
  conflicts=('libgl' 'nvidia-libgl' 'mesa<10.1.0-2')
  cd $_pkg

  # GLX extension for X (link)
  install -d "$pkgdir"/usr/lib/xorg/modules/extensions/
  ln -s /usr/lib/nvidia/xorg/modules/extensions/libglx.so.$pkgver \
        "$pkgdir"/usr/lib/xorg/modules/extensions/libglx.so.$pkgver
  ln -s libglx.so.$pkgver "$pkgdir"/usr/lib/xorg/modules/extensions/libglx.so.1
  ln -s libglx.so.$pkgver "$pkgdir"/usr/lib/xorg/modules/extensions/libglx.so

  # libGL (link)
  ln -s /usr/lib/nvidia/libGL.so.$pkgver "$pkgdir"/usr/lib/libGL.so.$pkgver
  ln -s libGL.so.$pkgver "$pkgdir"/usr/lib/libGL.so.1
  ln -s libGL.so.$pkgver "$pkgdir"/usr/lib/libGL.so

  # GLX (link)
  ln -s /usr/lib/nvidia/libGLX.so.0 "$pkgdir"/usr/lib/libGLX.so.0
  ln -s libGLX.so.0 "$pkgdir"/usr/lib/libGLX.so.$pkgver
  ln -s libGLX.so.0 "$pkgdir"/usr/lib/libGLX.so
  ln -s libGLX_nvidia.so.$pkgver "$pkgdir"/usr/lib/libGLX_indirect.so.0

  # EGL (link)
  ln -s /usr/lib/nvidia/libEGL.so.1 "$pkgdir"/usr/lib/libEGL.so.1
  ln -s libEGL.so.1 "$pkgdir"/usr/lib/libEGL.so.$pkgver
  ln -s libEGL.so.1 "$pkgdir"/usr/lib/libEGL.so

  # OpenGL ES 1 (link)
  ln -s /usr/lib/nvidia/libGLESv1_CM.so.1 "$pkgdir"/usr/lib/libGLESv1_CM.so.1
  ln -s libGLESv1_CM.so.1 "$pkgdir"/usr/lib/libGLESv1_CM.so.$pkgver
  ln -s libGLESv1_CM.so.1 "$pkgdir"/usr/lib/libGLESv1_CM.so

  # OpenGL ES 2 (link)
  ln -s /usr/lib/nvidia/libGLESv2.so.2 "$pkgdir"/usr/lib/libGLESv2.so.2
  ln -s libGLESv2.so.2 "$pkgdir"/usr/lib/libGLESv2.so.$pkgver
  ln -s libGLESv2.so.2 "$pkgdir"/usr/lib/libGLESv2.so

  # VDPAU (link)
  ln -s /usr/lib/vdpau/libvdpau_nvidia.so.$pkgver "$pkgdir"/usr/lib/libvdpau_nvidia.so
  
  # License (link)
  install -d "$pkgdir"/usr/share/licenses/
  ln -s nvidia/ "$pkgdir"/usr/share/licenses/nvidia-libgl
}

package_nvidia-utils-full-beta() {
  pkgdesc="NVIDIA driver utilities and libraries for 'nvidia-full-beta'"
  depends=('xorg-server')
  optdepends=('gtk2: nvidia-settings (GTK+ v2)'
              'gtk3: nvidia-settings (GTK+ v3)'
              'opencl-nvidia-full-beta: OpenCL support'
              'xorg-server-devel: nvidia-xconfig')
  provides=("nvidia-utils=$pkgver" 'nvidia-settings' 'libglvnd')
  conflicts=('nvidia-utils' 'nvidia-settings' 'libglvnd')
  backup=('etc/X11/xorg.conf.d/20-nvidia.conf')
  install=$pkgname.install
  cd $_pkg

  # X driver
  install -Dm755 nvidia_drv.so "$pkgdir"/usr/lib/xorg/modules/drivers/nvidia_drv.so

  # GLX extension for X
  install -Dm755 libglx.so.$pkgver "$pkgdir"/usr/lib/nvidia/xorg/modules/extensions/libglx.so.$pkgver
  ln -s libglx.so.$pkgver "$pkgdir"/usr/lib/nvidia/xorg/modules/extensions/libglx.so

  # libGL & OpenGL
  install -Dm755 libGL.so.$pkgver "$pkgdir"/usr/lib/nvidia/libGL.so.$pkgver
  install -Dm755 libGLdispatch.so.0 "$pkgdir"/usr/lib/libGLdispatch.so.0
  install -Dm755 libnvidia-glcore.so.$pkgver "$pkgdir"/usr/lib/libnvidia-glcore.so.$pkgver
  install -Dm755 libOpenGL.so.0 "$pkgdir"/usr/lib/libOpenGL.so.0

  # GLX
  install -Dm755 libGLX.so.0 "$pkgdir"/usr/lib/nvidia/libGLX.so.0
  install -Dm755 libGLX_nvidia.so.$pkgver "$pkgdir"/usr/lib/libGLX_nvidia.so.$pkgver

  # EGL
  install -Dm755 libEGL.so.1 "$pkgdir"/usr/lib/nvidia/libEGL.so.1
  install -Dm755 libEGL_nvidia.so.$pkgver "$pkgdir"/usr/lib/libEGL_nvidia.so.$pkgver
  install -Dm755 libnvidia-eglcore.so.$pkgver "$pkgdir"/usr/lib/libnvidia-eglcore.so.$pkgver
  install -Dm755 libnvidia-egl-wayland.so.$pkgver "$pkgdir"/usr/lib/libnvidia-egl-wayland.so.$pkgver

  # OpenGL ES
  install -Dm755 libGLESv1_CM.so.1 "$pkgdir"/usr/lib/nvidia/libGLESv1_CM.so.1
  install -Dm755 libGLESv1_CM_nvidia.so.$pkgver "$pkgdir"/usr/lib/libGLESv1_CM_nvidia.so.$pkgver
  install -Dm755 libGLESv2.so.2 "$pkgdir"/usr/lib/nvidia/libGLESv2.so.2
  install -Dm755 libGLESv2_nvidia.so.$pkgver "$pkgdir"/usr/lib/libGLESv2_nvidia.so.$pkgver
  install -Dm755 libnvidia-glsi.so.$pkgver "$pkgdir"/usr/lib/libnvidia-glsi.so.$pkgver

  # VDPAU (Video Decode and Presentation API for Unix)
  install -Dm755 libvdpau_nvidia.so.$pkgver "$pkgdir"/usr/lib/vdpau/libvdpau_nvidia.so.$pkgver

  # GPU-accelerated video encoding
  install -Dm755 libnvidia-encode.so.$pkgver "$pkgdir"/usr/lib/libnvidia-encode.so.$pkgver

  # GTK+ for nvidia-settings
  install -Dm755 libnvidia-gtk2.so.$pkgver "$pkgdir"/usr/lib/libnvidia-gtk2.so.$pkgver
  install -Dm755 libnvidia-gtk3.so.$pkgver "$pkgdir"/usr/lib/libnvidia-gtk3.so.$pkgver

  # Component of nvidia-xconfig
  install -Dm755 libnvidia-cfg.so.$pkgver "$pkgdir"/usr/lib/libnvidia-cfg.so.$pkgver

  # CUDA (Compute Unified Device Architecture) (perform traditional CPU calculations with the GPU)
  install -Dm755 libcuda.so.$pkgver "$pkgdir"/usr/lib/libcuda.so.$pkgver
  install -Dm755 libnvcuvid.so.$pkgver "$pkgdir"/usr/lib/libnvcuvid.so.$pkgver

  # PTX JIT Compiler (Parallel Thread Execution (PTX) is a pseudo-assembly language for CUDA)
  install -Dm755 libnvidia-ptxjitcompiler.so.$pkgver "$pkgdir"/usr/lib/libnvidia-ptxjitcompiler.so.$pkgver
  
  # Fat (multiarchitecture) binary loader
  install -Dm755 libnvidia-fatbinaryloader.so.$pkgver "$pkgdir"/usr/lib/libnvidia-fatbinaryloader.so.$pkgver

  # TLS (Thread local storage) support for OpenGL libs
  install -Dm755 libnvidia-tls.so.$pkgver "$pkgdir"/usr/lib/libnvidia-tls.so.$pkgver         # Classic
  install -Dm755 tls/libnvidia-tls.so.$pkgver "$pkgdir"/usr/lib/tls/libnvidia-tls.so.$pkgver # New

  # GPU monitoring and management (1/2)
  install -Dm755 libnvidia-ml.so.$pkgver "$pkgdir"/usr/lib/libnvidia-ml.so.$pkgver

  # Vulkan icd
  install -D -m644 nvidia_icd.json "$pkgdir"/etc/vulkan/icd.d/nvidia_icd.json

  # Helper libs for approved partners' GRID remote apps
  install -Dm755 libnvidia-ifr.so.$pkgver "$pkgdir"/usr/lib/libnvidia-ifr.so.$pkgver
  install -Dm755 libnvidia-fbc.so.$pkgver "$pkgdir"/usr/lib/libnvidia-fbc.so.$pkgver

  # Not required (https://bugs.archlinux.org/task/38604):
  # - libnvidia-wfb.so.$pkgver (provided by xorg-server: https://www.archlinux.org/packages/extra/x86_64/xorg-server/)

  # create missing soname links
  _create_links

##### BINARIES AND MANPAGES #####
  
  # CUDA MPS (Multi Process Service)
  install -Dm755 nvidia-cuda-mps-control "$pkgdir"/usr/bin/nvidia-cuda-mps-control
  install -Dm644 nvidia-cuda-mps-control.1.gz "$pkgdir"/usr/share/man/man1/nvidia-cuda-mps-control.1.gz
  install -Dm755 nvidia-cuda-mps-server "$pkgdir"/usr/bin/nvidia-cuda-mps-server

  # For loading the kernel module and creating the character device files
  install -Dm4755 nvidia-modprobe "$pkgdir"/usr/bin/nvidia-modprobe
  install -Dm644 nvidia-modprobe.1.gz "$pkgdir"/usr/share/man/man1/nvidia-modprobe.1.gz

  # Daemon for maintaining persistent software state in the driver
  install -Dm755 nvidia-persistenced "$pkgdir"/usr/bin/nvidia-persistenced
  install -Dm644 nvidia-persistenced.1.gz "$pkgdir"/usr/share/man/man1/nvidia-persistenced.1.gz
  install -Dm644 nvidia-persistenced-init/systemd/nvidia-persistenced.service.template \
                 "$pkgdir"/usr/lib/systemd/system/nvidia-persistenced.service
  sed -i 's/__USER__/nvidia-persistenced/' "$pkgdir"/usr/lib/systemd/system/nvidia-persistenced.service

  # GUI for configuring the driver
  install -Dm755 nvidia-settings "$pkgdir"/usr/bin/nvidia-settings
  install -Dm644 nvidia-settings.1.gz "$pkgdir"/usr/share/man/man1/nvidia-settings.1.gz
  install -Dm644 nvidia-settings.png "$pkgdir"/usr/share/pixmaps/nvidia-settings.png
  install -Dm644 nvidia-settings.desktop "$pkgdir"/usr/share/applications/nvidia-settings.desktop
  sed -e 's:__UTILS_PATH__:/usr/bin:' \
      -e 's:__PIXMAP_PATH__:/usr/share/pixmaps:' \
      -i "$pkgdir"/usr/share/applications/nvidia-settings.desktop

  # GPU monitoring and management (2/2)
  install -Dm755 nvidia-smi "$pkgdir"/usr/bin/nvidia-smi
  install -Dm644 nvidia-smi.1.gz "$pkgdir"/usr/share/man/man1/nvidia-smi.1.gz

  # Basic control over configuration options in the driver
  install -Dm755 nvidia-xconfig "$pkgdir"/usr/bin/nvidia-xconfig
  install -Dm644 nvidia-xconfig.1.gz "$pkgdir"/usr/share/man/man1/nvidia-xconfig.1.gz

  # Debugging and bug reporting
  install -Dm755 nvidia-bug-report.sh "$pkgdir"/usr/bin/nvidia-bug-report.sh
  install -Dm755 nvidia-debugdump "$pkgdir"/usr/bin/nvidia-debugdump

##### MISCELLANEOUS #####

  # Vendor profiles
  install -Dm644 nvidia-application-profiles-$pkgver-rc \
                 "$pkgdir"/usr/share/nvidia/nvidia-application-profiles-$pkgver-rc
  install -Dm644 nvidia-application-profiles-$pkgver-key-documentation \
                 "$pkgdir"/usr/share/nvidia/nvidia-application-profiles-$pkgver-key-documentation

  # Documentation
  install -Dm644 README.txt "$pkgdir"/usr/share/doc/nvidia/README
  install -Dm644 NVIDIA_Changelog "$pkgdir"/usr/share/doc/nvidia/NVIDIA_Changelog
  cp -r html "$pkgdir"/usr/share/doc/nvidia/
  ln -s nvidia/ "$pkgdir"/usr/share/doc/nvidia-utils

  # Licenses
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/nvidia/LICENSE
  ln -s nvidia/ "$pkgdir"/usr/share/licenses/nvidia-utils

  # Disable logo splash
  install -Dm644 "$srcdir"/20-nvidia.conf "$pkgdir"/etc/X11/xorg.conf.d/20-nvidia.conf

  # Distro-specific files must be installed in /usr/share/X11/xorg.conf.d
  install -Dm644 nvidia-drm-outputclass.conf "$pkgdir"/usr/share/X11/xorg.conf.d/nvidia-drm-outputclass.conf
}

package_nvidia-full-beta() {
  pkgdesc="Full NVIDIA driver package for Arch's official 'linux' package (driver, utilities, and libraries) (beta version)"
  depends=('linux' "nvidia-utils-full-beta>=$pkgver" 'libgl')
  provides=('nvidia')
  conflicts=('nvidia-96xx' 'nvidia-173xx' 'nvidia')
  install=$pkgname.install
  
  # Version of 'linux'
  _major=$(pacman -Q linux | grep -Po "\d+\.\d+")
  _extramodules=extramodules-$_major-ARCH

  # Install
  install -Dm644 $_pkg/kernel/nvidia.ko \
         "$pkgdir"/usr/lib/modules/$_extramodules/nvidia.ko

  # Install UVM Module: http://devblogs.nvidia.com/parallelforall/unified-memory-in-cuda-6/
  if [[ $CARCH = x86_64 ]]; then
    install -Dm644 $_pkg/kernel/nvidia-uvm.ko \
           "$pkgdir"/usr/lib/modules/$_extramodules/nvidia-uvm.ko
  fi

  # Install Modeset module:
  #
  # "nvidia-modeset.ko does not provide any new user-visible functionality or interfaces to third party applications.
  #  However, in a later release, nvidia-modeset.ko will be used as a basis for the modesetting interface provided by
  #  the kernel's direct rendering manager (DRM)."
  install -Dm644 $_pkg/kernel/nvidia-modeset.ko \
         "$pkgdir"/usr/lib/modules/$_extramodules/nvidia-modeset.ko

  # Install DRM module ("registers as a DRM driver with both PRIME and DRM KMS support")
  install -Dm644 $_pkg/kernel/nvidia-drm.ko \
         "$pkgdir"/usr/lib/modules/$_extramodules/nvidia-drm.ko

  # Compress
  gzip "$pkgdir"/usr/lib/modules/$_extramodules/nvidia*.ko

  # Write _extramodules to .install
  sed -i "s/_extramodules='.*'/_extramodules='$_extramodules'/" "$startdir"/$install

  # Blacklist Nouveau
  install -d "$pkgdir"/usr/lib/modprobe.d/
  echo "blacklist nouveau" >> "$pkgdir"/usr/lib/modprobe.d/nvidia.conf
}

package_lib32-opencl-nvidia-full-beta() {
  pkgdesc="NVIDIA's OpenCL implemention for 'lib32-nvidia-utils-full-beta' "
  depends=('lib32-libcl' 'lib32-zlib' 'lib32-gcc-libs')
  optdepends=('opencl-headers: headers necessary for OpenCL development')
  provides=('lib32-opencl-nvidia')
  conflicts=('lib32-opencl-nvidia')
  cd $_pkg

  # OpenCL
  install -Dm755 32/libnvidia-compiler.so.$pkgver "$pkgdir"/usr/lib32/libnvidia-compiler.so.$pkgver
  install -Dm755 32/libnvidia-opencl.so.$pkgver "$pkgdir"/usr/lib32/libnvidia-opencl.so.$pkgver

  # create missing soname links
  _create_links

  # License (link)
  install -d "$pkgdir"/usr/share/licenses/
  ln -s nvidia-utils/ "$pkgdir"/usr/share/licenses/lib32-opencl-nvidia
}

package_lib32-nvidia-libgl-full-beta() {
  pkgdesc="NVIDIA driver library symlinks for 'lib32-nvidia-utils-full-beta'"
  depends=('lib32-nvidia-utils-full-beta')
  provides=('lib32-libgl' 'lib32-nvidia-libgl')
  conflicts=('lib32-libgl' 'lib32-nvidia-libgl' 'lib32-mesa<10.1.0-2')
  cd $_pkg

  # libGL (link)
  install -d "$pkgdir"/usr/lib32/
  ln -s /usr/lib32/nvidia/libGL.so.$pkgver "$pkgdir"/usr/lib32/libGL.so.$pkgver
  ln -s libGL.so.$pkgver "$pkgdir"/usr/lib32/libGL.so.1
  ln -s libGL.so.$pkgver "$pkgdir"/usr/lib32/libGL.so

  # GLX (link)
  ln -s /usr/lib32/nvidia/libGLX.so.0 "$pkgdir"/usr/lib32/libGLX.so.0
  ln -s libGLX.so.0 "$pkgdir"/usr/lib32/libGLX.so.$pkgver
  ln -s libGLX.so.0 "$pkgdir"/usr/lib32/libGLX.so
  ln -s libGLX_nvidia.so.$pkgver "$pkgdir"/usr/lib32/libGLX_indirect.so.0

  # EGL (link)	
  ln -s /usr/lib32/nvidia/libEGL.so.1 "$pkgdir"/usr/lib32/libEGL.so.1
  ln -s libEGL.so.1 "$pkgdir"/usr/lib32/libEGL.so.$pkgver
  ln -s libEGL.so.1 "$pkgdir"/usr/lib32/libEGL.so

  # OpenGL ES 1 (link)
  ln -s /usr/lib32/nvidia/libGLESv1_CM.so.1 "$pkgdir"/usr/lib32/libGLESv1_CM.so.1
  ln -s libGLESv1_CM.so.1 "$pkgdir"/usr/lib32/libGLESv1_CM.so.$pkgver
  ln -s libGLESv1_CM.so.1 "$pkgdir"/usr/lib32/libGLESv1_CM.so

  # OpenGL ES 2 (link)
  ln -s /usr/lib32/nvidia/libGLESv2.so.2 "$pkgdir"/usr/lib32/libGLESv2.so.2
  ln -s libGLESv2.so.2 "$pkgdir"/usr/lib32/libGLESv2.so.$pkgver
  ln -s libGLESv2.so.2 "$pkgdir"/usr/lib32/libGLESv2.so

  # VDPAU (link)
  ln -s /usr/lib32/vdpau/libvdpau_nvidia.so.$pkgver "$pkgdir"/usr/lib32/libvdpau_nvidia.so

  # License (link)
  install -d "$pkgdir"/usr/share/licenses/
  ln -s nvidia-utils/ "$pkgdir"/usr/share/licenses/lib32-nvidia-libgl
}

package_lib32-nvidia-utils-full-beta() {
  pkgdesc="NVIDIA driver utilities and libraries for 'nvidia-full-beta' (32-bit)"
  depends=('lib32-zlib' 'lib32-gcc-libs')
  optdepends=('lib32-opencl-nvidia-full-beta: OpenCL support')
  provides=("lib32-nvidia-utils=$pkgver" 'lib32-libglvnd')
  conflicts=('lib32-nvidia-utils' 'lib32-libglvnd')
  cd $_pkg

  # libGL & OpenGL
  install -Dm755 32/libGL.so.$pkgver "$pkgdir"/usr/lib32/nvidia/libGL.so.$pkgver
  install -Dm755 32/libGLdispatch.so.0 "$pkgdir"/usr/lib32/libGLdispatch.so.0
  install -Dm755 32/libnvidia-glcore.so.$pkgver "$pkgdir"/usr/lib32/libnvidia-glcore.so.$pkgver
  install -Dm755 32/libOpenGL.so.0 "$pkgdir"/usr/lib32/libOpenGL.so.0

  # GLX
  install -Dm755 32/libGLX.so.0 "$pkgdir"/usr/lib32/nvidia/libGLX.so.0
  install -Dm755 32/libGLX_nvidia.so.$pkgver "$pkgdir"/usr/lib32/libGLX_nvidia.so.$pkgver

  # EGL
  install -Dm755 32/libEGL.so.1 "$pkgdir"/usr/lib32/nvidia/libEGL.so.1
  install -Dm755 32/libEGL_nvidia.so.$pkgver "$pkgdir"/usr/lib32/libEGL_nvidia.so.$pkgver
  install -Dm755 32/libnvidia-eglcore.so.$pkgver "$pkgdir"/usr/lib32/libnvidia-eglcore.so.$pkgver

  # OpenGL ES
  install -Dm755 32/libGLESv1_CM.so.1 "$pkgdir"/usr/lib32/nvidia/libGLESv1_CM.so.1
  install -Dm755 32/libGLESv1_CM_nvidia.so.$pkgver "$pkgdir"/usr/lib32/libGLESv1_CM_nvidia.so.$pkgver
  install -Dm755 32/libGLESv2.so.2 "$pkgdir"/usr/lib32/nvidia/libGLESv2.so.2
  install -Dm755 32/libGLESv2_nvidia.so.$pkgver "$pkgdir"/usr/lib32/libGLESv2_nvidia.so.$pkgver
  install -Dm755 32/libnvidia-glsi.so.$pkgver "$pkgdir"/usr/lib32/libnvidia-glsi.so.$pkgver

  # VDPAU (Video Decode and Presentation API for Unix)
  install -Dm755 32/libvdpau_nvidia.so.$pkgver "$pkgdir"/usr/lib32/vdpau/libvdpau_nvidia.so.$pkgver

  # GPU-accelerated video encoding
  install -Dm755 32/libnvidia-encode.so.$pkgver "$pkgdir"/usr/lib32/libnvidia-encode.so.$pkgver

  # CUDA (Compute Unified Device Architecture)
  install -Dm755 32/libcuda.so.$pkgver "$pkgdir"/usr/lib32/libcuda.so.$pkgver
  install -Dm755 32/libnvcuvid.so.$pkgver "$pkgdir"/usr/lib32/libnvcuvid.so.$pkgver

  # PTX JIT Compiler (Parallel Thread Execution (PTX) is a pseudo-assembly language for CUDA)
  install -Dm755 32/libnvidia-ptxjitcompiler.so.$pkgver "$pkgdir"/usr/lib32/libnvidia-ptxjitcompiler.so.$pkgver
  
  # Fat (multiarchitecture) binary loader
  install -Dm755 32/libnvidia-fatbinaryloader.so.$pkgver "$pkgdir"/usr/lib32/libnvidia-fatbinaryloader.so.$pkgver

  # TLS (Thread local storage) support for OpenGL libs
  install -Dm755 32/libnvidia-tls.so.$pkgver "$pkgdir"/usr/lib32/libnvidia-tls.so.$pkgver         # Classic
  install -Dm755 32/tls/libnvidia-tls.so.$pkgver "$pkgdir"/usr/lib32/tls/libnvidia-tls.so.$pkgver # New

  # GPU monitoring and management
  install -Dm755 32/libnvidia-ml.so.$pkgver "$pkgdir"/usr/lib32/libnvidia-ml.so.$pkgver

  # Helper libs for approved partners' GRID remote apps
  install -Dm755 32/libnvidia-ifr.so.$pkgver "$pkgdir"/usr/lib32/libnvidia-ifr.so.$pkgver
  install -Dm755 32/libnvidia-fbc.so.$pkgver "$pkgdir"/usr/lib32/libnvidia-fbc.so.$pkgver

  # Not required (https://bugs.archlinux.org/task/38604):
  # - libnvidia-wfb.so.$pkgver (provided by xorg-server: https://www.archlinux.org/packages/extra/x86_64/xorg-server/)

  # create missing soname links
  _create_links

  # License (link)
  install -d "$pkgdir"/usr/share/licenses/
  ln -s nvidia-utils/ "$pkgdir"/usr/share/licenses/lib32-nvidia-utils
}