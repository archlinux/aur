# Maintainer: Det <nimetonmaili g-mail>
# Contributors: Ng Oon-Ee, Dan Vratil
# Based on [extra]'s nvidia-utils: https://www.archlinux.org/packages/extra/x86_64/nvidia-utils/

pkgname=('nvidia-utils-beta' 'nvidia-egl-wayland-beta' 'nvidia-libgl-beta' 'opencl-nvidia-beta')
pkgver=378.09
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
license=('custom:NVIDIA')
options=('!strip')

# Installer name
case "$CARCH" in
  i686)   _pkg="NVIDIA-Linux-x86-$pkgver" ;;
  x86_64) _pkg="NVIDIA-Linux-x86_64-$pkgver-no-compat32" ;;
esac

# Source
source=('20-nvidia.conf')
source_i686=("http://us.download.nvidia.com/XFree86/Linux-x86/$pkgver/NVIDIA-Linux-x86-$pkgver.run")
source_x86_64=("http://us.download.nvidia.com/XFree86/Linux-x86_64/$pkgver/NVIDIA-Linux-x86_64-$pkgver-no-compat32.run")
md5sums=('2640eac092c220073f0668a7aaff61f7')
md5sums_i686=('a55ef673b805549cd72f2e9d5b7a844a')
md5sums_x86_64=('6e3fe1150fb70c1dabd113e613186cfd')

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
}

package_opencl-nvidia-beta() {
  pkgdesc="NVIDIA's OpenCL implemention for 'nvidia-utils-beta'"
  depends=('zlib')
  optdepends=('opencl-headers: headers necessary for OpenCL development')
  provides=('opencl-nvidia' 'opencl-driver')
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

package_nvidia-libgl-beta() {
  pkgdesc="NVIDIA driver library symlinks for 'nvidia-utils-beta'"
  depends=('nvidia-utils-beta')
  provides=('nvidia-libgl' 'libgl' 'libegl' 'libgles')
  conflicts=('nvidia-libgl' 'libgl' 'libegl' 'libgles')
  cd $_pkg

  # GLX extension for X (link)
  install -d "$pkgdir"/usr/lib/xorg/modules/extensions/
  ln -s /usr/lib/nvidia/xorg/modules/extensions/libglx.so.$pkgver \
        "$pkgdir"/usr/lib/xorg/modules/extensions/libglx.so.$pkgver
  ln -s libglx.so.$pkgver "$pkgdir"/usr/lib/xorg/modules/extensions/libglx.so.1
  ln -s libglx.so.$pkgver "$pkgdir"/usr/lib/xorg/modules/extensions/libglx.so

  # libGL (link)
  ln -s /usr/lib/nvidia/libGL.so.1.0.0 "$pkgdir"/usr/lib/libGL.so.1.0.0
  ln -s libGL.so.1.0.0 "$pkgdir"/usr/lib/libGL.so.1
  ln -s libGL.so.1.0.0 "$pkgdir"/usr/lib/libGL.so

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

package_nvidia-egl-wayland-beta() {
  pkgdesc="NVIDIA EGL Wayland library (libnvidia-egl-wayland.so.1.0.0) for 'nvidia-utils-beta'"
  depends=('nvidia-utils-beta')
  provides=('egl-wayland')
  conflicts=('egl-wayland')
  cd $_pkg

  install -Dm755 libnvidia-egl-wayland.so.1.0.0 "$pkgdir"/usr/lib/libnvidia-egl-wayland.so.1.0.0
  ln -s libnvidia-egl-wayland.so.1.0.0 "$pkgdir"/usr/lib/libnvidia-egl-wayland.so
  ln -s libnvidia-egl-wayland.so.1.0.0 "$pkgdir"/usr/lib/libnvidia-egl-wayland.so.1
}

package_nvidia-utils-beta() {
  pkgdesc="NVIDIA driver utilities and libraries (beta version)"
  depends=('xorg-server')
  optdepends=('gtk2: nvidia-settings (GTK+ v2)'
              'gtk3: nvidia-settings (GTK+ v3)'
              'opencl-nvidia-beta: OpenCL support'
              'xorg-server-devel: nvidia-xconfig'
              'egl-wayland-git: for alternative, more advanced Wayland library (libnvidia-egl-wayland.so.1.0.0)')
  provides=("nvidia-utils=$pkgver" 'nvidia-settings' 'libglvnd' 'vulkan-driver')
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
  install -Dm755 libGL.so.1.0.0 "$pkgdir"/usr/lib/nvidia/libGL.so.1.0.0
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
  install -Dm644 10_nvidia.json "$pkgdir"/usr/share/glvnd/egl_vendor.d/10_nvidia.json
  install -Dm644 10_nvidia_wayland.json "$pkgdir"/usr/share/glvnd/egl_vendor.d/10_nvidia_wayland.json

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
  install -Dm644 nvidia_icd.json "$pkgdir"/usr/share/vulkan/icd.d/nvidia_icd.json

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
