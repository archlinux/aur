# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-torch-tensorrt
_pkgname=torch-tensorrt
pkgver=2.15.0rc3
_upstreamver=2.15.0-rc3
pkgrel=2
pkgdesc="Easily achieve the best inference performance for any PyTorch model on the NVIDIA platform"
arch=('x86_64')
url="https://github.com/pytorch/TensorRT"
license=('BSD-3-Clause' 'MIT')
depends=(
    'cuda>=13.4'
    'glibc'
    'libgcc'
    'libstdc++'
    'python>=3.11'
    'python<3.15'
    'python-dllist'
    'python-filelock>=4.0.10'
    'python-numpy'
    'python-packaging>=23.1'
    'python-psutil'
    'python-pytorch-cuda>=2.15'
    'python-pytorch-cuda<2.16'
    'python-sympy'
    'python-tensorrt>=11.4.0'
    'python-tensorrt<11.5'
    'python-typing_extensions>=4.7'
    'tensorrt>=11.4.0'
    'tensorrt<11.5'
)
makedepends=(
    'bazel>=8.4.2'
    'bazel<10'
    'cmake'
    'fmt'
    'gcc15'
    'git'
    'google-glog'
    'jdk21-openjdk'
    'nccl'
    'pkgconf'
    'pybind11>=2.6.2'
    'python-build'
    'python-cffi>=1.15.1'
    'python-installer'
    'ninja>=1.11'
    'python-setuptools>=77'
    'python-wheel>=0.40'
    'python-yaml>=6'
)
checkdepends=(
    'patchelf'
    'python-pytest>=9.0.3'
    'python-pytest-xdist>=3.6.1'
)
optdepends=(
    'python-executorch>=1.6.0.dev20261009: optional Python export integration (requires version <1.7)'
    'python-graphviz: graph visualization utilities'
    'python-nvidia-modelopt: model quantization integrations'
    'python-pydot: engine visualization'
    'python-rich: rich TensorRT builder progress display'
    'python-timm: extended model tests and examples'
    'python-torchvision: FX frontend and vision models'
    'python-transformers: extended transformer model support'
    'python-tensorrt-llm: LLM inference support'
)
# Preserve the wheel's RECORD hashes for native libraries.
options=('!debug' '!strip')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/pytorch/TensorRT/archive/refs/tags/v$_upstreamver.tar.gz"
    'arch-system-dependencies.patch'
    'arch-runtime-compat.patch'
    'fix-glog-0.7.patch'
    'fix-trtengine-layout.patch'
    'cpu-check.py'
    '_runtime_cache_lock.py'
    'runtime-cache-safe-lock.patch'
    'test_runtime_cache_lock.py'
    'filelock-MIT-LICENSE'
    'arch-cpu-tests.patch'
)
sha256sums=(
    '9cd469b08f60f2a0e93315cd3bed84b04f3e056dea92db78280989fa9cc3b6e8'
    'c06b5bf89e1b5d07659922da6187477f2457df93f0a19851db0771c861387f9e'
    'aebdf557caf8105d3def808b49e470c87edc5236d47a7ce3ed0c88537e1e40f4'
    'e873d8f155e9bf0b0a9bb10d7569098c6830f8dec9d7b8a86f184d79a037f8e7'
    '05b95713e42f909badf9e267ef25f25059cadb1d1b82b8b2cc2277afb2582ef0'
    'e9742287e0ed9f24c68f7b2eccc8bedab9fcda7c7452d606605a66b60d46eff6'
    'c8689415fef531cbb3a5fbc1ddd728a8fd4cbf1c6848934896bbad8267564858'
    '7dc462cde4a6504e5cc055716cecf7d8405bd2d14076c4441657d6026a2aa707'
    '43d699430132a75f7948bb9b0bf1babc9892d1b7868b9d2fe7d769f640fe4c50'
    '608c89d5060ae9921adccf3236695bc654a9946e12323ef6c021dfa04e294d48'
    'df64fd3666e8fc97f14238fb939fe43c9c35d489c30f6436d847d37096efdbed'
)

