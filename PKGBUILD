# Maintainer: "Jayesh Badwaik" jayesh@badwaik.dev

pkgname=nvhpc
_REL_YEAR=2022
_CUDA_VER=11.7
pkgver=22.9
pkgrel=1
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
sha256sums=('dbabe51bcee259aeba855ad496c11334c474942b744bddc5dfec9187dffbac58'
    '518135e3af790f97d5461712556cf815b8da8b304d9021f7afb0584469a73410')
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
}
