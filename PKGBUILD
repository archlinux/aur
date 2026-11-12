# Maintainer: Eirikr
#
# torch-tensorrt 2.13.0 pairs with PyTorch 2.13 and TensorRT 11, which is what
# this host runs: python-pytorch-opt-cuda 2.13.0, tensorrt 11.2.1.2. The prior
# 2.10.0 pin produced libtorchtrt.so linked against libnvinfer.so.10, so the
# TensorRT 10 -> 11 soname bump left it unloadable.
#
# Every patch the 2.10.0 build carried is dropped, because each condition is
# gone upstream or in the distribution:
#   fix-prim-namespace.patch          2.13.0 already ships the collapsed
#                                     "namespace jit {}" form the patch created.
#   fix-py314-trt-stub.patch          python-tensorrt 11.2.1.2 installs real
#   fix-py314-trt-logging.patch       cp314 bindings under
#   fix-py314-fx-converters.patch     /usr/lib/python3.14/site-packages/tensorrt,
#   fix-py314-converter-registry.patch so the deep-proxy stub they guarded is moot.
#
# MODULE.bazel surgery shrinks for the same reason: 2.13.0 resolves libtorch
# through local_torch(), a repo rule that detects the installed PyTorch and
# honors TORCH_PATH, replacing the hand-written new_local_repository block.
# Only the TensorRT source needs redirecting, from the NVIDIA CDN tarball to the
# system install, and that edit is keyed on block content rather than line
# numbers so an upstream reflow does not silently retarget it.

pkgname=python-torch-tensorrt-cp314
_pkgname=torch-tensorrt
pkgver=2.13.0
pkgrel=1
pkgdesc="PyTorch/TensorRT integration for Python 3.14 (cp314) -- 2.13.0 against system pytorch-opt-cuda 2.13 and TensorRT 11"
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
provides=('python-torch-tensorrt')
conflicts=('python-torch-tensorrt')
# !ccache: Bazel sandboxes each compile action and mounts ~/.cache/ccache
# read-only, so ccache aborts with "failed to create temporary file ...
# Read-only file system". PKGBUILD options override makepkg's BUILDENV per
# package, which is the documented way to opt one build out of the global
# ccache setting without touching /etc/makepkg.conf.
options=(!strip !debug !ccache)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pytorch/TensorRT/archive/refs/tags/v${pkgver}.tar.gz")
source_x86_64=("bazel-8.4.2::https://github.com/bazelbuild/bazel/releases/download/8.4.2/bazel-8.4.2-linux-x86_64")
sha256sums=('55575a1e971aca35642df6c114b3912dbcc9d4c5e2cf990154c8da282404aa2f')
sha256sums_x86_64=('4dc8e99dfa802e252dac176d08201fd15c542ae78c448c8a89974b6f387c282c')

