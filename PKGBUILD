# Maintainer:  Rohit Goswami <rohit.goswami@aol.com>
# Maintainer:  Anton Kudelin <kudelin at protonmail dot com>
# Contributor: eolianoe <eolianoe [at] gmail [DoT] com>

pkgname=nvhpc
_REL_YEAR=2021
_CUDA_VER=11.2
pkgver=21.3
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
sha256sums=('d5e90baf1aaf8d6b41c2901950c2c2d02ac441456276f3f46c9fee962527c042'
            '378bf04318ba8272df95cd79ec0d32f6d3bfeccb58220af1560d76a488131397')
options=(!strip)

package() {
  cd "$srcdir/$_pkgname"
  export NVHPC_SILENT=true
  export NVHPC_INSTALL_DIR="$pkgdir/opt/nvidia"
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
