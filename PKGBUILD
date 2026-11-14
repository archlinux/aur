# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>
# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-executorch
pkgver=1.6.0
pkgrel=1
pkgdesc="On-device AI across mobile, embedded and edge for PyTorch"
arch=(x86_64 aarch64)
license=(BSD-3-Clause)
url="https://github.com/pytorch/executorch"
depends=(
  'python>=3.11' 'python<3.16'
  python-zstd python-certifi python-pyaml python-yaml python-pip 'python-pytorch>=2.15'
  libstdc++ libgcc abseil-cpp
  python-flatbuffers python-mpmath 'python-numpy>=2.0' python-packaging
  'python-pandas>=2.2.2' python-py-cpuinfo python-requests
  python-pytorch-tokenizers 'python-torchao>=0.18.0'
  python-ruamel-yaml python-sympy python-tabulate 'python-typing_extensions>=4.10'
  'python-hydra-core>=1.3.0' 'python-omegaconf>=2.3.0'
)
makedepends=(
  python-build python-installer 'python-setuptools>=77.0.3' python-wheel
  'python-cmake>=3.26' 'python-packaging>=24.2' patchelf gflags git
  # Public Hydra's setup imports pkg_resources before producing its wheel.
  python-pkg-resources
)
checkdepends=(python-pytest)
optdepends=(
  'python-coremltools: Apple model export integration on Python versions below 3.14'
  'python-scikit-learn: Core ML weight palettization on Python versions below 3.14'
  'python-pytest: running the bundled backend and example test suites'
)
# Preserve native wheel RECORD identities through packaging.
options=('!strip' '!debug')
source=(
  "git+https://github.com/pytorch/executorch.git#commit=4776f71b6f0daa5dfc7d758d5836fc1cc0d40154"
  "executorch-FACTO::git+https://github.com/pytorch-labs/FACTO.git"
  "executorch-FP16::git+https://github.com/Maratyszcza/FP16.git"
  "executorch-FXdiv::git+https://github.com/Maratyszcza/FXdiv.git"
  "executorch-Vulkan-Headers::git+https://github.com/KhronosGroup/Vulkan-Headers.git"
  "executorch-VulkanMemoryAllocator::git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git"
  "executorch-XNNPACK::git+https://github.com/google/XNNPACK.git"
  "executorch-abseil-cpp::git+https://github.com/abseil/abseil-cpp.git"
  "executorch-ao::git+https://github.com/pytorch/ao.git"
  "executorch-buck2-prelude::git+https://github.com/facebook/buck2-prelude.git"
  "executorch-buck2-shims-meta::git+https://github.com/facebook/buck2-shims-meta.git"
  "executorch-cpuinfo::git+https://github.com/pytorch/cpuinfo.git"
  "executorch-cutlass::git+https://github.com/NVIDIA/cutlass.git"
  "executorch-eigen::git+https://github.com/eigen-mirror/eigen.git"
  "executorch-mlx::git+https://github.com/ml-explore/mlx.git"
  "executorch-flatbuffers::git+https://github.com/google/flatbuffers.git"
  "executorch-flatcc::git+https://github.com/dvidelabs/flatcc.git"
  "executorch-gflags::git+https://github.com/gflags/gflags.git"
  "executorch-googletest::git+https://github.com/google/googletest.git"
  "executorch-ios-cmake::git+https://github.com/leetal/ios-cmake.git"
  "executorch-json::git+https://github.com/nlohmann/json.git"
  "executorch-llama.cpp::git+https://github.com/ggml-org/llama.cpp.git"
  "executorch-pcre2::git+https://github.com/PCRE2Project/pcre2.git"
  "executorch-pocketfft::git+https://github.com/mreineck/pocketfft.git"
  "executorch-pthreadpool::git+https://github.com/google/pthreadpool.git"
  "executorch-pybind11::git+https://github.com/pybind/pybind11.git"
  "executorch-re2::git+https://github.com/google/re2.git"
  "executorch-sentencepiece::git+https://github.com/google/sentencepiece.git"
  "executorch-sljit::git+https://github.com/zherczeg/sljit.git"
  "executorch-tokenizers::git+https://github.com/meta-pytorch/tokenizers.git"
  "executorch-volk::git+https://github.com/zeux/volk.git"
  Don-t-require-CMake-below-4.0.patch
  Use-system-patchelf.patch
  Don-t-add-gflags-submodule.patch
  current-mpmath-metadata.patch
)
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '2561890fc8127640c40e5cf0c7d60ebf01d5e43f6c301a4a6023ab483422f4329206981ccef360c9cab2193aed40780ad0ffaeec13d599a3ab28dd5700961913'
            '822563a8e6c1b3b98d0a33ef6020a717e023d3f7e235a09a7adc825afd81905736934423b62daea803345c03a1fd69ff342e0c088abc417b7a5b0f380866d2c1'
            '4cf103ab2c96aa18aa23f6a7e5118e00141914beea5466e2293c61fdef87e8923e2eabe535a564b0d1e37748555d9c0e4b2e0f29efad095003ef0077be06a947'
            '70284d3f453c81efa43f83b7bc6358bf2fef58c858867379098113a947871e9b674ba39b201f4b45a9fdac0b48103ecb153c620cd8f5be60109b95afc3f2bdba')

