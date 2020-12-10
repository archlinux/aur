# Maintainer: Rohit Goswami <rohit.goswami@aol.com>
# Maintainer: Anton Kudelin <kudelin@protonmail.com>
# Contributor: eolianoe <eolianoe [at] gmail [DoT] com>

pkgname=nvhpc
_REL_YEAR=2020
_CUDA_VER=11.1
pkgver=20.11
pkgrel=1
pkgdesc='NVIDIA HPC SDK'
arch=('x86_64')
url="https://developer.nvidia.com/hpc-sdk"
license=('custom')
depends=('numactl' 'java-runtime')
makedepends=('bash')
replaces=('pgi-compilers')
conflicts=('pgi-compilers')
_pkgname="${pkgname}_${_REL_YEAR}_${pkgver//.}_Linux_${arch}_cuda_${_CUDA_VER}"
source=("https://developer.download.nvidia.com/hpc-sdk/$pkgver/$_pkgname.tar.gz"
        "nvhpc.sh")
sha256sums=('eeba5d8aa6b6b0ffdfa9cc7b96d5df53581c5c7061c5d71e049ba7c2a9d3585a'
            'b4066e52abf7ae524f4dce64bb534ca7c77c3d5371d61d8e73d82fd648fad746')
options=(!strip)

prepare() {
  export NVHPC_SILENT=true
  export NVHPC_INSTALL_DIR="$pkgdir/opt/nvidia"
}

package() {
  cd "$srcdir/$_pkgname"
  bash ./install

  # Remove references to $pkgdir from module files
  cd "$pkgdir/opt/nvidia/modulefiles"
  find . -type f -exec sed -i "s@$pkgdir@@g" {} \;

  # Install license
  cd "$srcdir/$_pkgname/install_components/Linux_$arch/$pkgver/compilers/license"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"

  # Install script to set path
  install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/etc/profile.d/$pkgname.sh"
}
