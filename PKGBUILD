# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

pkgname=vmaf-full
pkgver=3.2.0
pkgrel=3
pkgdesc='Perceptual video quality assessment algorithm based on multi-method fusion with all features enabled'
arch=('x86_64')
url='https://github.com/Netflix/vmaf/'
license=('BSD-2-Clause-Patent')
depends=(
    'glibc'
    'libgcc'
    'libstdc++')
makedepends=(
    'cuda'
    'doxygen'
    'ffnvcodec-headers'
    'meson'
    'nasm'
    'nvtx'
    'vim')
provides=("vmaf=${pkgver}")
conflicts=('vmaf')
optdepends=(
    'nvidia-utils: runtime NVIDIA driver support for CUDA feature extractors'
    'nsight-systems: NVTX range profiling')
source=(
    "vmaf-${pkgver}.tar.gz::https://github.com/Netflix/vmaf/archive/v${pkgver}/vmaf-${pkgver}.tar.gz"
    'vmaf-full-cuda-include-dir.patch')
sha256sums=(
    'a28f93f3b4fa65601be324587072e32a6a704a304ba7b1aec9b70b3f709bc1dc'
    '07486510455ea887e062d61cad7e831e92fc2e49ef189be7823d7e729bbd4f00')

prepare() {
    cd "vmaf-${pkgver}"
    patch -Np1 -i "${srcdir}/vmaf-full-cuda-include-dir.patch"
}

build() {
    local _jobs
    local _max_jobs='20'
    
    _jobs="$(nproc)"
    
    # may fail to compile on a high core count system
    # https://github.com/Netflix/vmaf/issues/1541
    if [ "$_jobs" -ge "$_max_jobs" ]
    then
        _jobs="$_max_jobs"
        printf '%s\n' "limiting the compilation jobs to ${_jobs}"
    fi
    
    export PATH="/opt/cuda/bin:$PATH"
    export CPPFLAGS="${CPPFLAGS} -I/opt/cuda/include"
    export CFLAGS="${CFLAGS} -I/opt/cuda/include"
    export CXXFLAGS="${CXXFLAGS} -I/opt/cuda/include"
    
    arch-meson \
        -Denable_tests='true' \
        -Denable_docs='true' \
        -Denable_tools='true' \
        -Denable_asm='true' \
        -Denable_avx512='true' \
        -Dbuilt_in_models='true' \
        -Denable_float='true' \
        -Denable_cuda='true' \
        -Denable_nvtx='true' \
        -Denable_nvcc='true' \
        "vmaf-${pkgver}/libvmaf" build
    meson compile -C build --jobs "$_jobs"
}

check() {
    meson test -C build --no-suite cuda
}

package() {
    meson install -C build --destdir "$pkgdir"
    install -D -m644 "vmaf-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    cp -dr --no-preserve='ownership' "vmaf-${pkgver}/model" "${pkgdir}/usr/share"
}
