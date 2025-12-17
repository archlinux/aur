# Based on https://github.com/jax-ml/jax/blob/main/build/rocm/README.md
# Based on python-jax, python-jax-opt-cuda-git
#
# Maintainer:
#
# Previous contributors:
# Contributor: Brian Thompson <brianrobt@pm.me>
# Contributor: wuxxin <wuxxin@gmail.com>
#
# Original contributors:
# Contributor: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-jax-rocm
pkgver=0.8.1
pkgrel=1
pkgdesc='XLA library for JAX (jaxlib for ROCM)'
_srcname="jax-jaxlib-v${pkgver}"
_xlaname="xla-rocm-jaxlib-v${pkgver}"
arch=(x86_64)
url="https://github.com/jax-ml/jax"
license=(Apache-2.0)
groups=('jax')
depends=(python-absl python-flatbuffers python-ml-dtypes python-scipy miopen-hip rccl rocm-hip-runtime)
makedepends=(python-build python-installer python-setuptools python-wheel bazel rocm-hip-sdk)
conflicts=(python-jaxlib)
provides=("python-jaxlib=$pkgver")
source=("${_srcname}.tar.gz::${url}/archive/jax-v${pkgver}.tar.gz"
  "${_xlaname}.tar.gz::https://github.com/ROCm/xla/archive/rocm-jaxlib-v${pkgver}.tar.gz")
sha512sums=('c5edbfd8f81a68f659fec2727f11cdddf7db325b4e99037f27ce18e41fde5f5e82e727dee367e861241faa16ad44350a9ead97424149eb72d91db000f6e47d05'
            '658f88061a03392a4b56c1d0bc8fb4a31a359c88a97bc1b0e4a495873a95088dd1650ac6926be3536b4c6b80aeed796cd31ff8715c7ae0eeb8109b3c7d567bda')
# test
# python -c "import jax; print(jax.devices(),jax.devices()[0].device_kind); x=jax.numpy.array([1.2,3.4,5.6]); y=jax.numpy.exp(x); print(y)"

prepare() {
  cd "${srcdir}/${_srcname}"
  # loosen acceptable bazel version
  echo "8.*.*" >.bazelversion
  # Override default version
  export JAXLIB_RELEASE=$pkgver
  # export ROCM_HOME if not set
  if test -n "$ROCM_HOME"; then
    export ROCM_HOME=/opt/rocm
  fi
}

build() {
  cd "${srcdir}/${_srcname}"
  # populate build architecture list if not set from aur:tensorflow-rocm@2.13.0-4
  if test -n "$TF_ROCM_AMDGPU_TARGETS"; then
    export TF_ROCM_AMDGPU_TARGETS="$TF_ROCM_AMDGPU_TARGETS"
  else
    export TF_ROCM_AMDGPU_TARGETS="gfx803,gfx900,gfx906,gfx908,gfx90a,gfx1030,gfx1100,gfx1101,gfx1102"
  fi

  # XXX use xla tree from ROCmSoftwarePlatform:xla@v$pkgver with fixes for rocm
  # FIXME hipcc and hipcc.perl is searched in $ROCM_HOME/hip/bin but only available in $ROCM_HOME/bin
  # FIXME include/hipblaslt/hipblaslt.h not found
  python build/build.py --enable_rocm \
    "--rocm_amdgpu_targets=${TF_ROCM_AMDGPU_TARGETS}" \
    --bazel_options=--override_repository=xla=${srcdir}/${_xlaname}
}

package() {
  cd "${srcdir}/${_srcname}"
  python -m installer \
    --compile-bytecode 1 \
    --destdir $pkgdir \
    $srcdir/$_srcname/dist/jaxlib-$pkgver-*.whl
}
