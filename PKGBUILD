# Maintainer: "Jayesh Badwaik" jayesh@badwaik.dev

pkgname=nvhpc
_REL_YEAR=2024
_CUDA_VER=12.3
pkgver=24.1
pkgrel=1
pkgdesc='NVIDIA HPC SDK'
arch=('x86_64')
url="https://gitlab.com/badwaik/archlinux/aur/nvhpc"
license=('custom')
depends=('numactl' 'java-runtime' 'gcc12')
optdepends=('env-modules')
makedepends=('bash')
replaces=('pgi-compilers')
conflicts=('pgi-compilers')
_pkgname="nvhpc_${_REL_YEAR}_${pkgver//.}_Linux_${arch}_cuda_${_CUDA_VER}"
source=("https://developer.download.nvidia.com/hpc-sdk/$pkgver/$_pkgname.tar.gz"
        "nvhpc.sh")
sha256sums=('91cdc6f327881f14119e8b6e884d544aafab01c3d569b61831e259c91b4530fc'
            'c8f8d13b342f5b49180b0e1e2c76834368db8a59dab5f9b2794df4410ce817f5')

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

    # Patch localrc to use GCC 12
    localrc="$pkgdir/opt/nvidia/hpc_sdk/Linux_x86_64/$pkgver/compilers/bin/localrc"
    sed -i "s|set GCCDIR.*|set GCCDIR=/usr/lib/gcc/x86_64-pc-linux-gnu/12.3.0/;|" "$localrc"
    sed -i "s|set GCCINC.*|set GCCINC=/usr/lib/gcc/x86_64-pc-linux-gnu/12.3.0/include /usr/local/include /usr/lib/gcc/x86_64-pc-linux-gnu/12.3.0/include-fixed /usr/include;|" "$localrc"
    sed -i "s|set GPPDIR.*|set GPPDIR=/usr/lib/gcc/x86_64-pc-linux-gnu/12.3.0/include/c++ /usr/lib/gcc/x86_64-pc-linux-gnu/12.3.0/include/c++/x86_64-pc-linux-gnu /usr/lib/gcc/x86_64-pc-linux-gnu/12.3.0/include/c++/backward /usr/lib/gcc/x86_64-pc-linux-gnu/12.3.0/include /usr/local/include /usr/lib/gcc/x86_64-pc-linux-gnu/12.3.0/include-fixed /usr/include;|" "$localrc"
    sed -i "s|# GCC version.*|# GCC version 12.3.0|" "$localrc"
    sed -i "s|set GCCVERSION.*|set GCCVERSION=120300;|" "$localrc"

    # Remove references to $pkgdir from module files
    cd "$pkgdir/opt/nvidia/hpc_sdk/modulefiles"
    find . -type f -exec sed -i "s@$pkgdir@@g" {} \;

    # Install license
    cd "$srcdir/$_pkgname/install_components/Linux_$arch/$pkgver/compilers/license"
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"

# Install script to set path
    install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/etc/profile.d/$pkgname.sh"

## Temporary Patch to Fix Problems with OpenMPI 3.x
#    pushd $pkgdir/opt/nvidia/hpc_sdk/Linux_x86_64/22.11/comm_libs
#      unlink mpi
#      ln -s openmpi4/openmpi-4.0.5/ mpi
#    popd
}
