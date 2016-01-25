# Maintainer: nemesys <nemstar AT zoho DOT com
# Contributor: graysky <graysky AT archlnux.us>
# Contributor: A.J. Korf <jacobkorf at gmail dot com>
# Contrubutor: Thomas Baechler <thomas@archlinux.org>

pkgname=nvidia-ck-fbcondecor
pkgver=361.18
_extramodules=extramodules-4.3-ck-fbcondecor
pkgrel=1
_pkgdesc="NVIDIA drivers for linux-ck-fbcondecor."
pkgdesc="$_pkgdesc"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
license=('custom:NVIDIA')
depends=('linux-ck-fbcondecor' "libgl" "nvidia-utils")
makedepends=('linux-ck-fbcondecor-headers' 'pacman>=4.2.0')
conflicts=('nvidia-340xx-ck' 'nvidia-304xx-ck' 'nvidia-275xx-ck' 'nvidia-319-ck' 'nvidia-96xx-ck' 'nvidia-beta-ck' 'nvidia-ck-atom' 'nvidia-ck-barcelona' 'nvidia-ck-bulldozer' 'nvidia-ck-corex' 'nvidia-ck-core2' 'nvidia-ck-haswell' 'nvidia-ck-ivybridge' 'nvidia-ck-kx' 'nvidia-ck-k10' 'nvidia-ck-nehalem' 'nvidia-ck-p4' 'nvidia-ck-piledriver' 'nvidia-ck-pentm' 'nvidia-ck-sandybridge' 'nvidia-304xx-ck-atom' 'nvidia-304xx-ck-barcelona' 'nvidia-304xx-ck-corex' 'nvidia-304xx-ck-core2' 'nvidia-304xx-ck-haswell' 'nvidia-304xx-ck-ivybridge' 'nvidia-304xx-ck-kx' 'nvidia-304xx-ck-k10' 'nvidia-304xx-ck-nehalem' 'nvidia-304xx-ck-p4' 'nvidia-304xx-ck-piledriver' 'nvidia-304xx-ck-pentm' 'nvidia-304xx-ck-sandybridge' 'nvidia-340xx-ck-atom' 'nvidia-340xx-ck-barcelona' 'nvidia-340xx-ck-bulldozer' 'nvidia-340xx-ck-core2' 'nvidia-340xx-ck-haswell' 'nvidia-340xx-ck-ivybridge' 'nvidia-340xx-ck-kx' 'nvidia-340xx-ck-k10' 'nvidia-340xx-ck-nehalem' 'nvidia-340xx-ck-p4' 'nvidia-340xx-ck-piledriver' 'nvidia-340xx-ck-pentm' 'nvidia-340xx-ck-sandybridge' 'nvidia-ck' 'nvidia')
#groups=('ck-generic')
#replaces=()
options=(!strip)
install=nvidia-ck-fbcondecor.install
# Installer name
case "$CARCH" in
  i686)   _pkg="NVIDIA-Linux-x86-$pkgver" ;;
  x86_64) _pkg="NVIDIA-Linux-x86_64-$pkgver-no-compat32" ;;
esac

# Source
source_i686=("http://us.download.nvidia.com/XFree86/Linux-x86/$pkgver/NVIDIA-Linux-x86-$pkgver.run")
source_x86_64=("http://us.download.nvidia.com/XFree86/Linux-x86_64/$pkgver/NVIDIA-Linux-x86_64-$pkgver-no-compat32.run")
md5sums_i686=('ade4f7d0a5631ff492088671bc303a0a')
md5sums_x86_64=('29a88f1538d622cebf751593396053e4')

# Auto-detect patches (e.g. nvidia-linux-4.3.patch)
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

  # Loop patches
  for _patch in $(ls "$srcdir"/*.patch 2>/dev/null); do
    # Version variables
    _kernel=$(cat /usr/lib/modules/$_extramodules/version)
    _major_patch=$(echo $_patch | grep -Po "\d+\.\d+")
      
    # Check version
    if (( $(vercmp $_kernel $_major_patch) >= 0 )); then
      msg2 "Applying ${_patch##*/}..."
      patch -p1 -i "$_patch"
    fi
  done
}

build() {
  # Version of 'linux'
  _major=$(pacman -Q linux | grep -Po "\d+\.\d+")
  _kernel=$(cat /usr/lib/modules/$_extramodules/version)

  # Build module
  cd $_pkg/kernel
  msg2 "Building Nvidia module for $_kernel..."
  make SYSSRC=/usr/lib/modules/$_kernel/build module
}

package() {
  # Version of 'linux'
  _major=$(pacman -Q linux | grep -Po "\d+\.\d+")

  # Install
  install -Dm644 $_pkg/kernel/nvidia.ko \
         "$pkgdir"/usr/lib/modules/$_extramodules/nvidia.ko

  # Install UVM Module: http://devblogs.nvidia.com/parallelforall/unified-memory-in-cuda-6/
  if [[ $CARCH = x86_64 ]]; then
    install -Dm644 $_pkg/kernel/nvidia-uvm.ko \
            "$pkgdir/usr/lib/modules/$_extramodules/nvidia-uvm.ko"
  fi

  # Install Modeset module:
  #
  # "nvidia-modeset.ko does not provide any new user-visible functionality or interfaces to third party applications.
  #  However, in a later release, nvidia-modeset.ko will be used as a basis for the modesetting interface provided by
  #  the kernel's direct rendering manager (DRM)."
  install -Dm644 $_pkg/kernel/nvidia-modeset.ko \
         "$pkgdir"/usr/lib/modules/$_extramodules/nvidia-modeset.ko

  # Compress
  gzip "$pkgdir"/usr/lib/modules/$_extramodules/nvidia*.ko

  # Write _extramodules to .install
  sed -i "s/_extramodules='.*'/_extramodules='$_extramodules'/" "$startdir"/$install

  # Blacklist Nouveau
  install -d "$pkgdir"/usr/lib/modprobe.d/
  echo "blacklist nouveau" >> "$pkgdir"/usr/lib/modprobe.d/nvidia.conf
}