prepare() {
    cd "TensorRT-$_upstreamver"

    patch -Np1 -i "$srcdir/arch-system-dependencies.patch"
    patch -Np1 -i "$srcdir/arch-runtime-compat.patch"
    patch -Np1 -i "$srcdir/fix-glog-0.7.patch"
    patch -Np1 -i "$srcdir/fix-trtengine-layout.patch"
    # Apply the non-destructive lock backend only to RuntimeCache. The public
    # filelock package and its other consumers retain their own implementation.
    install -m644 "$srcdir/_runtime_cache_lock.py" py/torch_tensorrt/runtime/
    patch -Np1 -i "$srcdir/runtime-cache-safe-lock.patch"
    # Keep upstream CPU cases while matching Arch metadata and optional Python integrations.
    patch -Np1 -i "$srcdir/arch-cpu-tests.patch"

    # The editor-only compile_commands generator uses native.py_binary,
    # removed in Bazel 9. It is not an input to any packaged library target.
    sed -i '/^load("@hedron_compile_commands/d; /^refresh_compile_commands(/,/^)/d' BUILD.bazel

    # Bazel's local TensorRT repository expects Debian-style multiarch paths.
    # Construct that layout entirely from the installed Arch package.
    local _trt_local="$srcdir/TensorRT-$_upstreamver/tensorrt_local"
    local _trt_arch="$CARCH-linux-gnu"
    install -d \
        "$_trt_local/include/$_trt_arch" \
        "$_trt_local/lib/$_trt_arch"

    shopt -s nullglob
    local _trt_headers=(
        /usr/include/NvInfer*.h
        /usr/include/NvOnnx*.h
    )
    local _trt_libraries=(
        /usr/lib/libnvinfer*.so*
        /usr/lib/libnvonnxparser*.so*
    )
    ((${#_trt_headers[@]}))
    ((${#_trt_libraries[@]}))
    ln -s "${_trt_headers[@]}" "$_trt_local/include/$_trt_arch/"
    ln -s "${_trt_libraries[@]}" "$_trt_local/lib/$_trt_arch/"

    grep -q 'path = "__TENSORRT_LOCAL__"' MODULE.bazel
    sed -i "s|__TENSORRT_LOCAL__|$_trt_local|" MODULE.bazel
    ! grep -q '__TENSORRT_LOCAL__' MODULE.bazel

    # Never allow an environment-provided Bazelisk wrapper to download a
    # different Bazel binary; setup.py must resolve Arch's /usr/bin/bazel.
    grep -q 'BAZEL_EXE = which("bazelisk")' setup.py
    sed -i 's/BAZEL_EXE = which("bazelisk")/BAZEL_EXE = None/' setup.py

    # ExecuTorch enables an installed ccache even when Bazel makes its cache
    # read-only. Disable caching within Bazel actions for this build.
    printf '\nbuild:linux --action_env=CCACHE_DISABLE=1\n' >> .bazelrc
}

build() {
    cd "TensorRT-$_upstreamver"

    # setuptools passes absolute source paths to the extension compiler.  Keep
    # those paths out of user-visible __FILE__ diagnostics in the installed
    # binary, in addition to makepkg's normal debug-prefix sanitization.
    CFLAGS+=" -ffile-prefix-map=$srcdir=."
    CXXFLAGS+=" -ffile-prefix-map=$srcdir=."
    export CFLAGS CXXFLAGS

    export PATH="/opt/cuda/bin:$PATH"
    # Select the declared JDK without changing the system Java default.
    export JAVA_HOME=/usr/lib/jvm/java-21-openjdk
    export CUDA_HOME=/opt/cuda
    export CUDACXX=/opt/cuda/bin/nvcc
    export CC=/usr/bin/gcc-15 CXX=/usr/bin/g++-15
    export CUDAHOSTCXX=/usr/bin/g++-15 NVCC_CCBIN=/usr/bin/g++-15
    export TENSORRT_DIR=/usr
    export TORCH_PATH
    TORCH_PATH="$(python -c 'import os, torch; print(os.path.dirname(torch.__file__))')"
    # Keep the default native ExecuTorch source build and full TorchScript frontend.
    unset EXECUTORCH_ROOT PYTHON_ONLY NO_TORCHSCRIPT USE_TRT_RTX
    unset TORCH_TENSORRT_EXECUTORCH_RUNTIME_VERSION TORCH_TENSORRT_EXECUTORCH_RUNTIME_CHANNEL
    export RELEASE=1
    export BUILD_VERSION="$pkgver"
    export USE_HOST_BAZEL=1
    # Arch ships one current Bazel binary behind a multi-version wrapper.
    # Upstream's .bazelversion pins 8.4.2, which the wrapper cannot find once
    # the repositories move to Bazel 9; select the source-built system binary.
    export USE_BAZEL_VERSION=latest
    export XDG_CACHE_HOME="$srcdir/bazel-cache"
    install -d "$XDG_CACHE_HOME"

    # bdist_wheel invokes the complete optimized C++/CUDA Bazel build and then
    # builds the CPython extension against the resulting libtorchtrt.
    python -m build --wheel --no-isolation

    # Bazel copies ExecuTorch outputs into read-only owned directories. Restore
    # directory permissions so normal makepkg cleanup and reinstall can remove
    # this private source cache. Do not follow symlinks or modify file contents.
    [[ -d "$XDG_CACHE_HOME" && ! -L "$XDG_CACHE_HOME" ]]
    [[ "$(realpath -e -- "$XDG_CACHE_HOME")" == "$(realpath -e -- "$srcdir")/bazel-cache" ]]
    find -P "$XDG_CACHE_HOME" -type d -exec chmod u+rwx {} +
}

check() {
    cd "TensorRT-$_upstreamver"

    local _site
    _site="$(python -c 'import sysconfig; print(sysconfig.get_path("platlib"))')"
    rm -rf "$srcdir/_check"
    python -m installer --destdir="$srcdir/_check" dist/*.whl
    # The repository root exposes tests.ci helpers, not the runtime under py/.
    export PYTHONPATH="$srcdir/_check$_site:$PWD"
    export TORCHTRT_CHECK_SITE="$srcdir/_check$_site"
    export LD_LIBRARY_PATH="$srcdir/_check$_site/torch_tensorrt/lib:/usr/lib"
    export CUDA_VISIBLE_DEVICES=
    export RELEASE=1 BUILD_VERSION="$pkgver"

    # Run the original CPU-capable suite against the installed wheel. Optional
    # Python ExecuTorch tests retain upstream importorskip behavior. Only the
    # six Git-index scans are omitted because release archives contain no .git.
    python -P - <<'PYCHECK'
import os
from pathlib import Path
import sys
import pytest
import torch_tensorrt
site = Path(os.environ["TORCHTRT_CHECK_SITE"]).resolve()
assert Path(torch_tensorrt.__file__).resolve().is_relative_to(site)
args = ["-ra", "--import-mode=importlib", "-n=4",
        "tests/py/core", "tests/py/dynamo/executorch",
        "tests/py/dynamo/lowering/test_complex_rewrite.py",
        "tests/py/ts/api/test_classes.py::TestInput", "tests/py/ts/api/test_logging.py"]
for test in ("test_every_requirement_matches_the_pin", "test_every_source_commit_matches_the_pin",
             "test_every_printed_install_instruction_names_the_nightly_channel",
             "test_the_no_nightly_marker_only_exempts_main_wheel_installs",
             "test_every_requirement_file_install_names_both_executorch_channels"):
    args += ["--deselect", "tests/py/dynamo/executorch/test_executorch_pin.py::" + test]
args += ["--deselect", "tests/py/dynamo/executorch/test_update_executorch_pin.py::test_write_pins_requires_a_separate_lock_refresh"]
args.append(str(Path.cwd().parent / "test_runtime_cache_lock.py"))
result = pytest.main(args)
for name, module in list(sys.modules.items()):
    if name.startswith("torch_tensorrt") and getattr(module, "__file__", None):
        assert Path(module.__file__).resolve().is_relative_to(site), (name, module.__file__)
raise SystemExit(result)
PYCHECK
    python -P "$srcdir/cpu-check.py"
}

package() {
    cd "TensorRT-$_upstreamver"

    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/filelock-MIT-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/filelock-MIT-LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
