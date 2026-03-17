# Maintainer: eirikr <151315375+Oichkatzelesfrettschen@users.noreply.github.com>
# Why: AUR python-torch-tensorrt by Smoolak is 2.9.0-5; system torch is 2.10.0; version mismatch prevents import.
#      This package targets Python 3.14 (cp314); the AUR package targets cp313.
#      Updated to 2.10.0, matching system python-pytorch-opt-cuda 2.10.0.
#      Bazel updated from 8.1.1 to 8.4.2 (required by .bazelversion in 2.10.0 repo).
#      MODULE.bazel TensorRT section patching unchanged (same line numbers in 2.10.0).
#      glog 0.7 patch REMOVED: context changed in 2.10.0; -DGLOG_USE_GLOG_EXPORT in CXXFLAGS is sufficient.
#      New fix-prim-namespace.patch: torch-tensorrt 2.10.0 has a 'namespace prim {}' that conflicts
#      with the downloaded libtorch header 'namespace prim = ::c10::prim' alias. Fix from main branch.
#      Builds for system Python 3.14 (cp314); TensorRT/DALI use py3.13 - this uses py3.14.
#
# Python 3.14 (cp314) compatibility patches:
#   fix-py314-trt-stub.patch: Install a deep-proxy stub in sys.modules["tensorrt"] when the
#     real TensorRT Python bindings fail to load (cp313-only). The stub uses a recursive
#     placeholder metaclass with a shared _trt_cache so trt.ITensor and trt.tensorrt.ITensor
#     are the SAME class object -- required for enforce_tensor_types identity checks.
#     Also sets __file__=None, a valid ModuleSpec, and __path__=[] to prevent Python
#     import machinery from calling __getattr__ on module dunder attributes.
#   fix-py314-trt-logging.patch: Wrap TRT_LOGGER = _TRTLogger() in try/except because
#     _TRTLogger inherits trt.ILogger (placeholder under cp314), and calling the stub's
#     __init__ raises RuntimeError by design.
#   fix-py314-fx-converters.patch: Wrap trt.Logger() and trt.init_libnvinfer_plugins() in
#     try/except for the same reason; the if hasattr(trt,"__version__") guard is True for
#     the stub (version string is set), so the block runs even under cp314.
#   fix-py314-converter-registry.patch: Wrap the FX legacy converter registry import in
#     try/except; under cp314 the FX frontend import chain (torch._dynamo -> sympy -> mpmath)
#     can fail; the dynamo frontend provides equivalent functionality.
#
# Wheel post-processing in build():
#   python -m build --wheel invokes 'bazel build ... --config=python', a different config than
#   our manual 'bazel build //:libtorchtrt --compilation_mode=opt'. The --config=python config
#   uses cached nightly libtorch artifacts that lack symbols present in the CachyOS
#   python-pytorch-opt-cuda 2.10.0 build, causing undefined symbol errors at runtime.
#   Fix: after the wheel is built, run Python zipfile surgery to replace the three bad
#   libtorchtrt*.so files inside the wheel with the correct ones from py/torch_tensorrt/lib/
#   (which were built against system torch by our manual bazel build step above).
#   The RECORD file SHA256 checksums are updated accordingly.

pkgname=python-torch-tensorrt-cp314
_pkgname=torch-tensorrt
pkgver=2.10.0
pkgrel=1
pkgdesc="PyTorch/TensorRT integration for Python 3.14 (cp314) -- 2.10.0 matching system pytorch-opt-cuda"
arch=('x86_64')
url="https://github.com/pytorch/TensorRT"
license=('BSD-3-Clause')
depends=(
    'python'
    'python-pytorch-opt-cuda'
    'python-numpy'
    'python-packaging'
    'python-typing_extensions'
    'python-dllist'
    'python-tensorrt'
    'python-rich'
    'python-nvidia-modelopt'
    'python-torchvision'
    'cuda'
    'tensorrt'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
    'pybind11'
    'python-ninja'
)
optdepends=(
    'python-pydot: for engine visualization features'
    'python-graphviz: for graph utilities'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pytorch/TensorRT/archive/refs/tags/v${pkgver}.tar.gz"
        "fix-prim-namespace.patch"
        "fix-py314-trt-stub.patch"
        "fix-py314-trt-logging.patch"
        "fix-py314-fx-converters.patch"
        "fix-py314-converter-registry.patch")