prepare() {
    cd "TensorRT-${pkgver}"

    # System pybind11 is newer than the == pin upstream carries.
    sed -i 's/pybind11==2.6.2/pybind11>=2.6.2/' pyproject.toml

    # glog 0.7 on Arch requires GLOG_USE_GLOG_EXPORT for correct symbol export.
    # .bazelrc carries it because CXXFLAGS does not reach Bazel sandboxed actions.
    # .bazelrc rather than command-line flags, because setup.py launches a
    # SECOND bazel run of its own (bazelisk build //:libtorchtrt --config=python)
    # during `python -m build`. Flags passed to our invocation never reach it, so
    # every setting that must hold for both lives here.
    #
    #   glog 0.7 on Arch needs GLOG_USE_GLOG_EXPORT, and CXXFLAGS does not reach
    #   Bazel sandboxed actions.
    #   -std=gnu17 for C: rules_foreign_cc bootstraps pkg-config against a bundled
    #   glib whose goption.c declares "gboolean bool;". GCC 16 defaults to C23,
    #   where bool is a keyword, so that is a hard error.
    #   CCACHE_DISABLE must arrive via action_env: Bazel scrubs the environment
    #   for hermeticity, so an exported variable never reaches a sandboxed action.
    cat >> .bazelrc <<'BAZELRC'

# Arch/CachyOS host toolchain settings
build --cxxopt=-DGLOG_USE_GLOG_EXPORT
build --repo_env=CC=/usr/bin/gcc
build --repo_env=CXX=/usr/bin/g++
build --conlyopt=-std=gnu17
build --host_conlyopt=-std=gnu17
build --action_env=CCACHE_DISABLE=1
build --host_action_env=CCACHE_DISABLE=1
BAZELRC

    # setup.py builds a PyTorch C++ extension through torch.utils.cpp_extension,
    # which runs ninja directly and reads neither CXXFLAGS nor CPPFLAGS from the
    # environment, so the .bazelrc --cxxopt above cannot reach it. glog 0.7 hard
    # -#errors in logging.h line 59 unless GLOG_EXPORT is defined, and only
    # -DGLOG_USE_GLOG_EXPORT pulls in glog/export.h to define it. The define
    # therefore goes into setup.py's own extra_compile_args list.
    sed -i 's/^                    "-Wno-deprecated",$/                    "-Wno-deprecated",\n                    "-DGLOG_USE_GLOG_EXPORT",/' setup.py
    grep -n 'GLOG_USE_GLOG_EXPORT' setup.py

    chmod +x "${srcdir}/bazel-8.4.2"
    ln -sf "${srcdir}/bazel-8.4.2" "${srcdir}/bazel"

    _trt_arch="x86_64-linux-gnu"
    mkdir -p "tensorrt_local/lib/${_trt_arch}" "tensorrt_local/include/${_trt_arch}"
    ln -sf /usr/lib/libnvinfer*.so*        "tensorrt_local/lib/${_trt_arch}/"
    ln -sf /usr/lib/libnvonnxparser*.so*   "tensorrt_local/lib/${_trt_arch}/"
    ln -sf /usr/lib/libnvinfer_plugin*.so* "tensorrt_local/lib/${_trt_arch}/"
    ln -sf /usr/lib/libnvparsers.so*       "tensorrt_local/lib/${_trt_arch}/" 2>/dev/null || true
    ln -sf /usr/include/NvInfer*.h         "tensorrt_local/include/${_trt_arch}/"
    ln -sf /usr/include/NvOnnx*.h          "tensorrt_local/include/${_trt_arch}/"
    ln -sf /usr/include/NvCaffeParser.h    "tensorrt_local/include/${_trt_arch}/" 2>/dev/null || true
    ln -sf /usr/include/NvUffParser.h      "tensorrt_local/include/${_trt_arch}/" 2>/dev/null || true

    # Redirect the TensorRT dependency from the NVIDIA CDN tarball to the system
    # install, and point CUDA at Arch's /opt/cuda. Both edits match on block
    # content, so they fail loudly rather than silently hitting the wrong lines.
    TRT_LOCAL="${srcdir}/TensorRT-${pkgver}/tensorrt_local" python3 << 'PYEOF'
import os, re, sys

path = "MODULE.bazel"
src = open(path).read()
trt_local = os.environ["TRT_LOCAL"]

# 1. Disable the http_archive that downloads TensorRT from developer.nvidia.com.
m = re.search(r'^http_archive\(\n    name = "tensorrt",\n(?:.*\n)*?\)\n', src, re.M)
if not m:
    sys.exit("ERROR: tensorrt http_archive block not found in MODULE.bazel")
src = src[:m.start()] + "".join("#" + l if l.strip() else l
                               for l in m.group(0).splitlines(keepends=True)) + src[m.end():]

# 2. Enable the commented new_local_repository for tensorrt, pointed at our tree.
old_local = ('#new_local_repository(\n'
             '#   name = "tensorrt",\n'
             '#   path = "/usr/",\n'
             '#   build_file = "@//third_party/tensorrt/local:BUILD"\n'
             '#)')
new_local = ('new_local_repository(\n'
             '    name = "tensorrt",\n'
             f'    path = "{trt_local}",\n'
             '    build_file = "@//third_party/tensorrt/local:BUILD",\n'
             ')')
if old_local not in src:
    sys.exit("ERROR: commented tensorrt new_local_repository block not found")
src = src.replace(old_local, new_local, 1)

# 3. Arch installs CUDA at /opt/cuda, not /usr/local/cuda-<ver>.
src, n = re.subn(r'path = "/usr/local/cuda-[0-9.]+/"', 'path = "/opt/cuda/"', src)
if n == 0:
    sys.exit("ERROR: cuda new_local_repository path not found")

open(path, "w").write(src)
print(f"MODULE.bazel: tensorrt -> {trt_local}, cuda -> /opt/cuda, CDN archive disabled")
PYEOF
}

