# Maintainer: "Jayesh Badwaik" jayesh@badwaik.dev

pkgname=nvhpc
_REL_YEAR=2024
_CUDA_VER=12.5
pkgver=24.7
pkgrel=1
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

    # Patch localrc to use GCC 13
    GCC_VERSION=13.3.0
    localrc="$pkgdir/opt/nvidia/hpc_sdk/Linux_x86_64/$pkgver/compilers/bin/localrc"
    sed -i "s|set GCCDIR.*|set GCCDIR=/usr/lib/gcc/x86_64-pc-linux-gnu/$GCC_VERSION/;|" "$localrc"
    sed -i "s|set GCCINC.*|set GCCINC=/usr/lib/gcc/x86_64-pc-linux-gnu/$GCC_VERSION/include /usr/local/include /usr/lib/gcc/x86_64-pc-linux-gnu/$GCC_VERSION/include-fixed /usr/include;|" "$localrc"
    sed -i "s|set GPPDIR.*|set GPPDIR=/usr/lib/gcc/x86_64-pc-linux-gnu/$GCC_VERSION/include/c++ /usr/lib/gcc/x86_64-pc-linux-gnu/$GCC_VERSION/include/c++/x86_64-pc-linux-gnu /usr/lib/gcc/x86_64-pc-linux-gnu/$GCC_VERSION/include/c++/backward /usr/lib/gcc/x86_64-pc-linux-gnu/$GCC_VERSION/include /usr/local/include /usr/lib/gcc/x86_64-pc-linux-gnu/$GCC_VERSION/include-fixed /usr/include;|" "$localrc"
    sed -i "s|# GCC version.*|# GCC version $GCC_VERSION|" "$localrc"
    sed -i "s|set GCCVERSION.*|set GCCVERSION=$GCC_VERSION;|" "$localrc"

    # Remove references to $pkgdir from module files
    cd "$pkgdir/opt/nvidia/hpc_sdk/modulefiles"
    find . -type f -exec sed -i "s@$pkgdir@@g" {} \;

    # Install license
    cd "$srcdir/$_pkgname/install_components/Linux_$arch/$pkgver/compilers/license"
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"

    # Install script to set path
    install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/opt/nvidia/$pkgname.sh"
}