prepare() {
  cd "${srcdir}/executorch"

  git submodule init
  git config submodule."backends/mlx/third-party/mlx".url "${srcdir}/executorch-mlx"
  git config submodule."backends/vulkan/third-party/Vulkan-Headers".url "${srcdir}/executorch-Vulkan-Headers"
  git config submodule."backends/vulkan/third-party/VulkanMemoryAllocator".url "${srcdir}/executorch-VulkanMemoryAllocator"
  git config submodule."backends/vulkan/third-party/volk".url "${srcdir}/executorch-volk"
  git config submodule."backends/xnnpack/third-party/FP16".url "${srcdir}/executorch-FP16"
  git config submodule."backends/xnnpack/third-party/FXdiv".url "${srcdir}/executorch-FXdiv"
  git config submodule."backends/xnnpack/third-party/XNNPACK".url "${srcdir}/executorch-XNNPACK"
  git config submodule."backends/xnnpack/third-party/cpuinfo".url "${srcdir}/executorch-cpuinfo"
  git config submodule."backends/xnnpack/third-party/pthreadpool".url "${srcdir}/executorch-pthreadpool"
  git config submodule."extension/llm/tokenizers".url "${srcdir}/executorch-tokenizers"
  git config submodule."kernels/optimized/third-party/eigen".url "${srcdir}/executorch-eigen"
  git config submodule."third-party/flatbuffers".url "${srcdir}/executorch-flatbuffers"
  git config submodule."third-party/flatcc".url "${srcdir}/executorch-flatcc"
  git config submodule."third-party/gflags".url "${srcdir}/executorch-gflags"
  git config submodule."third-party/googletest".url "${srcdir}/executorch-googletest"
  git config submodule."third-party/ios-cmake".url "${srcdir}/executorch-ios-cmake"
  git config submodule."third-party/prelude".url "${srcdir}/executorch-buck2-prelude"
  git config submodule."third-party/pybind11".url "${srcdir}/executorch-pybind11"
  git config submodule."third-party/ao".url "${srcdir}/executorch-ao"
  git config submodule."backends/cadence/utils/FACTO".url "${srcdir}/executorch-FACTO"
  git config submodule."third-party/pocketfft".url "${srcdir}/executorch-pocketfft"
  git config submodule."shim".url "${srcdir}/executorch-buck2-shims-meta"
  git config submodule."third-party/json".url "${srcdir}/executorch-json"
  git config submodule."backends/native/third-party/llama.cpp".url "${srcdir}/executorch-llama.cpp"
  git -c protocol.file.allow=always submodule update --init

  pushd extension/llm/tokenizers
    git submodule init
    git config submodule."third-party/json".url "${srcdir}/executorch-json"
    git config submodule."third-party/sentencepiece".url "${srcdir}/executorch-sentencepiece"
    git config submodule."third-party/re2".url "${srcdir}/executorch-re2"
    git config submodule."third-party/abseil-cpp".url "${srcdir}/executorch-abseil-cpp"
    git config submodule."third-party/pcre2".url "${srcdir}/executorch-pcre2"
    git -c protocol.file.allow=always submodule update --init

    pushd third-party/pcre2
      git submodule init
      git config submodule."deps/sljit".url "${srcdir}/executorch-sljit"
      git -c protocol.file.allow=always submodule update --init
    popd
  popd

  pushd third-party/ao
    git submodule init
    git config submodule."third_party/cutlass".url "${srcdir}/executorch-cutlass"
    git -c protocol.file.allow=always submodule update --init
  popd

  patch -Np1 --fuzz=0 -i ../Don-t-require-CMake-below-4.0.patch
  # setup.py runs the patchelf executable from Arch's patchelf package. Drop
  # only the PyPI wrapper distribution from the PEP 517 requirement check.
  patch -Np1 --fuzz=0 -i ../Use-system-patchelf.patch
  patch -Np1 --fuzz=0 -i ../Don-t-add-gflags-submodule.patch
  # Upstream has no direct mpmath calls. Preserve SymPy's own dependency contract
  # and trial the current public mpmath, instead of an unavailable CI-only pin.
  patch -Np1 --fuzz=0 -i ../current-mpmath-metadata.patch
  # ExecuTorch 1.6.0 already disables FLATCC_ALLOW_WERROR in both build paths.

  # Grab cstdint include from main branch in sentencepiece
  pushd "${srcdir}/executorch/extension/llm/tokenizers/third-party/sentencepiece"
  if ! git merge-base --is-ancestor c4221363d1f004f85f9cc4096e601d6b1fbfaa84 HEAD; then
    git cherry-pick -n c4221363d1f004f85f9cc4096e601d6b1fbfaa84
  fi
  popd

  # Dereference symlink hack (done for editable installs), the build module does not follow them.
  cp -rL src/executorch src/executorch_nolink
  rm -rf src/executorch
  mv src/executorch_nolink src/executorch
}

