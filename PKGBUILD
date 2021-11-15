# Maintainer:  Rohit Goswami <rohit.goswami@aol.com>
# Maintainer:  Anton Kudelin <kudelin at protonmail dot com>
# Contributor: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: Sebastian Ehlert <awvwgk at disroot dot org>

pkgname=nvhpc
_REL_YEAR=2021
_CUDA_VER=11.4
pkgver=21.9
pkgrel=1
pkgdesc='NVIDIA HPC SDK'
arch=('x86_64')
url="https://developer.nvidia.com/hpc-sdk"
license=('custom')
depends=('numactl' 'java-runtime' 'env-modules')
makedepends=('bash')
replaces=('pgi-compilers')
conflicts=('pgi-compilers')
_pkgname="${pkgname}_${_REL_YEAR}_${pkgver//.}_Linux_${arch}_cuda_${_CUDA_VER}"
source=("https://developer.download.nvidia.com/hpc-sdk/$pkgver/$_pkgname.tar.gz"
        "nvhpc.sh")
sha256sums=('9203e9620dbd5699d92615d58df9adcffd19c6d25794d8b297b7b3723d16c9c1'
            'b5e5524d1a4536a0f7583f727b4645158e21de4bca429af410d176c034f12601')
options=(!strip)

package() {
  cd "$srcdir/$_pkgname"
  NVHPC_SILENT=true \
  NVHPC_INSTALL_DIR="$pkgdir/opt/nvidia" \
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