source_x86_64=("bazel-8.4.2::https://github.com/bazelbuild/bazel/releases/download/8.4.2/bazel-8.4.2-linux-x86_64")
sha256sums=('08d1cb6de033a8fe7c5a9e8beda016af80319bcbc22c19c8e6044d01572df791'
            'fa952812f9ac3a64916793c582c4cd630cd24d283037ac9df3df68dc5f4e7e18'
            '6c67b94d9504aadfa2f4e4eb5f6964bff7c5fc00b23c54ed00b2202c438e7c27'
            '05f1f396611ba969ae99d415f7dca2c5b0c9e80588c705800db6ee82396b20ed'
            'd39e20b3ddb6346437f16a544df66de772e3cb652d7de904648ed6b115d0426f'
            'ac7501cb2c704aecf9bd778536c89276c55083677955cff4e5e691d9c6f56140')
sha256sums_x86_64=('4dc8e99dfa802e252dac176d08201fd15c542ae78c448c8a89974b6f387c282c')

prepare() {
    cd "TensorRT-${pkgver}"

    # Fix namespace prim conflict: torch-tensorrt 2.10.0 declares 'namespace prim {}'
    # but Bazel-downloaded libtorch headers use 'namespace prim = ::c10::prim' (alias).
    # Both in the same scope cause a C++ conflict. Fix: collapse the namespace block.
    patch -p1 < "${srcdir}/fix-prim-namespace.patch"

    # Python 3.14 (cp314) compatibility: install a deep-proxy TensorRT stub so that
    # torch_tensorrt can be imported for runtime inference even though TensorRT Python
    # bindings are cp313-only. The stub provides recursive placeholder classes with
    # identity-preserving caching so enforce_tensor_types checks pass correctly.
    patch -p1 < "${srcdir}/fix-py314-trt-stub.patch"

    # Python 3.14: TRT_LOGGER = _TRTLogger() raises RuntimeError under the stub because
    # _TRTLogger inherits trt.ILogger (placeholder). Wrap in try/except.
    patch -p1 < "${srcdir}/fix-py314-trt-logging.patch"

    # Python 3.14: trt.Logger() and trt.init_libnvinfer_plugins() at module level raise
    # RuntimeError under the stub. The if hasattr(trt,"__version__") guard is True for the
    # stub (version string is set), so the block runs. Wrap in try/except.
    patch -p1 < "${srcdir}/fix-py314-fx-converters.patch"

    # Python 3.14: FX legacy converter import chain (torch._dynamo -> sympy -> mpmath)
    # can fail if mpmath version in sys.path is too old. Wrap in try/except; dynamo
    # frontend provides equivalent functionality.
    patch -p1 < "${srcdir}/fix-py314-converter-registry.patch"

    # Fix pybind11 version requirement to work with system pybind11
    sed -i 's/pybind11==2.6.2/pybind11>=2.6.2/' pyproject.toml

    # glog 0.7 on Arch requires GLOG_USE_GLOG_EXPORT for correct symbol export.
    # Injected via .bazelrc so setup.py's Bazel invocation picks it up automatically.
    # (CXXFLAGS env var alone is not forwarded into Bazel sandboxed actions.)
    printf '\n# glog 0.7 Arch Linux: export symbols macro required\nbuild --cxxopt=-DGLOG_USE_GLOG_EXPORT\n' \
        >> .bazelrc

    # Make downloaded Bazel executable
    chmod +x "${srcdir}/bazel-8.4.2"

    # Create a bazel symlink that setup.py can find
    ln -sf "${srcdir}/bazel-8.4.2" "${srcdir}/bazel"

    # TensorRT lib architecture path for x86_64
    _trt_arch="x86_64-linux-gnu"

    # Create a local directory structure that matches what Bazel's third_party/tensorrt/local/BUILD expects
    mkdir -p "tensorrt_local/lib/${_trt_arch}"
    mkdir -p "tensorrt_local/include/${_trt_arch}"

    # Link system TensorRT libraries
    ln -sf /usr/lib/libnvinfer*.so* "tensorrt_local/lib/${_trt_arch}/"
    ln -sf /usr/lib/libnvparsers.so* "tensorrt_local/lib/${_trt_arch}/" 2>/dev/null || true
    ln -sf /usr/lib/libnvonnxparser*.so* "tensorrt_local/lib/${_trt_arch}/"
    ln -sf /usr/lib/libnvinfer_plugin*.so* "tensorrt_local/lib/${_trt_arch}/"

    # Link system TensorRT headers
    ln -sf /usr/include/NvInfer*.h "tensorrt_local/include/${_trt_arch}/"
    ln -sf /usr/include/NvOnnx*.h "tensorrt_local/include/${_trt_arch}/"
    ln -sf /usr/include/NvCaffeParser.h "tensorrt_local/include/${_trt_arch}/" 2>/dev/null || true
    ln -sf /usr/include/NvUffParser.h "tensorrt_local/include/${_trt_arch}/" 2>/dev/null || true

    # MODULE.bazel: replace nightly libtorch download with the system PyTorch installation.
    # The nightly (cu130) libtorch has symbols (e.g. CUDAStream::synchronize) absent from
    # the CachyOS python-pytorch-opt-cuda 2.10.0 build; building against the system torch
    # guarantees ABI compatibility at runtime.
    python3 << 'PYEOF'
import sys, re
path = "MODULE.bazel"
with open(path) as f:
    content = f.read()
old = (
    'http_archive(\n'
    '    name = "libtorch",\n'
    '    build_file = "@//third_party/libtorch:BUILD",\n'
    '    strip_prefix = "libtorch",\n'
    '    urls = ["https://download.pytorch.org/libtorch/nightly/cu130/libtorch-shared-with-deps-latest.zip"],\n'
    ')'
)
new = (
    '# Use system PyTorch instead of downloading nightly\n'
    'new_local_repository(\n'
    '    name = "libtorch",\n'
    '    path = "/usr/lib/python3.14/site-packages/torch",\n'
    '    build_file = "@//third_party/libtorch:BUILD",\n'
    ')'
)
if old not in content:
    print("ERROR: libtorch http_archive not found in MODULE.bazel", file=sys.stderr)
    sys.exit(1)
content = content.replace(old, new)
with open(path, "w") as f:
    f.write(content)
PYEOF

    # MODULE.bazel: use local TensorRT instead of downloading from NVIDIA CDN
    # Lines 101-108: comment out http_archive for tensorrt
    sed -i '101,108s/^/#/' MODULE.bazel

    # Lines 167-171: uncomment new_local_repository for tensorrt and set correct path
    sed -i '167,171s/^#//' MODULE.bazel
    sed -i 's|path = "/usr/"|path = "'"${srcdir}/TensorRT-${pkgver}/tensorrt_local"'"|' MODULE.bazel

    # Update CUDA path in MODULE.bazel to use /opt/cuda
    sed -i 's|path = "/usr/local/cuda-13.0/"|path = "/opt/cuda/"|' MODULE.bazel

    # Patch setup.py to use system TensorRT directory directly
    sed -i '/tensorrt_x86_64_external_dir = (/,/^    )$/c\    tensorrt_x86_64_external_dir = lambda: "/usr"' setup.py
    sed -i '/tensorrt_rtx_external_dir = (/,/^    )$/c\    tensorrt_rtx_external_dir = lambda: "/usr"' setup.py
    sed -i '/tensorrt_sbsa_external_dir = (/,/^    )$/c\    tensorrt_sbsa_external_dir = lambda: "/usr"' setup.py

    # glog 0.7 on Arch requires -DGLOG_USE_GLOG_EXPORT.
    # Must be injected into setup.py's CUDAExtension extra_compile_args (ninja path)
    # AND into .bazelrc (Bazel path) -- CXXFLAGS env var is not forwarded into either.
    sed -i 's|+ \["-D_GLIBCXX_USE_CXX11_ABI=1"\]|+ ["-D_GLIBCXX_USE_CXX11_ABI=1"]\n                + ["-DGLOG_USE_GLOG_EXPORT"]|' setup.py
}

