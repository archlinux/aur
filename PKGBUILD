# Maintainer: wuxxin <wuxxin@gmail.com>
# Based on https://github.com/google/jax/blob/main/build/rocm/README.md
# Based on python-jax, python-jax-opt-cuda-git; original contributors:
# Contributor: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname='python-jax-rocm'
pkgver=0.3.16
pkgrel=1
pkgdesc='Differentiate, compile, and transform Numpy code (with ROCM)'
_srcname="jax-jax-v${pkgver}"
# develop-upstream@2022-08-10:17:10:MESZ
_tfid="343a9e91963de6dd83e0f7470a641dca365d821f"
_tfname="tensorflow-upstream-${_tfid}"
arch=('x86_64')
url='https://github.com/google/jax'
license=('Apache')
depends=(
    'absl-py'
    'miopen'
    'python-numpy'
    'python-opt_einsum'
    'python-scipy'
    'python-six'
    'python'
    'rccl'
    'rocm-hip-runtime'
)
makedepends=(
    'bazel'
    'git'
    'miopen'
    'python-pip'
    'python-wheel'
    'rccl'
    'rocm-hip-sdk'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/jax-v${pkgver}.tar.gz"
    "${_tfname}.tar.gz::https://github.com/ROCmSoftwarePlatform/tensorflow-upstream/archive/${_tfid}.tar.gz"
    "fix-rocblas-include.patch"
)
sha512sums=(
    'de2b16466009cfa56c46d44bbf58d2f8f293d6dbb6a0fdbc1591cd92fcf0eacbd119bd4d9c6ea4099a0443514a58e11e7c8fd8e94b73fa121d0f0a45a6849a53'
    '04c9ece4cb782f52925b1e7ee18ccc916a65dde051554b106164d371b3b7b96037218e635c235c8f38d088066421c0c5a4a7e201ed435b3e69c128f5ac20f0ac'
    '36596fd586cbdac990466a53cc0683de759b2f0646ed08edf04e88e3ee4de1a7381cf1b3a4784aa9a240e2ad894d55e8728226b95071539f774bc5d9b790b5fc'
)
conflicts=('python-jax')
provides=('python-jax')

prepare() {
  # loosen acceptable bazel version
  echo "5.*.*" > $_srcname/.bazelversion
  cd "${srcdir}/$_tfname"
  patch -Np1 -i "${srcdir}/fix-rocblas-include.patch"
  # for a in tensorflow/core/util/gpu_solvers.h tensorflow/stream_executor/rocm/rocblas_wrapper.h tensorflow/stream_executor/rocm/rocm_blas.h ; do sed -i -E 's#^(.include "rocm/include/rocblas)(.h")#\1/rocblas\2#g' $a; done
  cd "${srcdir}"
}

build() {
  cd "${srcdir}/${_srcname}"
  if test -z "$TF_ROCM_AMDGPU_TARGETS"; then
    TF_ROCM_AMDGPU_TARGETS="gfx900,gfx906,gfx908,gfx90a,gfx1030"
  fi
  export TF_ROCM_AMDGPU_TARGETS
  python build/build.py --enable_rocm \
    --bazel_options=--override_repository=org_tensorflow=${srcdir}/${_tfname} \
    --rocm_amdgpu_targets=${TF_ROCM_AMDGPU_TARGETS}
}

package() {
  cd "${srcdir}/${_srcname}"
  # installs jaxlib (includes XLA)
  pip install --root="${pkgdir}" --no-deps dist/*.whl
  # installs jax
  pip install --root="${pkgdir}" --no-deps .
}
