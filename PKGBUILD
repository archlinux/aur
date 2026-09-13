# Maintainer: Smoolak <smoolak@gmail.com>
# Contributor:  <edgar [ no ] openmail [d] cc>

pkgbase=tvm
pkgname=('tvm' 'python-tvm')
pkgver=0.26.0
pkgrel=1
pkgdesc="End-to-end compiler stack for machine learning"
arch=('x86_64')
url="https://tvm.apache.org/"
license=('Apache-2.0')
makedepends=(
    'cmake'
    'git'
    'gtest'
    'llvm'
    'llvm-libs'
    'ninja'
    'ocl-icd'
    'openblas'
    'python'
    'python-apache-tvm-ffi>=0.1.13.post2'
    'python-build'
    'python-installer'
    'python-ml-dtypes'
    'python-numpy'
    'python-scikit-build-core'
    'python-setuptools-scm'
    'python-typing_extensions'
    'python-wheel'
    'z3>=4.16.0'
)
checkdepends=(
    'python-cloudpickle'
    'python-psutil'
    'python-pytest'
    'python-pytest-benchmark'
    'python-pytest-cov'
    'python-pytest-mock'
    'python-pytest-repeat'
    'python-pytest-rerunfailures'
    'python-pytest-timeout'
    'python-pytest-xdist'
    'python-pytorch'
    'python-tornado'
    'python-xgboost'
)
source=(
    "$pkgbase-$pkgver.tar.gz::https://github.com/apache/$pkgbase/archive/refs/tags/v$pkgver.tar.gz"
    "OpenCL-Headers::git+https://github.com/KhronosGroup/OpenCL-Headers.git#commit=b590a6bfe034ea3a418b7b523e3490956bcb367a"
    "cutlass::git+https://github.com/NVIDIA/cutlass.git#commit=b2dd65dc864e09688245b316ac46c4a6cd07e15c"
    "cutlass_fpA_intB_gemm::git+https://github.com/tlc-pack/cutlass_fpA_intB_gemm#commit=96b48221df9d010c2d5b7f65d1664f198c664d28"
    "libflash_attn::git+https://github.com/tlc-pack/libflash_attn#commit=07ba35bae96900e51b4d63ef3487ba24850da870"
    "tvm-ffi::git+https://github.com/apache/tvm-ffi#commit=12dbf053b3d9ba4ebd9da3123b1aeca79cf74229"
    "dlpack::git+https://github.com/dmlc/dlpack.git#commit=84d107bf416c6bab9ae68ad285876600d230490d"
    "libbacktrace::git+https://github.com/ianlancetaylor/libbacktrace.git#commit=793921876c981ce49759114d7bb89bb89b2d3a2d"
    'system-install-paths.patch'
    'llvm21-aarch64-vector-tests.patch'
    'runtime-extra-install-ipv4.patch'
    'process-session-structlog-sync.patch'
    'socket-session-connect-retry.patch'
    'relax-closure-vars-python314.patch'
    'pytorch-2.13-assert-async.patch'
)
sha256sums=('4eca911bfa0c692afb86e9b7618c9c3e9a7b018e23fe2ccc100319f21e819ced'
            'ff14e74734a3eb729f80ee97258ac1d4afabb1f30822220ab4f8dbcc64d47d38'
            'd093d45264038b90e5b13e20e7b47002c8b18b916462968e4a044f6cf4a3660d'
            'SKIP'
            '76c041efdfef9efddd88f4d8eff5a35cc8fb923e4977bbee4abbab3d693ede08'
            'SKIP'
            'ff2080dd8cfd9fe7db48b1d75aef12e9a0135c6fe2ee2c5ea294c9413b1df855'
            'a5ec02c71d913362b883e4cb3a7ca3767bde0ff2d9709b52d740f94b806e4773'
            'c64397ac8c0c71eaa410530eba23fac7df447f8f8361d0f3b6ce34239eac2b38'
            '464bc481710bcddfa40fda080ea1e4a2f8c24c4ac9b7e6be13c3ecb3cb6ef499'
            '6f40f6ca40853a572e7bc53289efe36b3118f092a25e5bc645bab6db1e03be28'
            'ebeaa5e5614c16ca19d8be2048ad5e4ceaa08c24bcd503bd4fa2b9af54f64932'
            '7d8c182fb6d8f44620ac14ade5848ddf1da78dae3036d04916deb5dec1d5c2ad'
            'bc7d4569be6b58e35e8ec68e2dd6e9e40c5c1744ab9077336e050a3775476f44'
            '1766715b66ce934ca1828dd424b3773ecda569fd8509f03990105ddd5716f641')

