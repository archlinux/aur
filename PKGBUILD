# Maintainer: "Jayesh Badwaik" jayesh@badwaik.dev

pkgname=nvhpc
_REL_YEAR=2022
_CUDA_VER=11.8
pkgver=22.11
pkgrel=2
pkgdesc='NVIDIA HPC SDK'
arch=('x86_64')
url="https://gitlab.com/badwaik/archlinux/aur/nvhpc"
license=('custom')
depends=('numactl' 'java-runtime')
optdepends=('env-modules')
makedepends=('bash')
replaces=('pgi-compilers')
conflicts=('pgi-compilers')
_pkgname="nvhpc_${_REL_YEAR}_${pkgver//.}_Linux_${arch}_cuda_${_CUDA_VER}"
source=("https://developer.download.nvidia.com/hpc-sdk/$pkgver/$_pkgname.tar.gz"
    "nvhpc.sh")
sha256sums=('6be15d49a451983234483c5721fa12ad810e83127d2a572b5716ba9a2e2968e9'
    '8e8a66dc93b4f0401388fb2254a8656ca505abd705b11c1b15c2343086ef5a54')
options=(!strip)

  prepare() {
    cd "$srcdir/$_pkgname"
      sed -i "s/en_US\.UTF\-8/C/g" "install_components/Linux_x86_64/$pkgver/compilers/bin/makelocalrc"
  }

package() {
  cd "$srcdir/$_pkgname"
    NVHPC_SILENT=true \
    NVHPC_INSTALL_DIR="$pkgdir/opt/nvidia/hpc_sdk" \
    bash ./install

# Remove references to $pkgdir from module files
    cd "$pkgdir/opt/nvidia/hpc_sdk/modulefiles"
    find . -type f -exec sed -i "s@$pkgdir@@g" {} \;

# Install license
  cd "$srcdir/$_pkgname/install_components/Linux_$arch/$pkgver/compilers/license"
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"

# Install script to set path
    install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/etc/profile.d/$pkgname.sh"

# Temporary Patch to Fix Problems with OpenMPI 3.x
    pushd $pkgdir/opt/nvidia/hpc_sdk/Linux_x86_64/22.11/comm_libs
      unlink mpi
      ln -s openmpi4/openmpi-4.0.5/ mpi
    popd
}
