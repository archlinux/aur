# Maintainer: "Jayesh Badwaik" jayesh@badwaik.dev

pkgname=nvhpc-22.5
_REL_YEAR=2022
_CUDA_VER=11.7
pkgver=22.5
pkgrel=1
pkgdesc='NVIDIA HPC SDK'
arch=('x86_64')
url="https://developer.nvidia.com/hpc-sdk"
license=('custom')
depends=('numactl' 'java-runtime')
optdepends=('env-modules')
makedepends=('bash')
replaces=('pgi-compilers')
conflicts=('pgi-compilers')
_pkgname="nvhpc_${_REL_YEAR}_${pkgver//.}_Linux_${arch}_cuda_${_CUDA_VER}"
source=("https://developer.download.nvidia.com/hpc-sdk/$pkgver/$_pkgname.tar.gz"
        "nvhpc.sh")
sha256sums=('02f19609b99140692b85a0edc176f29c9c717dbf78346ac24cd1470be248fa55'
            '28a1fd95457a1fa9047f5e29595f54bb1e93bfc25312300699db3017dbd9c89b')
options=(!strip)

prepare() {
  cd "$srcdir/$_pkgname"
  sed -i "s/en_US\.UTF\-8/C/g" "install_components/Linux_x86_64/$pkgver/compilers/bin/makelocalrc"
}

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