build() {
  cd executorch

  # Keep the complete upstream build and prevent caller-provided minimal mode.
  unset EXECUTORCH_BUILD_MINIMAL
  export CMAKE_ARGS="-DEXECUTORCH_BUILD_COREML=OFF"
  # Release version: setup.py otherwise appends the checkout's git hash as a
  # local version label (1.6.0+4776f71); upstream release builds set this too.
  export BUILD_VERSION="$pkgver"

  python -m build --wheel --no-isolation
}

check() {
  cd executorch

  # Exercise upstream CPU export/serde and native portable/XNNPACK runtime tests
  # against the complete built wheel. Other hardware/backend/model matrices are
  # outside this representative scope, with no features removed from the build.
  python -m installer --destdir="$srcdir/_check" dist/*.whl
  local _python_version _site
  _python_version=$(python -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')
  _site="$srcdir/_check/usr/lib/python$_python_version/site-packages"
  export PYTHONPATH="$_site" PYTHONNOUSERSITE=1 CUDA_VISIBLE_DEVICES=
  python - "$_site" <<'PY_CHECK'
from pathlib import Path
import sys
import executorch.runtime
assert Path(executorch.runtime.__file__).resolve().is_relative_to(Path(sys.argv[1]).resolve())
PY_CHECK
  python -m pytest -v --import-mode=importlib \
    exir/tests/test_arg_validator.py \
    exir/tests/test_serde.py \
    runtime/test/test_runtime.py \
    runtime/test/test_runtime_xnnpack.py
}

package() {
  cd executorch
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  # Remove flatc provided by the flatbuffers package and empty bin directory
  rm -fR "$pkgdir/usr/bin"
  # Keep the wheel RECORD consistent with the installed files: drop the entry
  # for the removed console copy; the bundled executorch/data/bin/flatc stays.
  local _record=("$pkgdir"/usr/lib/python3.*/site-packages/executorch-"$pkgver".dist-info/RECORD)
  [[ ${#_record[@]} -eq 1 && -f ${_record[0]} ]]
  grep -q '^\.\./\.\./\.\./bin/flatc,' "${_record[0]}"
  sed -i '/^\.\.\/\.\.\/\.\.\/bin\//d' "${_record[0]}"
  ! grep -q '^\.\./\.\./\.\./bin/' "${_record[0]}"
}
