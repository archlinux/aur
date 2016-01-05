# Maintainer: Det <nimetonmaili g-mail>
# Contributor: Ng Oon-Ee
# Based on nvidia-beta: https://aur.archlinux.org/packages/nvidia-beta/

pkgname=nvidia-beta-all
pkgver=361.16
pkgrel=1
pkgdesc="NVIDIA drivers for all kernels on the system (beta)"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
license=('custom:NVIDIA')
depends=("nvidia-utils-beta>=$pkgver" 'libgl')
makedepends=('linux-headers' 'pacman>=4.2.0')
provides=('nvidia')
conflicts=('nvidia-96xx' 'nvidia-173xx' 'nvidia')
options=('!strip')
install=$pkgname.install

# Installer name
case "$CARCH" in
  i686)   _pkg="NVIDIA-Linux-x86-$pkgver" ;;
  x86_64) _pkg="NVIDIA-Linux-x86_64-$pkgver-no-compat32" ;;
esac

# Source
source_i686=("http://us.download.nvidia.com/XFree86/Linux-x86/$pkgver/NVIDIA-Linux-x86-$pkgver.run")
source_x86_64=("http://us.download.nvidia.com/XFree86/Linux-x86_64/$pkgver/NVIDIA-Linux-x86_64-$pkgver-no-compat32.run")
md5sums_i686=('cbb48d10306d6ca49423ed80e786598e')
md5sums_x86_64=('13df10e88eb550b8d7f2e276bb5cfb57')

# Auto-detect patches (e.g. nvidia-linux-4.1.patch)
for _patch in $(ls "$startdir"/*.patch 2>/dev/null); do
  source+=("$_patch")
  md5sums+=('SKIP')
done

prepare() {
  # Remove previous builds
  if [[ -d $_pkg ]]; then
    rm -rf $_pkg
  fi

  # Extract
  msg2 "Self-Extracting $_pkg.run..."
  sh $_pkg.run -x
  cd $_pkg

  # Loop for all kernels
  for _kernel in $(cat /usr/lib/modules/extramodules-*/version); do
    # Use separate source directories
    cp -r kernel kernel-$_kernel

    # Patch?
    for _patch in $(ls "$srcdir"/*.patch 2>/dev/null); do
      # Patch version
      _major_patch=$(echo $_patch | grep -Po "\d+\.\d+")
        
      # Cd in place
      cd kernel-$_kernel

      # Check version
      if (( $(vercmp $_kernel $_major_patch) >= 0 )); then
        msg2 "Applying $_patch for $_kernel..."
        patch -p2 -i "$_patch"
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

    # Install
    install -Dm644 $_pkg/kernel-$_extramodules/nvidia.ko \
           "$pkgdir"/$_path/nvidia.ko

    # Install UVM Module: http://devblogs.nvidia.com/parallelforall/unified-memory-in-cuda-6/
    if [[ $CARCH = x86_64 ]]; then
        install -Dm644 $_pkg/kernel-$_extramodules/nvidia-uvm.ko \
               "$pkgdir"/$_path/nvidia-uvm.ko
    fi

    # Install Nvidia Modeset module:
    #
    # "nvidia-modeset.ko does not provide any new user-visible functionality or interfaces to third party applications.
    #  However, in a later release, nvidia-modeset.ko will be used as a basis for the modesetting interface provided by
    #  the kernel's direct rendering manager (DRM)."
    install -Dm644 $_pkg/kernel-$_extramodules/nvidia-modeset.ko \
           "$pkgdir"/$_path/nvidia-modeset.ko

    # Compress
    gzip "$pkgdir"/$_path/nvidia*.ko
  done

  # Blacklist Nouveau
  install -d "$pkgdir"/usr/lib/modprobe.d/
  echo "blacklist nouveau" >> "$pkgdir"/usr/lib/modprobe.d/nvidia.conf
}