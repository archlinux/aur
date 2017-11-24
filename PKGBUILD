# Maintainer: Det <nimetonmaili g-mail>
# Contributors: Ng Oon-Ee, Dan Vratil
# Based on [extra]'s nvidia: https://www.archlinux.org/packages/extra/x86_64/nvidia/

pkgname=nvidia-beta
pkgver=387.34
pkgrel=1
pkgdesc="NVIDIA driver for Arch's official 'linux' package (beta version)"
arch=('x86_64')
url="http://www.nvidia.com/"
license=('custom:NVIDIA')
depends=('linux' "nvidia-utils-beta>=$pkgver" 'libgl')
makedepends=('linux-headers')
provides=("nvidia=$pkgver")
conflicts=('nvidia-96xx' 'nvidia-173xx' 'nvidia')
options=('!strip')
install=$pkgname.install
_pkg="NVIDIA-Linux-x86_64-$pkgver-no-compat32"
source=("http://us.download.nvidia.com/XFree86/Linux-x86_64/$pkgver/$_pkg.run")
md5sums=('a009bbc502c30e4b483d71be9fa51790')

# Patch
#source+=('linux-4.11.patch')
#md5sums+=('cc8941b6898d9daa0fb67371f57a56b6')

# Auto-detect patches (e.g. linux-4.1.patch)
for _patch in $(find "$startdir" -maxdepth 1 -name '*.patch' -printf "%f\n"); do
  # Don't duplicate those already defined above
  if [[ ! ${source[@]} =~ $_patch ]]; then
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

package() {
  # Version of 'linux'
  _major=$(pacman -Q linux | grep -Po "\d+\.\d+")
  _extramodules=extramodules-$_major-ARCH

  # Install
  install -Dm644 $_pkg/kernel/nvidia.ko \
         "$pkgdir"/usr/lib/modules/$_extramodules/nvidia.ko

  # Install UVM module: http://devblogs.nvidia.com/parallelforall/unified-memory-in-cuda-6/
  install -Dm644 $_pkg/kernel/nvidia-uvm.ko \
         "$pkgdir"/usr/lib/modules/$_extramodules/nvidia-uvm.ko

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