build() {
    cd "TensorRT-${pkgver}"

    export CUDA_HOME=/opt/cuda
    export CUDACXX=/opt/cuda/bin/nvcc
    export TENSORRT_DIR=/usr
    export LD_LIBRARY_PATH=/usr/lib:${LD_LIBRARY_PATH}

    export PATH="${srcdir}:${PATH}"
    export BAZEL_EXE="${srcdir}/bazel-8.4.2"
    export USE_HOST_BAZEL=1
    export COMPILATION_MODE=opt

    export CXXFLAGS="${CXXFLAGS} -DGLOG_USE_GLOG_EXPORT"

    # Build C++ library with Bazel against system torch (guarantees ABI compatibility).
    # This uses --compilation_mode=opt (not --config=python), so it links against the
    # system torch libraries discovered via new_local_repository in MODULE.bazel.
    "${srcdir}/bazel-8.4.2" build //:libtorchtrt --compilation_mode=opt

    # Extract built libraries
    tar -xzf bazel-bin/libtorchtrt.tar.gz

    # Copy built libraries to location expected by setup.py
    mkdir -p py/torch_tensorrt/lib
    cp -v torch_tensorrt/lib/*.so py/torch_tensorrt/lib/

    # Build Python wheel for system Python (3.14/cp314).
    # NOTE: python -m build invokes 'bazel build ... --config=python', which uses a
    # different Bazel configuration than our manual build above. The --config=python
    # path may resolve libtorch differently (e.g. from cache) and produce .so files
    # that are missing symbols from the system torch build. We fix this by replacing
    # the three libtorchtrt*.so files inside the resulting wheel with our clean ones.
    python -m build --wheel --no-isolation

    # Post-process wheel: replace bad libtorchtrt*.so with our clean Bazel-built ones.
    # The --config=python Bazel run inside python -m build may use a different libtorch
    # resolution path; our manual bazel build above used new_local_repository pointing
    # to system torch, guaranteeing correct ABI. Zip-surgery avoids a full rebuild.
    python3 << 'PYEOF'
import hashlib, zipfile, glob, os, base64

whl_in = sorted(glob.glob("dist/torch_tensorrt-*.whl"))[-1]
whl_out = whl_in + ".new"

# The three .so files that need replacing (paths inside the wheel zip)
so_names = [
    "torch_tensorrt/lib/libtorchtrt.so",
    "torch_tensorrt/lib/libtorchtrt_plugins.so",
    "torch_tensorrt/lib/libtorchtrt_runtime.so",
]
# Map from wheel-internal path -> on-disk path of clean replacement
replacements = {
    name: os.path.join("py", name)
    for name in so_names
}

def sha256_record(data: bytes) -> str:
    digest = hashlib.sha256(data).digest()
    return "sha256=" + base64.urlsafe_b64encode(digest).rstrip(b"=").decode()

# Build replacement data dict upfront
new_data = {}
for whl_path, disk_path in replacements.items():
    with open(disk_path, "rb") as f:
        new_data[whl_path] = f.read()

record_name = None
with zipfile.ZipFile(whl_in, "r") as zin:
    for item in zin.infolist():
        if item.filename.endswith("/RECORD"):
            record_name = item.filename
            break

with zipfile.ZipFile(whl_in, "r") as zin, \
     zipfile.ZipFile(whl_out, "w", compression=zipfile.ZIP_DEFLATED) as zout:
    for item in zin.infolist():
        if item.filename == record_name:
            # Rebuild RECORD with updated checksums for replaced files
            old_record = zin.read(record_name).decode()
            new_lines = []
            for line in old_record.splitlines():
                parts = line.split(",")
                if len(parts) >= 3 and parts[0] in new_data:
                    data = new_data[parts[0]]
                    new_lines.append(f"{parts[0]},{sha256_record(data)},{len(data)}")
                else:
                    new_lines.append(line)
            zout.writestr(item, "\n".join(new_lines) + "\n")
        elif item.filename in new_data:
            # Replace with clean .so
            info = zipfile.ZipInfo(item.filename)
            info.external_attr = item.external_attr
            zout.writestr(info, new_data[item.filename])
        else:
            zout.writestr(item, zin.read(item.filename))

os.replace(whl_out, whl_in)
print(f"Wheel post-processed: replaced {len(new_data)} .so files with clean Bazel build")
PYEOF
}

package() {
    cd "TensorRT-${pkgver}"

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    if [ -d "py/torch_tensorrt/include" ]; then
        install -dm755 "${pkgdir}/usr/include"
        cp -r py/torch_tensorrt/include "${pkgdir}/usr/include/torch_tensorrt"
    fi
}
