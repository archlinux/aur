# Maintainer: Det <nimetonmaili g-mail>
# Contributors: Ng Oon-Ee, Dan Vratil, Jeremy Sands, Erik Hardesty, josephgbr
# Based on [multilib]'s lib32-nvidia-utils: https://www.archlinux.org/packages/multilib/x86_64/lib32-nvidia-utils/

pkgname=('lib32-nvidia-utils-beta' 'lib32-nvidia-libgl-beta' 'lib32-opencl-nvidia-beta')
pkgver=378.09
pkgrel=1
arch=('x86_64')
url="http://www.nvidia.com/"
makedepends=('nvidia-libgl-beta')  # To avoid conflict during installation in the build chroot
license=('custom:NVIDIA')
options=('!strip')
_pkg="NVIDIA-Linux-x86-$pkgver"
source=("http://us.download.nvidia.com/XFree86/Linux-x86/$pkgver/$_pkg.run")
md5sums=('a55ef673b805549cd72f2e9d5b7a844a')

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
}

package_lib32-opencl-nvidia-beta() {
  pkgdesc="NVIDIA's OpenCL implemention for 'lib32-nvidia-utils-beta' "
  depends=('lib32-zlib' 'lib32-gcc-libs')
  optdepends=('opencl-headers: headers necessary for OpenCL development')
  provides=('lib32-opencl-nvidia' 'lib32-opencl-driver')
  conflicts=('lib32-opencl-nvidia')
  cd $_pkg

  # OpenCL
  install -Dm755 libnvidia-compiler.so.$pkgver "$pkgdir"/usr/lib32/libnvidia-compiler.so.$pkgver
  install -Dm755 libnvidia-opencl.so.$pkgver "$pkgdir"/usr/lib32/libnvidia-opencl.so.$pkgver

  # create missing soname links
  _create_links

  # License (link)
  install -d "$pkgdir"/usr/share/licenses/
  ln -s nvidia-utils/ "$pkgdir"/usr/share/licenses/lib32-opencl-nvidia
}

