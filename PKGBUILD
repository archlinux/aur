# Maintainer: wuxxin <wuxxin@gmail.com>
# Contributor: Amy Tobey - github.com/tobert
# Contributor: francisco1892 <admin@gnlug.org>
# Contributor: Jingbei Li <i@jingbei.li>
# Contributor: Jose Riha <jose1711 gmail com>

pkgname=python-torchaudio-rocm
_pkgname=audio
pkgver=2.10.0
pkgrel=1
pkgdesc="Data manipulation and transformation for audio signal processing, powered by PyTorch (with ROCM support)"
arch=('x86_64')
url="https://github.com/pytorch/audio"
license=('BSD')
depends=(
    'python'
    'python-pytorch-rocm'
    'bzip2'
    'xz'
    'opencore-amr'
    'lame'
    'libogg'
    'libFLAC.so'
    'libvorbis'
    'opus'
    'opusfile'
    'zlib'
)
optdepends=('python-kaldi-io')
makedepends=(
    'cmake'
    'ninja'
    'python-setuptools'
    'boost'
    'rocm-hip-sdk'
)
conflicts=('python-torchaudio-git' 'python-torchaudio')
provides=('python-torchaudio' "python-torchaudio=${pkgver}")
source=(
    "${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=(
    'd0d0d9575025eb85150356a0b0de75b553484838006af17a62470b52d59845d1'
)

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    # patch -N -p 1 -i "${srcdir}"/policy_min_3.5.patch
}

build() {
    cd "$srcdir/${_pkgname}-${pkgver}"

    # populate build architecture list identical to pkg arch:python-pytorch
    # python-pytorch 2.10.0-1: gfx950 lacks support for 128 bit atomics
    _PYTORCH_ROCM_ARCH="$(rocm-supported-gfx -e gfx950)"
    if test -n "$GPU_TARGETS"; then _PYTORCH_ROCM_ARCH="$GPU_TARGETS"; fi
    if test -n "$AMDGPU_TARGETS"; then _PYTORCH_ROCM_ARCH="$AMDGPU_TARGETS"; fi
    if test -n "$PYTORCH_ROCM_ARCH"; then _PYTORCH_ROCM_ARCH="$PYTORCH_ROCM_ARCH"; fi
    export PYTORCH_ROCM_ARCH="${_PYTORCH_ROCM_ARCH}"
    echo "building for PYTORCH_ROCM_ARCH=$PYTORCH_ROCM_ARCH"

    # if ROCM_HOME is not set, hardcode ROCM_HOME, ROCM_PATH, HIP_ROOT_DIR to /opt/rocm
    export ROCM_HOME="${ROCM_HOME:-/opt/rocm}"
    export ROCM_PATH="$ROCM_HOME"
    export HIP_ROOT_DIR="$ROCM_HOME"

    # -fcf-protection is not supported by HIP/clang
    # https://rocm.docs.amd.com/projects/llvm-project/en/latest/reference/rocmcc.html#support-status-of-other-clang-options
    CXXFLAGS+=" -fcf-protection=none"

    USE_ROCM=1 python setup.py build
}

package() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    USE_ROCM=1 python setup.py install --root="$pkgdir"/ --optimize=1
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
