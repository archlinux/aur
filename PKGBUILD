pkgname=openmp-extras
pkgdesc='Radeon Open Compute - openmp-extras with flang (OpenMP AMD GPU Offloading)'
pkgver=5.0.2
pkgrel=1
arch=('x86_64')
url='https://github.com/ROCm-Developer-Tools/aomp'
license=('custom:Apache 2.0 with LLVM Exception')
depends=(hsa-rocr rocm-llvm)
makedepends=(cmake python python-pip python-wheel ninja gawk)
llvm_url='https://github.com/RadeonOpenCompute/llvm-project'
dlibs_url='https://github.com/RadeonOpenCompute/ROCm-Device-Libs'
flang_url='https://github.com/ROCm-Developer-Tools/flang'
extras_url='https://github.com/ROCm-Developer-Tools/aomp-extras'
source=("llvm-amdgpu-${pkgver}.tar.gz::$llvm_url/archive/rocm-$pkgver.tar.gz"
        "aomp-$pkgver.tar.gz::$url/archive/rocm-$pkgver.tar.gz"
        "aomp-extras-$pkgver.tar.gz::$extras_url/archive/rocm-$pkgver.tar.gz"
        "aomp-device-libs-$pkgver.tar.gz::$dlibs_url/archive/rocm-$pkgver.tar.gz"
        "flang-$pkgver.tar.gz::$flang_url/archive/rocm-$pkgver.tar.gz"
        "llvm-project-hostrpc-fprintf-decl.patch"
        "aomp-gcc8-only-for-cuda.patch"
        "aomp-openmp-buildpath.patch"
        "aomp-openmp-llvm.patch"
        "aomp-flang-alarm-signature.patch"
        "aomp-flang-decouple-out-dir-and-rocm-install.patch"
        "aomp-flang-libomp-path.patch"
        "aomp-flang-remove-sha.patch"
        "aomp-extras-compiler-in-rocm-dir.patch"
        )
sha256sums=(
            '99a14394b406263576ed3d8d10334de7c78d42b349109f375d178b11492eecaf'
            '64669ac448c439e89ec4b6e0506158e6d9b5a3edfae05882aee4c9bcd5f187b7'
            'a4affb77bebaafb6f8d22c51d66aa6fa05381ec54cc1e14a4b10e0f3dc00157f'
            '49cfa8f8fc276ba27feef40546788a2aabe259a924a97af8bef24e295d19aa5e'
            '9b9a53150009ff58bd0ab665b970dbebc51be891343fd5dc8e77a2133ac44333'
            'c846bac17580e939492b843bee092c2e1b2b414a683bdb6be2973ae044642424'
            '705a7103c3aeff514e5645c130786172961c54673dfdd772caece3b5e7536088'
            'f7ed1704ffb095bbe8512b1c567a111936685d35f64123c786194e4239277251'
            '6efb9538e016e1e6e2fb6ce52408bb6317c213ebdd46a60925447d0b43f42ee6'
            '7c796d44952da8f089dc3ee013970dba7be43c60eb90131f86ce7d15c67b4b9b'
            'e82a4f065cc259095bf96778b913b97fe39d7c207e4e25ccf59d8fa264014262'
            'ff3c3e56bfc11c0c9a6ab5c5392168da06aed3b4a21cdfcf7a149d12a69e2906'
            '565af54e3079c130c87ebe036d91db21631e01ff0435f80bc54dbb55e8b02229'
            'f8f57cdcc4ddf535323f4f84a4a4a4fa830fbad72b19c7ea45d74fa5579ee72f'
            )
options=(staticlibs)

prepare() {

    ln -f -s $srcdir/llvm-project-rocm-$pkgver $srcdir/llvm-project
    ln -f -s $srcdir/flang-rocm-$pkgver $srcdir/flang
    ln -f -s $srcdir/aomp-extras-rocm-$pkgver $srcdir/aomp-extras

    cd $srcdir/llvm-project-rocm-$pkgver
    patch -Np1 < $srcdir/llvm-project-hostrpc-fprintf-decl.patch

    cd $srcdir/aomp-rocm-$pkgver
    patch -Np1 < $srcdir/aomp-gcc8-only-for-cuda.patch
    patch -Np1 < $srcdir/aomp-openmp-buildpath.patch
    patch -Np1 < $srcdir/aomp-openmp-llvm.patch
    patch -Np1 < $srcdir/aomp-flang-decouple-out-dir-and-rocm-install.patch
    patch -Np1 < $srcdir/aomp-flang-libomp-path.patch

    cd $srcdir/flang
    patch -Np1 < $srcdir/aomp-flang-alarm-signature.patch
#    patch -Np1 < $srcdir/aomp-flang-remove-sha.patch

    cd $srcdir/aomp-extras
    patch -Np1 < $srcdir/aomp-extras-compiler-in-rocm-dir.patch

}

build() {

    export OMPEXTRA_DIR=$srcdir/out/openmp-extras
    export OUT_DIR=$OMPEXTRA_DIR
    export AOMP=$OUT_DIR/llvm
    export AOMP_STANDALONE_BUILD=0
    export AOMP_REPOS=$srcdir
    export ROCM_DIR=/opt/rocm
    export DEVICELIBS_ROOT=$srcdir/ROCm-Device-Libs-rocm-$pkgver
    export LLVM_PROJECT_ROOT=$srcdir/llvm-project

    cd $srcdir/aomp-rocm-$pkgver/bin
    ./build_extras.sh
    ./build_extras.sh install

    ./build_openmp.sh
    ./build_openmp.sh install

    ./build_pgmath.sh
    ./build_pgmath.sh install

    ./build_flang.sh
    ./build_flang.sh install

    ./build_flang_runtime.sh
    ./build_flang_runtime.sh install
}


package() {

    mkdir -p $pkgdir/opt/rocm/
    cp -r $srcdir/out/openmp-extras/* $pkgdir/opt/rocm/
}