package_lib32-nvidia-libgl-beta() {
  pkgdesc="NVIDIA driver library symlinks for 'lib32-nvidia-utils-beta'"
  depends=('lib32-nvidia-utils-beta' 'nvidia-libgl-beta')
  provides=('lib32-nvidia-libgl' 'lib32-libgl' 'lib32-libegl' 'lib32-libgles')
  conflicts=('lib32-nvidia-libgl' 'lib32-libgl' 'lib32-libegl' 'lib32-libgles')
  replaces=('lib32-nvidia-utils<=313.26-1')
  cd $_pkg

  # libGL (link)
  install -d "$pkgdir"/usr/lib32/
  ln -s /usr/lib32/nvidia/libGL.so.1.0.0 "$pkgdir"/usr/lib32/libGL.so.1.0.0
  ln -s libGL.so.1.0.0 "$pkgdir"/usr/lib32/libGL.so.1
  ln -s libGL.so.1.0.0 "$pkgdir"/usr/lib32/libGL.so

  # GLX (link)
  ln -s /usr/lib32/nvidia/libGLX.so.0 "$pkgdir"/usr/lib32/libGLX.so.0
  ln -s libGLX.so.0 "$pkgdir"/usr/lib32/libGLX.so.$pkgver
  ln -s libGLX.so.0 "$pkgdir"/usr/lib32/libGLX.so
  ln -s libGLX_nvidia.so.$pkgver "$pkgdir"/usr/lib32/libGLX_indirect.so.0

  # EGL (link)	
  ln -s /usr/lib32/nvidia/libEGL.so.1 "$pkgdir"/usr/lib32/libEGL.so.1
  ln -s libEGL.so.1 "$pkgdir"/usr/lib32/libEGL.so.$pkgver
  ln -s libEGL.so.1 "$pkgdir"/usr/lib32/libEGL.so
  ln -s libnvidia-egl-wayland.so.1.0.0 "$pkgdir"/usr/lib32/libnvidia-egl-wayland.so.1

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

package_lib32-nvidia-utils-beta() {
  pkgdesc="NVIDIA driver utilities and libraries (beta version) (32-bit)"
  depends=('lib32-zlib' 'lib32-gcc-libs' 'nvidia-utils-beta')
  optdepends=('lib32-opencl-nvidia-beta: OpenCL support')
  provides=("lib32-nvidia-utils=$pkgver" 'lib32-libglvnd' 'lib32-vulkan-driver')
  conflicts=('lib32-nvidia-utils' 'lib32-libglvnd')
  cd $_pkg

  # libGL & OpenGL
  install -Dm755 libGL.so.1.0.0 "$pkgdir"/usr/lib32/nvidia/libGL.so.1.0.0
  install -Dm755 libGLdispatch.so.0 "$pkgdir"/usr/lib32/libGLdispatch.so.0
  install -Dm755 libnvidia-glcore.so.$pkgver "$pkgdir"/usr/lib32/libnvidia-glcore.so.$pkgver
  install -Dm755 libOpenGL.so.0 "$pkgdir"/usr/lib32/libOpenGL.so.0

  # GLX
  install -Dm755 libGLX.so.0 "$pkgdir"/usr/lib32/nvidia/libGLX.so.0
  install -Dm755 libGLX_nvidia.so.$pkgver "$pkgdir"/usr/lib32/libGLX_nvidia.so.$pkgver

  # EGL
  install -Dm755 libEGL.so.1 "$pkgdir"/usr/lib32/nvidia/libEGL.so.1
  install -Dm755 libEGL_nvidia.so.$pkgver "$pkgdir"/usr/lib32/libEGL_nvidia.so.$pkgver
  install -Dm755 libnvidia-eglcore.so.$pkgver "$pkgdir"/usr/lib32/libnvidia-eglcore.so.$pkgver
  install -Dm755 libnvidia-egl-wayland.so.1.0.0 "$pkgdir"/usr/lib32/libnvidia-egl-wayland.so.1.0.0

  # OpenGL ES
  install -Dm755 libGLESv1_CM.so.1 "$pkgdir"/usr/lib32/nvidia/libGLESv1_CM.so.1
  install -Dm755 libGLESv1_CM_nvidia.so.$pkgver "$pkgdir"/usr/lib32/libGLESv1_CM_nvidia.so.$pkgver
  install -Dm755 libGLESv2.so.2 "$pkgdir"/usr/lib32/nvidia/libGLESv2.so.2
  install -Dm755 libGLESv2_nvidia.so.$pkgver "$pkgdir"/usr/lib32/libGLESv2_nvidia.so.$pkgver
  install -Dm755 libnvidia-glsi.so.$pkgver "$pkgdir"/usr/lib32/libnvidia-glsi.so.$pkgver

  # VDPAU (Video Decode and Presentation API for Unix)
  install -Dm755 libvdpau_nvidia.so.$pkgver "$pkgdir"/usr/lib32/vdpau/libvdpau_nvidia.so.$pkgver

  # GPU-accelerated video encoding
  install -Dm755 libnvidia-encode.so.$pkgver "$pkgdir"/usr/lib32/libnvidia-encode.so.$pkgver

  # CUDA (Compute Unified Device Architecture)
  install -Dm755 libcuda.so.$pkgver "$pkgdir"/usr/lib32/libcuda.so.$pkgver
  install -Dm755 libnvcuvid.so.$pkgver "$pkgdir"/usr/lib32/libnvcuvid.so.$pkgver

  # PTX JIT Compiler (Parallel Thread Execution (PTX) is a pseudo-assembly language for CUDA)
  install -Dm755 libnvidia-ptxjitcompiler.so.$pkgver "$pkgdir"/usr/lib32/libnvidia-ptxjitcompiler.so.$pkgver
  
  # Fat (multiarchitecture) binary loader
  install -Dm755 libnvidia-fatbinaryloader.so.$pkgver "$pkgdir"/usr/lib32/libnvidia-fatbinaryloader.so.$pkgver

  # TLS (Thread local storage) support for OpenGL libs
  install -Dm755 libnvidia-tls.so.$pkgver "$pkgdir"/usr/lib32/libnvidia-tls.so.$pkgver         # Classic
  install -Dm755 tls/libnvidia-tls.so.$pkgver "$pkgdir"/usr/lib32/tls/libnvidia-tls.so.$pkgver # New

  # GPU monitoring and management
  install -Dm755 libnvidia-ml.so.$pkgver "$pkgdir"/usr/lib32/libnvidia-ml.so.$pkgver

  # Helper libs for approved partners' GRID remote apps
  install -Dm755 libnvidia-ifr.so.$pkgver "$pkgdir"/usr/lib32/libnvidia-ifr.so.$pkgver
  install -Dm755 libnvidia-fbc.so.$pkgver "$pkgdir"/usr/lib32/libnvidia-fbc.so.$pkgver

  # Not required (https://bugs.archlinux.org/task/38604):
  # - libnvidia-wfb.so.$pkgver (provided by xorg-server: https://www.archlinux.org/packages/extra/x86_64/xorg-server/)

  # create missing soname links
  _create_links

  # License (link)
  install -d "$pkgdir"/usr/share/licenses/
  ln -s nvidia-utils/ "$pkgdir"/usr/share/licenses/lib32-nvidia-utils
}
