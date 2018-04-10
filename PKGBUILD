# Maintainer: Det <nimetonmaili g-mail>
# Contributor: Ng Oon-Ee
# Based on nvidia-beta: https://aur.archlinux.org/packages/nvidia-beta/

pkgname=nvidia-beta-all
pkgver=396.18
pkgrel=1
pkgdesc="NVIDIA drivers for all kernels on the system (beta)"
arch=('x86_64')
url="http://www.nvidia.com/"
license=('custom:NVIDIA')
depends=("nvidia-utils-beta>=$pkgver" 'libgl')
makedepends=('linux-headers')
provides=("nvidia=$pkgver")
conflicts=('nvidia-96xx' 'nvidia-173xx' 'nvidia')
options=('!strip')
install=$pkgname.install
_pkg="NVIDIA-Linux-x86_64-$pkgver-no-compat32"
source=("http://us.download.nvidia.com/XFree86/Linux-x86_64/$pkgver/$_pkg.run")
md5sums=('d7d841c8e017e84a4f39619527855bbb')

# Patch
#source+=('linux-4.11.patch')
#md5sums+=('cc8941b6898d9daa0fb67371f57a56b6')

# Auto-add *.patch files from $startdir to source=()
for _patch in $(find "$startdir" -maxdepth 1 -name '*.patch' -printf "%f\n"); do
  # Don't duplicate already listed ones
  if [[ ! " ${source[@]} " =~ " $_patch " ]]; then  # https://stackoverflow.com/a/15394738/1821548
    source+=("$_patch")
    md5sums+=('SKIP')
  fi
done

prepare() {
  # Remove previous builds
  [[ -d $_pkg ]] && rm -rf $_pkg

  # Extract
  msg2 "Self-Extracting $_pkg.run..."
  sh $_pkg.run -x
  cd $_pkg

  # Loop kernels (4.15.0-1-ARCH, 4.14.5-1-ck, ...)
  for _kernel in $(cat /usr/lib/modules/extramodules-*/version); do
    # Use separate source directories
    cp -r kernel kernel-$_kernel

    # Loop patches (linux-4.15.patch, lol.patch, ...)
    for _p in $(printf -- '%s\n' ${source[@]} | grep .patch); do  # https://stackoverflow.com/a/21058239/1821548
      # Patch version (4.15, "", ...)
      _patch=$(echo $_p | grep -Po "\d+\.\d+")

      # Cd in place
      cd kernel-$_kernel

      # Compare versions
      if (( $(vercmp "$_kernel" "$_patch") >= 0 )); then
        msg2 "Applying $_p for $_kernel..."
        patch -p2 -i "$srcdir"/$_p
      else
        msg2 "Skipping $_p..."  # List these, instead of ignoring silently
      fi

      # Return
      cd ..
    done
  done
}

build() {
  # Build for all kernels
  for _kernel in $(cat /usr/lib/modules/extramodules-*/version); do
    cd "$srcdir"/$_pkg/kernel-$_kernel

    # Build module
    msg2 "Building Nvidia module for $_kernel..."
    make SYSSRC=/usr/lib/modules/$_kernel/build module
  done
}

package() {
  # Install for all kernels
  for _path in $(find /usr/lib/modules/extramodules-*/version -printf '%h\n'); do
    _extramodules=$(cat $_path/version)

  # Nvidia kernel module; provides low-level access to your NVIDIA hardware for the other components. Generally
  # loaded into the kernel when the X server is started, to be used by the X driver and OpenGL. Consists of two
  # pieces: the binary-only core, and a kernel interface that must be compiled specifically for your kernel version,
  # because the Linux kernel doesn't have a consistent binary interface like the X server.
  install -Dm644 $_pkg/kernel-$_extramodules/nvidia.ko \
         "$pkgdir"/$_path/nvidia.ko

  # NVIDIA Unified Memory kernel module; provides functionality for sharing memory between the CPU and GPU in
  # CUDA programs. Generally loaded into the kernel when a CUDA program is started, and used by the CUDA
  # driver on supported platforms: http://devblogs.nvidia.com/parallelforall/unified-memory-in-cuda-6/
  install -Dm644 $_pkg/kernel-$_extramodules/nvidia-uvm.ko \
         "$pkgdir"/$_path/nvidia-uvm.ko

  # Kernel module responsible for programming the display engine of the GPU. User-mode NVIDIA driver components
  # such as the NVIDIA X driver, OpenGL driver, and VDPAU driver communicate with nvidia-modeset.ko through the
  # /dev/nvidia-modeset device file.
  install -Dm644 $_pkg/kernel-$_extramodules/nvidia-modeset.ko \
         "$pkgdir"/$_path/nvidia-modeset.ko

  # NVIDIA DRM kernel module; registers as a DRM driver to provide GEM and PRIME DRM capabilities
  # for atomic DRM KMS and graphics display offload on Optimus notebooks:
  # https://devtalk.nvidia.com/default/topic/925605/linux/nvidia-364-12-release-vulkan-glvnd-drm-kms-and-eglstreams/
  install -Dm644 $_pkg/kernel-$_extramodules/nvidia-drm.ko \
         "$pkgdir"/$_path/nvidia-drm.ko

    # Compress
    gzip "$pkgdir"/$_path/nvidia*.ko
  done

  # Blacklist Nouveau
  install -d "$pkgdir"/usr/lib/modprobe.d/
  echo "blacklist nouveau" >> "$pkgdir"/usr/lib/modprobe.d/nvidia.conf
}