build() {
    cd "TensorRT-${pkgver}"

    export CUDA_HOME=/opt/cuda
    export CUDACXX=/opt/cuda/bin/nvcc
    export TENSORRT_DIR=/usr
    export LD_LIBRARY_PATH=/usr/lib:${LD_LIBRARY_PATH}

    # local_torch() detects the installed PyTorch; name it explicitly so the
    # headers match the runtime libtorch_cuda.so this package links against.
    export TORCH_PATH=/usr/lib/python3.14/site-packages/torch

    export PATH="${srcdir}:${PATH}"
    export BAZEL_EXE="${srcdir}/bazel-8.4.2"
    export USE_HOST_BAZEL=1
    export COMPILATION_MODE=opt
    export CXXFLAGS="${CXXFLAGS} -DGLOG_USE_GLOG_EXPORT"

    # Name the real compilers rather than the ccache masquerade. Bazel sandboxes
    # each compile action with ~/.cache/ccache mounted read-only, so a ccache
    # wrapper aborts with "failed to create temporary file". --repo_env forces
    # local_config_cc to regenerate; without it Bazel reuses a toolchain it
    # configured on an earlier run and the masqueraded path persists.
    # -std=gnu17 for C targets: rules_foreign_cc bootstraps pkg-config against
    # its bundled internal glib, whose goption.c declares "gboolean bool;" and
    # reads "change->prev.bool". GCC 16 defaults to C23, where bool is a
    # reserved keyword, so those become "two or more data types in declaration
    # specifiers". Only the C compiles need the older standard; C++ is untouched.
    export CC=/usr/bin/gcc
    export CXX=/usr/bin/g++

    # CCACHE_DISABLE covers the paths options=(!ccache) cannot reach. That option
    # only drops /usr/lib/ccache/bin from PATH; /usr/bin/ccache still exists, and
    # the vendored ExecuTorch CMake project find_program()s it directly, then
    # dies the same way inside Bazel's read-only sandbox. Disabling ccache
    # outright makes it a passthrough regardless of who invokes it. Exporting it
    # here is not enough on its own: Bazel scrubs the environment for hermeticity,
    # so the variable only reaches sandboxed actions via --action_env below.
    export CCACHE_DISABLE=1

    "${srcdir}/bazel-8.4.2" build //:libtorchtrt \
        --compilation_mode=opt \
        --repo_env=CC=/usr/bin/gcc \
        --repo_env=CXX=/usr/bin/g++ \
        --conlyopt=-std=gnu17 \
        --host_conlyopt=-std=gnu17 \
        --action_env=CCACHE_DISABLE=1 \
        --host_action_env=CCACHE_DISABLE=1

    tar -xzf bazel-bin/libtorchtrt.tar.gz
    mkdir -p py/torch_tensorrt/lib
    cp -v torch_tensorrt/lib/*.so py/torch_tensorrt/lib/

    python -m build --wheel --no-isolation
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
