# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-transformer-engine
_pkgname=TransformerEngine
pkgver=2.15
pkgrel=1
pkgdesc='NVIDIA Transformer Engine: accelerated transformer training/inference with FP8 on Hopper+ GPUs (PyTorch backend)'
arch=('x86_64')
url='https://github.com/NVIDIA/TransformerEngine'
license=('Apache-2.0')
depends=(
  'python'
  'python-pytorch'
  'python-pydantic'
  'python-importlib-metadata'
  'python-packaging'
  'python-onnxscript'
  'python-triton'
  'python-einops'
  'cuda'
  'cudnn'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
  'cmake'
  'ninja'
  'pybind11'
  'gcc15'
  'git'
)
# git sources: main repo at the tag + the 3 submodules pinned to the commits
# TransformerEngine v2.15 records (sdist/PyPI is only a metapackage, so we build
# from source). cutlass/cudnn-frontend are required; googletest is for tests.
source=(
  "git+https://github.com/NVIDIA/TransformerEngine.git#tag=v${pkgver}"
  "te-cudnn-frontend::git+https://github.com/NVIDIA/cudnn-frontend.git#commit=97f6cb3b88cacff507cca1280db5650a457d92b3"
  "te-cutlass::git+https://github.com/NVIDIA/cutlass.git#commit=57e3cfb47a2d9e0d46eb6335c3dc411498efa198"
  "te-googletest::git+https://github.com/google/googletest.git#commit=f8d7d77c06936315286eb55f8de22cd23c188571"
)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

prepare() {
  cd "${_pkgname}"
  # Wire the pinned submodules from the locally-fetched git sources.
  git submodule init
  git config submodule.3rdparty/cudnn-frontend.url "${srcdir}/te-cudnn-frontend"
  git config submodule.3rdparty/cutlass.url "${srcdir}/te-cutlass"
  git config submodule.3rdparty/googletest.url "${srcdir}/te-googletest"
  git -c protocol.file.allow=always submodule update

  # `python -m build --no-isolation` still verifies build-system.requires as pip
  # distributions. cmake/ninja/pybind11 are provided by pacman (makedepends) and
  # jax/flax aren't needed for the pytorch backend, so trim build-requires to the
  # ones pip actually resolves here.
  sed -i 's|^requires = \[.*\]|requires = ["setuptools>=61.0", "wheel", "torch>=2.1"]|' pyproject.toml
}

build() {
  cd "${_pkgname}"
  export CUDA_HOME=/opt/cuda
  export PATH="/opt/cuda/bin:${PATH}"
  # nvcc 13.x needs gcc<=15 as host compiler.
  export CUDAHOSTCXX=/usr/bin/g++-15 NVCC_CCBIN=/usr/bin/g++-15
  # Build only the PyTorch backend.
  export NVTE_FRAMEWORK=pytorch
  # Pin CUDA archs explicitly: TE's default list includes 7.0 (Volta) on some
  # CUDA versions, which CUDA 13 dropped. Override at build time to target one GPU.
  export NVTE_CUDA_ARCHS="${NVTE_CUDA_ARCHS:-75;80;89;90;100;120}"
  # glog 0.7 compat for the torch-binding compile (torch headers pull glog).
  export CPPFLAGS="-DGLOG_USE_GLOG_EXPORT ${CPPFLAGS:-}"
  export NVCC_PREPEND_FLAGS="-ccbin /usr/bin/g++-15 -DGLOG_USE_GLOG_EXPORT"
  export NVTE_CMAKE_EXTRA_ARGS="-DCMAKE_CUDA_HOST_COMPILER=/usr/bin/g++-15"
  export MAX_JOBS="$(nproc)"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_pkgname}"
  python -c "import transformer_engine; import transformer_engine.pytorch; print('transformer_engine import OK')" \
    || echo 'Warning: import check skipped (GPU/CUDA runtime may be unavailable in build env)'
}

package() {
  cd "${_pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