prepare() {
    cd "$pkgbase-$pkgver"

    # NumPy 2.5 no longer recursively coerces TVM's PrimType through its
    # nested .dtype attribute. Supply its public scalar dtype spelling in
    # these interoperability fixtures; compiled operations stay unchanged.
    sed -i -E 's/astype\(([ABC])\.dtype\)/astype(str(\1.dtype))/g; s/dtype=([ABC])\.dtype/dtype=str(\1.dtype)/g' \
        tests/python/runtime/test_runtime_dlpack.py \
        tests/python/runtime/test_runtime_module_load.py
    sed -i 's/astype(out_ty.dtype)/astype(str(out_ty.dtype))/g' \
        tests/python/relax/test_op_gradient_numeric.py
    # The same PrimType coercion affects real Adam state allocation and
    # Xavier initialization, not just test fixtures. Pass NumPy a dtype string.
    python - <<'PY'
from pathlib import Path
p = Path('python/tvm/relax/training/optimizer.py')
s = p.read_text()
old = 'np.ones((), self.dtype)'
assert s.count(old) == 2
p.write_text(s.replace(old, 'np.ones((), str(self.dtype))'))
p = Path('python/tvm/relax/training/trainer.py')
s = p.read_text()
old = 'shape, dtype = self._get_shape_list(p), p.ty.dtype'
assert s.count(old) == 1
p.write_text(s.replace(old, 'shape, dtype = self._get_shape_list(p), str(p.ty.dtype)'))

# Retain exact structural coverage of TVM's norm converter without depending
# on PyTorch's changing decomposition graph. Independently compile and compare
# all six default-decomposed norms numerically against PyTorch, including the
# newly introduced amax/amin and the removed redundant abs for even powers.
p = Path('tests/python/relax/test_frontend_from_exported_program.py')
s = p.read_text()
old = '        verify_model(Norm(p, dim=dim, keepdim=keepdim), example_args, {}, expected)'
assert s.count(old) == 1
new = '''        verify_model(Norm(p, dim=dim, keepdim=keepdim), example_args, {}, expected,
                     run_ep_decomposition=False)
        verify_model_numerically(Norm(p, dim=dim, keepdim=keepdim), example_args,
                                 rtol=1e-5, atol=1e-6)'''
p.write_text(s.replace(old, new))
PY

    # Local variable annotations are not Python runtime expressions. Capture
    # their lexical names as well as argument/return annotations, including
    # functions with no PEP 563 string annotations at all.
    python - <<'PY'
from pathlib import Path
p=Path('python/tvm/script/parser/core/utils.py')
s=p.read_text()
old='    for node in ast.walk(tree):\n        if isinstance(node, ast.FunctionDef | ast.AsyncFunctionDef):'
new='''    for node in ast.walk(tree):
        if isinstance(node, ast.AnnAssign):
            names.update(n.id for n in ast.walk(node.annotation) if isinstance(n, ast.Name))
        if isinstance(node, ast.FunctionDef | ast.AsyncFunctionDef):'''
assert s.count(old)==1
s=s.replace(old,new)
old='    if not _has_string_annotations(source_obj):\n        return\n    ann_names = _collect_annotation_names(source_obj)'
assert s.count(old)==1
s=s.replace(old,'    ann_names = _collect_annotation_names(source_obj)')
p.write_text(s)
# Torch 2.14 decomposes infinity norms into amax/amin rather than leaving a
# linalg_vector_norm node. Preserve reduction axes and keepdim explicitly.
p=Path('python/tvm/relax/frontend/torch/exported_program_translator.py')
s=p.read_text()
old='    def _max_dim(self, node: fx.Node) -> relax.Var:'
new='''    def _reduce_extreme(self, node: fx.Node, op) -> relax.Var:
        args = self.retrieve_args(node)
        axis = args[1] if len(args) > 1 else node.kwargs.get("dim", None)
        keepdim = args[2] if len(args) > 2 else node.kwargs.get("keepdim", False)
        if isinstance(axis, (list, tuple)) and not axis:
            axis = None
        return self.block_builder.emit(op(args[0], axis=axis, keepdims=keepdim))

'''+old
assert s.count(old)==1
s=s.replace(old,new)
old='            "max.dim": self._max_dim,'
assert s.count(old)==1
s=s.replace(old, old+'''
            "amax.default": lambda node: self._reduce_extreme(node, relax.op.max),
            "amin.default": lambda node: self._reduce_extreme(node, relax.op.min),''')
p.write_text(s)
PY

    # Use the supported shared system Z3 provider instead of the PyPI-only
    # static SDK distribution. Keep SMT solving enabled in both build passes.
    sed -i '/^  "mlc-z3-static>=4.16.0",$/d' pyproject.toml
    # Logging handler argument lists may contain None/numbers, not only
    # parameterized strings. Preserve those typed arguments unchanged.
    sed -i 's/v = \[t.format(\*\*params) for t in v\]/v = [t.format(**params) if isinstance(t, str) else t for t in v]/' \
        python/tvm/s_tir/meta_schedule/logging.py
    # dictConfig cannot resolve an existing handler merely by its name.
    # Register factories for external handlers, including unnamed capture
    # handlers, so application instrumentation survives logger reconfiguration.
    python - <<'PY'
from pathlib import Path
p = Path('python/tvm/s_tir/meta_schedule/logging.py')
s = p.read_text()
old = '    config["loggers"].setdefault(\n        global_logger_name,'
new = '''    existing_handler_names = []
    owned_names = {global_logger_name + ".console", global_logger_name + ".file"}
    for index, handler in enumerate(global_logger.handlers):
        name = handler.get_name()
        if name in owned_names:
            continue
        if name is None:
            name = global_logger_name + ".external_" + str(index)
        config["handlers"].setdefault(name, {"()": lambda h=handler: h})
        existing_handler_names.append(name)

    config["loggers"].setdefault(
        global_logger_name,'''
assert s.count(old) == 1
s = s.replace(old, new)
old = '[handler.get_name() for handler in global_logger.handlers]'
assert s.count(old) == 1
s = s.replace(old, 'existing_handler_names')
p.write_text(s)
p = Path('tests/python/relax/test_transform_meta_schedule_tuning.py')
s = p.read_text()
s += '''

def test_meta_schedule_preserves_external_handler(tmp_path):
    import logging
    from logging.handlers import BufferingHandler
    from tvm.s_tir.meta_schedule.logging import create_loggers
    logger = logging.getLogger("tvm.s_tir.meta_schedule")
    handler = BufferingHandler(100)
    logger.addHandler(handler)
    try:
        create_loggers(str(tmp_path), [{"log_dir": str(tmp_path), "logger_name": "exercise.task"}])
        logger.warning("external-handler-preserved")
        assert handler in logger.handlers
        assert any(r.getMessage() == "external-handler-preserved" for r in handler.buffer)
    finally:
        logger.removeHandler(handler)
        handler.close()
'''
p.write_text(s)
PY

    # LLVM's interface target adds raw -isystem flags, bypassing CMake's
    # implicit-directory filtering. Explicit /usr/include reorders GCC 16's
    # search path and breaks libstdc++ #include_next <stdlib.h>.
    sed -i '/string(STRIP "${__llvm_include_dir}" __llvm_include_dir)/a\      if(__llvm_include_dir IN_LIST CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES)\n        continue()\n      endif()' cmake/modules/LLVM.cmake

    # Recreate the exact submodule state recorded by the v0.26.0 release.
    for submod in OpenCL-Headers cutlass cutlass_fpA_intB_gemm libflash_attn tvm-ffi; do
        rm -rf "3rdparty/$submod"
        cp -a "$srcdir/$submod" "3rdparty/$submod"
    done

    rm -rf "3rdparty/tvm-ffi/3rdparty/libbacktrace"
    cp -a "$srcdir/libbacktrace" "3rdparty/tvm-ffi/3rdparty/libbacktrace"
    rm -rf "3rdparty/tvm-ffi/3rdparty/dlpack"
    cp -a "$srcdir/dlpack" "3rdparty/tvm-ffi/3rdparty/dlpack"

    # Arch installs the native libraries and development headers in /usr.
    # Retain the wheel/dev search paths and add the system-package fallback.
    patch -Np1 -i "$srcdir/system-install-paths.patch"

    # LLVM 21 may vectorize generic AArch64 loops with fixed-width NEON
    # instead of SVE. Keep the upstream codegen assertions meaningful by
    # accepting either instruction family.
    patch -Np1 -i "$srcdir/llvm21-aarch64-vector-tests.patch"

    # Load the separately-built runtime-extra DSO before importing the Python
    # modules that consume its FFI registrations, and keep localhost compatible
    # with the IPv4 TCP socket used by Disco.
    patch -Np1 -i "$srcdir/runtime-extra-install-ipv4.patch"

    # Release the temporary remote Structlog registers and synchronize every
    # Disco worker before session teardown can close their control pipes.
    patch -Np1 -i "$srcdir/process-session-structlog-sync.patch"

    # A remote socket worker can start before the controller thread reaches
    # listen().  Retry only ECONNREFUSED for a short bounded interval.
    patch -Np1 -i "$srcdir/socket-session-connect-retry.patch"

    # Python 3.14 records annotation-only closures on PEP 649's generated
    # __annotate__ function. Capture those cells and apply TVM's existing
    # lexical fallback to Relax functions as it already is to TIRx functions.
    patch -Np1 -i "$srcdir/relax-closure-vars-python314.patch"

    # PyTorch 2.13 exports a side-effect-only asynchronous assertion before
    # one_hot. It produces no value, so treat it like TVM's existing no-op
    # handlers for exported scalar and tensor-metadata assertions.
    patch -Np1 -i "$srcdir/pytorch-2.13-assert-async.patch"

    mkdir -p build
    cat > build/config.cmake << 'EOF'
# TVM build configuration for Arch Linux
set(USE_LLVM ON)
set(USE_OPENCL ON)
set(USE_BLAS openblas)
set(USE_OPENMP gnu)
set(USE_GTEST ON)
set(USE_RPC ON)
set(USE_SORT ON)
set(USE_RANDOM ON)
set(USE_Z3 ON)
set(INSTALL_DEV ON)
set(HIDE_PRIVATE_SYMBOLS ON)
set(TVM_BUILD_PYTHON_MODULE OFF)
EOF
}

