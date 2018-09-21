# Maintainer : Daniel Bermond < yahoo-com: danielbermond >
# Contributor: Det <nimetonmaili g-mail>
# Contributor: Ng Oon-Ee
# Based on nvidia-beta: https://aur.archlinux.org/packages/nvidia-beta/

pkgname=nvidia-beta-all
pkgver=410.57
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
sha256sums=('1ad40d83ec712843c1b5593949abefc9093399fb26a418ae9a571fbd1d9b228e')

# Patches
## restore phys_to_dma support
## https://bugs.archlinux.org/task/58074
source+=('linux-4.16.patch')
sha256sums+=('622ac792ec200b2239cb663c0010392118b78c9904973d82cd261165c16d6385')

# Auto-add *.patch files from $startdir to source=()
for _patch in $(find "$startdir" -maxdepth 1 -name '*.patch' -printf "%f\n"); do
  # Don't duplicate already listed ones
  if [[ ! " ${source[@]} " =~ " $_patch " ]]; then  # https://stackoverflow.com/a/15394738/1821548
    source+=("$_patch")
    sha256sums+=('SKIP')
  fi
done

prepare() {
  # Remove previous builds
  [[ -d $_pkg ]] && rm -rf $_pkg

  # Extract
  msg2 "Self-Extracting $_pkg.run..."
  sh $_pkg.run -x
  cd $_pkg

  # Loop kernels (e.g. 4.18.3-arch1-1-ARCH)
  for _kernel in $(cat /usr/lib/modules/extramodules-*/version); do
    # Use separate source directories
    cp -r kernel kernel-$_kernel

    # Loop patches (e.g. linux-4.18.patch, lol.patch, ...)
    for _patch in $(printf -- '%s\n' ${source[@]} | grep .patch); do  # https://stackoverflow.com/a/21058239/1821548
      # Get patch version (if any) from filename
      _patchver=$(echo $_patch | grep -Po "\d+\.\d+")

      # Cd in place
      cd kernel-$_kernel

      # Compare versions
      if (( $(vercmp "$_kernel" "$_patchver") >= 0 )); then
        msg2 "Applying $_patch for $_kernel..."
        patch -p2 -i "$srcdir"/$_patch
      else
        msg2 "Skipping $_patch..."  # List these, instead of ignoring silently
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

  # License
  install -Dm644 $_pkg/LICENSE "$pkgdir"/usr/share/licenses/nvidia/LICENSE
}
