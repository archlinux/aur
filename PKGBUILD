# Maintainer: Det <nimetonmaili g-mail>
# Contributors: Ng Oon-Ee, Dan Vratil
# Based on [extra]'s nvidia: https://www.archlinux.org/packages/extra/x86_64/nvidia/

pkgname=nvidia-beta
pkgver=352.21
pkgrel=1
pkgdesc="NVIDIA driver for linux (beta)"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
license=('custom:NVIDIA')
depends=('linux' "nvidia-utils-beta=$pkgver" 'libgl')
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
md5sums_i686=('c91760a04f658845722380f6c7fd4709')
md5sums_x86_64=('4eea308a1b04553f720f82fd2fac79d3')

# Auto-detect patches
source=($(ls *.patch 2>/dev/null))
md5sums=('SKIP')

prepare() {
  # Remove previous builds
  if [[ -d $_pkg ]]; then
    rm -rf $_pkg
  fi

  # Extract
  msg2 "Self-Extracting $_pkg.run..."
  sh $_pkg.run -x
  cd $_pkg

  # Patch
  if [[ $(ls "$srcdir"/*.patch 2>/dev/null) ]]; then
    # Loop
    for _patch in "$srcdir"/*.patch; do
      # Version variables
      _kernel=$(cat /usr/lib/modules/extramodules-*-ARCH/version)
      _major_patch=$(echo $_patch | grep -Po "\d+\.\d+")
      
      # Check version
      if (( $(vercmp $_kernel $_major_patch) >= 0 )); then
        msg2 "Applying ${_patch##*/}..."
        patch -p1 -i "$_patch"
      fi
    done
  fi
}

build() {
  # Version of 'linux'
  _major=$(pacman -Q linux | grep -Po "\d+\.\d+")
  _extramodules=extramodules-$_major-ARCH
  _kernel=$(cat /usr/lib/modules/$_extramodules/version)

  # Main module
  cd $_pkg/kernel
  msg2 "Building Nvidia module for $_kernel..."
  make SYSSRC=/usr/lib/modules/$_kernel/build module

  # Unified memory: http://devblogs.nvidia.com/parallelforall/unified-memory-in-cuda-6/
  if [[ $CARCH = x86_64 ]]; then
    cd uvm
    msg2 "Building Unified memory module for $_kernel..."
    make SYSSRC=/usr/lib/modules/$_kernel/build module
  fi
}

package() {
  # Version of 'linux'
  _major=$(pacman -Q linux | grep -Po "\d+\.\d+")
  _extramodules=extramodules-$_major-ARCH

  # Install
  install -Dm644 $_pkg/kernel/nvidia.ko \
         "$pkgdir"/usr/lib/modules/$_extramodules/nvidia.ko

  # Unified memory
  if [[ $CARCH = x86_64 ]]; then
    install -Dm644 $_pkg/kernel/uvm/nvidia-uvm.ko \
          "$pkgdir/usr/lib/modules/$_extramodules/nvidia-uvm.ko"
  fi

  # Compress
  gzip "$pkgdir"/usr/lib/modules/$_extramodules/nvidia*.ko

  # Write _extramodules to .install
  sed -i "s/_extramodules='.*'/_extramodules='$_extramodules'/" "$startdir"/$install

  # Blacklist Nouveau
  install -d "$pkgdir"/usr/lib/modprobe.d/
  echo "blacklist nouveau" >> "$pkgdir"/usr/lib/modprobe.d/nvidia.conf
}