build() {
    cd "$pkgbase-$pkgver"

    cmake -S . -B build -G Ninja \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_BUILD_TYPE=Release \
        -DTVM_VERSION="$pkgver"

    cmake --build build
    cmake --build build --target cpptest

    # scikit-build-core reuses the fully configured native build tree and only
    # enables the Python installation rules needed to assemble the wheel.
    export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"
    export SKBUILD_BUILD_DIR="$PWD/build"
    python -m build --wheel --no-isolation

    # Restore the native-only install rules before package_tvm() invokes CMake
    # install, otherwise the Python wheel layout would leak into /usr.
    cmake -S . -B build \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DTVM_BUILD_PYTHON_MODULE=OFF \
        -DTVM_VERSION="$pkgver"
}

check() {
    cd "$pkgbase-$pkgver"

    export TVM_BIND_THREADS=0
    export OMP_NUM_THREADS=1
    export OPENBLAS_NUM_THREADS=1
    export TVM_NUM_THREADS=1
    local _workers=${SLURM_CPUS_PER_TASK:-1}
    ((_workers <= 16)) || _workers=16

    # Complete native GoogleTest suite.
    ./build/cpptest

    # Exercise every non-nightly Python test subtree shipped in the release
    # against the built wheel.  The v0.25.0 task_python_unittest.sh still
    # names the removed ffi and meta_schedule directories; meta-schedule
    # moved below s_tir and the FFI suite now lives in the tvm-ffi project.
    local _site
    _site="$(python -c 'import sysconfig; print(sysconfig.get_path("platlib"))')"
    rm -rf "$srcdir/_check"
    python -m installer --destdir="$srcdir/_check" dist/*.whl
    export PYTHONPATH="$srcdir/_check$_site"
    export TVM_LIBRARY_PATH="$srcdir/_check$_site/tvm/lib"
    export TVM_WHEEL_EXPECT_LLVM=1
    # SourceModule's C/C++ compilation tests need the release headers and
    # bundled support headers while exercising the staged installed wheel.
    export TVM_HOME="$PWD"

    # Regression for postponed annotation capture on Python 3.14. Run it
    # before the directory sweep so a parser regression fails immediately.
    python -m pytest -ra --reruns=3 -n=1 \
        tests/python/tvmscript/test_tvmscript_roundtrip.py::test_relax_roundtrip

    # Regressions for the current Arch PyTorch/XGBoost stack and the staged
    # wheel's source-module include discovery. The full directory sweep below
    # runs these again as part of the complete upstream suite.
    python -m pytest -ra --reruns=3 -n=1 \
        tests/python/relax/test_frontend_from_exported_program.py::test_one_hot \
        tests/python/relax/test_frontend_nn_extern_module.py::test_extern_source \
        tests/python/relax/test_meta_schedule_relax_integration.py::test_compile_relax_with_database \
        tests/python/relax/test_transform_meta_schedule_tuning.py::test_ms_tuning_irmodule \
        tests/python/relax/test_transform_meta_schedule_tuning.py::test_ms_tuning_primfunc

    local _test_dirs=(
        all-platform-minimal-test
        disco
        arith
        ci
        codegen
        driver
        ir
        runtime
        support
        target
        te
        testing
        s_tir/base
        s_tir/schedule
        s_tir/dlight
        s_tir/analysis
        s_tir/meta_schedule
        s_tir/transform
        s_tir/test_s_tir_renew_defs.py
        tirx-analysis
        tirx-base
        tirx-transform
        tirx
        tvmscript
        relax
    )
    local _test_dir _suite_failed=0
    for _test_dir in "${_test_dirs[@]}"; do
        if [[ "$_test_dir" == disco ]]; then
            # test_session.py intentionally keeps the most recent socket
            # session in a module global.  In a single long-lived pytest
            # worker, its C++ destructor can overlap the following process
            # session and deadlock both sides on their control pipes.  Run
            # every collected upstream case in a fresh interpreter so each
            # process/socket lifetime is fully isolated; no case is omitted.
            python -m pytest -ra --reruns=3 -n=1 \
                --ignore=tests/python/disco/test_session.py \
                tests/python/disco || _suite_failed=1

            # pyproject.toml adds -v globally; without overriding addopts,
            # `pytest -q --collect-only` prints a collection tree instead of
            # flat node IDs.  Keep the collection format deterministic and
            # fail rather than silently omitting this stateful test module.
            local -a _session_tests=()
            mapfile -t _session_tests < <(
                python -m pytest -o addopts='' --collect-only -q \
                    tests/python/disco/test_session.py \
                    | sed -n '/^tests\/python\/disco\/test_session.py::/p'
            )
            if (( ${#_session_tests[@]} == 0 )); then
                printf 'No Disco session tests were collected\n' >&2
                return 1
            fi
            printf 'Running %d Disco session cases in isolated processes\n' \
                "${#_session_tests[@]}"
            local _session_test _session_attempt
            for _session_test in "${_session_tests[@]}"; do
                # pytest-rerunfailures can retry an ordinary test failure, but
                # not a native crash that terminates the entire interpreter.
                # Retry the already-isolated process as well, retaining the
                # same bounded three-attempt policy for either failure mode.
                for _session_attempt in 1 2 3; do
                    if python -m pytest -ra --reruns=3 "$_session_test"; then
                        break
                    fi
                    if (( _session_attempt == 3 )); then
                        _suite_failed=1
                        break
                    fi
                    printf 'Retrying Disco session process (%d/3): %s\n' \
                        "$((_session_attempt + 1))" "$_session_test" >&2
                done
            done
        else
            python -m pytest -ra --reruns=3 -n "$_workers" --dist=loadfile \
                "tests/python/$_test_dir" || _suite_failed=1
        fi
    done

    # Collect all independent suite failures in one allocation, but never
    # package or promote an artifact if any test group failed.
    (( _suite_failed == 0 )) || return 1

    # Representative end-to-end CPU compilation and execution.
    python - <<'PY'
from pathlib import Path

import numpy as np
import tvm
import tvm.testing
from tvm import te

assert "_check" in str(Path(tvm.__file__).resolve())
assert tvm.__version__ == "0.26.0"
assert tvm.runtime.enabled("llvm")
assert tvm.runtime.enabled("opencl")

n = tvm.runtime.convert(128)
a = te.placeholder((n,), name="a")
b = te.placeholder((n,), name="b")
c = te.compute(a.shape, lambda i: a[i] + b[i], name="c")
schedule = tvm.s_tir.Schedule(te.create_prim_func([a, b, c]))
outer, inner = schedule.split(schedule.get_loops("c")[0], factors=[None, 4])
schedule.parallel(outer)
schedule.vectorize(inner)
kernel = tvm.compile(schedule.mod, target="llvm")

rng = np.random.default_rng(0)
lhs = rng.random(128, dtype=np.float32)
rhs = rng.random(128, dtype=np.float32)
lhs_t = tvm.runtime.tensor(lhs)
rhs_t = tvm.runtime.tensor(rhs)
out_t = tvm.runtime.tensor(np.zeros(128, dtype=np.float32))
kernel(lhs_t, rhs_t, out_t)
tvm.testing.assert_allclose(out_t.numpy(), lhs + rhs, rtol=1e-6)
PY
}

package_tvm() {
    pkgdesc="Native libraries and development files for the machine-learning compiler"
    depends=(
        'llvm-libs'
        'ocl-icd'
        'openblas'
        'z3>=4.16.0'
    )
    optdepends=(
        'opencl-driver: execute generated programs on an OpenCL device'
        'python-tvm: Python bindings'
    )

    cd "$pkgbase-$pkgver"
    DESTDIR="$pkgdir" cmake --install build

    # TVM links its native libraries against the bundled TVM FFI subproject,
    # but upstream's subproject install guard omits that library and its public
    # headers from a top-level TVM install.  Ship the exact FFI build used by
    # TVM so native consumers do not depend on Python's private wheel layout.
    install -Dm755 build/lib/libtvm_ffi.so "$pkgdir/usr/lib/libtvm_ffi.so"
    install -d "$pkgdir/usr/include/tvm" "$pkgdir/usr/include"
    cp -r --no-preserve=ownership 3rdparty/tvm-ffi/include/tvm/ffi \
        "$pkgdir/usr/include/tvm/"
    cp -r --no-preserve=ownership \
        3rdparty/tvm-ffi/3rdparty/dlpack/include/dlpack \
        "$pkgdir/usr/include/"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 NOTICE "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}

package_python-tvm() {
    pkgdesc="Python bindings for the Apache TVM deep-learning compiler"
    depends=(
        "tvm=$pkgver"
        'python'
        'python-apache-tvm-ffi>=0.1.13.post2'
        'python-ml-dtypes'
        'python-numpy'
        'python-typing_extensions'
    )
    optdepends=(
        'ipython: rich output in notebooks and meta-schedule tables'
        'python-black: TVMScript formatting fallback'
        'python-cloudpickle: popen process pools and RPC'
        'python-coremltools: Core ML backend'
        'python-cuda: CUDA compiler discovery and NVCC helpers'
        'python-docker: Hexagon tool helpers'
        'python-flashinfer: FlashInfer backend integration'
        'python-flatbuffers: TFLite model import'
        'python-jax: StableHLO model import'
        'python-jaxlib: StableHLO model import'
        'python-jinja: CUTLASS code generation'
        'python-onnx: ONNX model import'
        'python-packaging: Triton version handling and syntax highlighting'
        'python-pandas: meta-schedule reports and benchmarks'
        'python-psutil: process pools, RPC and meta-schedule CPU discovery'
        'python-pygments: highlighted TVMScript output'
        'python-pytest: tvm.testing pytest helpers'
        'python-pytest-xdist: distributed tvm.testing execution'
        'python-pytorch: PyTorch model import and tensor interoperability'
        'python-requests: robust contrib.download size validation'
        'python-scipy: TOPI reference implementations'
        'python-structlog: distributed runtime structured logging'
        'python-sympy: PyTorch Export symbolic-shape import'
        'python-tflite: TFLite model schema'
        'python-tornado: RPC tracker and proxy'
        'python-tqdm: meta-schedule progress reporting'
        'python-triton: Triton frontend'
        'python-xgboost: meta-schedule XGBoost cost model'
    )

    cd "$pkgbase-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # The native split package owns shared libraries and headers. libinfo.py's
    # system fallbacks keep every compiler/export workflow functional without
    # duplicating those large files inside site-packages.
    local _site
    _site="$(python -c 'import sysconfig; print(sysconfig.get_path("platlib"))')"
    rm -rf "$pkgdir$_site/tvm/lib" "$pkgdir$_site/tvm/include"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 NOTICE "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}
