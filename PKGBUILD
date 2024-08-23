# Maintainer: "Jayesh Badwaik" jayesh@badwaik.dev

pkgname=nvhpc
_REL_YEAR=2024
_CUDA_VER=12.5
pkgver=24.7
pkgrel=3
pkgdesc='NVIDIA HPC SDK'
arch=('x86_64')
url="https://gitlab.com/badwaik/archlinux/aur/nvhpc"
license=('custom')
depends=('numactl' 'gcc13')
optdepends=('env-modules')
makedepends=('bash')
replaces=('pgi-compilers')
conflicts=('pgi-compilers')
_pkgname="nvhpc_${_REL_YEAR}_${pkgver//.}_Linux_${arch}_cuda_${_CUDA_VER}"
source=("https://developer.download.nvidia.com/hpc-sdk/$pkgver/$_pkgname.tar.gz"
        "nvhpc.sh")
sha256sums=(
  'baf20427c0057938a04bf2139429c6e9e1bb819de797636244c9696c2dcaf5b0'
  '8bcf26d02c92882d91b0bb1e025f004a1a161ce5d788636662a6c478df5a62bc')

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

    # Rewrite localrc to use gcc-13 as default compiler
    "$pkgdir"/opt/nvidia/hpc_sdk/Linux_x86_64/$pkgver/compilers/bin/makelocalrc -x -gcc gcc-13

    # Install license
    cd "$srcdir/$_pkgname/install_components/Linux_$arch/$pkgver/compilers/license"
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"

    # Install script to set path
    install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/opt/nvidia/$pkgname.sh"
}
