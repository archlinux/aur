# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-ai-dynamo-runtime
pkgver=1.5.0
pkgrel=1
_commit=b83b1d9304ebfc624709ac46db32b1b6f1ff1615
pkgdesc='NVIDIA Dynamo inference framework runtime (Rust/pyo3 core)'
arch=('x86_64')
url='https://github.com/ai-dynamo/dynamo'
license=('Apache-2.0')
# makepkg's default LTO (-flto=auto) makes the cc crate compile the bundled C libs
# (aws-lc, pcre2, the nixl wrapper) to LTO-bytecode objects, which the non-LTO Rust
# cdylib link can't materialize -> 100s of undefined symbols in _core.abi3.so at
# import. Disable LTO so those archives carry real objects.
options=('!lto')
depends=(
  'python'
  'python-pydantic>=2.10.6'
  'python-pydantic<2.14'
  'python-uvloop>=0.21.0'
  'nixl'
  'openucx'
)
optdepends=(
  'python-aiconfigurator-core=0.12.0: native AIC mocker performance modeling'
  'python-nixl: Python NIXL connector support (also supplies NumPy and PyTorch)'
  'python-transformers: logits-processing examples'
)
makedepends=(
  'cargo'
  'clang'
  'cuda'
  'git'
  'patchelf'
  'protobuf'
  'python-build'
  'python-installer'
  'python-maturin'
  # Required to build the public plotext dependency used by AIConfigurator.
  'python-setuptools'
  'python-wheel'
  'rust'
)
checkdepends=(
  'python-aiconfigurator-core=0.12.0'
  'etcd'
  'nats-server'
  'python-aiohttp'
  'python-filterpy=1.4.5'
  'python-grpcio'
  'python-msgspec'
  'python-nixl'
  'python-numpy'
  'python-packaging'
  'python-pandas'
  'python-pmdarima>=2.1.1'
  'python-plotly>=6.0.1'
  'python-prometheus-api-client>=0.6.0'
  'python-prometheus-api-client<1.0.0'
  'python-prometheus_client>=0.23.1'
  'python-prometheus_client<1.0'
  'python-prophet>=1.1.7'
  'python-prophet<2.0.0'
  'python-protobuf'
  'python-kubernetes'
  'python-pytest'
  'python-pytest-asyncio'
  'python-pytest-benchmark'
  'python-pytest-forked'
  'python-pytest-timeout'
  'python-requests'
  'python-scikit-learn>=1.7.2'
  'python-scikit-learn<2.0.0'
  'python-tritonclient'
  'python-transformers'
  'python-yaml=6.0.3'
)
source=(
  "git+https://github.com/ai-dynamo/dynamo.git#commit=${_commit}"
  'python314-test-cleanup.patch'
)
sha256sums=(
  'SKIP'
  '25350951a0d4d333243087226ba944af2ff4e31dc5d68bb7cc6a1deab3c432ec'
)

pkgver() { echo "$pkgver"; }

prepare() {
  cd dynamo
  # 1.4.2 replaced the eager generator adapter with a demand-driven stream.
  # Drop the obsolete Rust/cancellation-test patch and keep resource cleanup.
  patch -Np1 --fuzz=0 -i "$srcdir/python314-test-cleanup.patch"

  cd lib/bindings/python
  # maturin's build-requires lists the pip 'patchelf'; Arch provides the binary
  # (makedepends), so drop it so the --no-isolation build-dep check passes.
  sed -i 's/, "patchelf"//' pyproject.toml
  # Upstream's <=2.13 excludes bug-fix releases such as Arch's 2.13.4.
  # Preserve the intended 2.13-series ceiling while accepting patch releases.
  sed -i 's/pydantic>=2\.10\.6,<=2\.13/pydantic>=2.10.6,<2.14/' pyproject.toml
  # Match the feature set used by upstream's production runtime wheel.  Cargo
  # defaults to an intentionally lean library build. Match the common 1.5.0
  # production flags in container/templates/wheel_builder.Dockerfile, including
  # the renamed mm-routing feature and the slot/selection/AIC services.
  python - <<'PY'
from pathlib import Path

path = Path("pyproject.toml")
text = path.read_text(encoding="utf-8")
anchor = "[tool.maturin]\n"
assert text.count(anchor) == 1
path.write_text(
    text.replace(anchor, anchor + 'features = ["kv-indexer", "slot-tracker", "select-service", "mm-routing", "aic-forward-pass", "request-trace-s3"]\n'),
    encoding="utf-8",
)
PY
}

build() {
  cd dynamo/lib/bindings/python
  export CARGO_HOME="${srcdir}/cargo"
  # dynamo's code uses tokio's UNSTABLE RuntimeMetrics API (worker_steal_count,
  # worker_mean_poll_time, ...), which require --cfg tokio_unstable. dynamo ships a
  # .cargo/config.toml setting this, but maturin's build doesn't honour those config
  # rustflags, so set it explicitly (env RUSTFLAGS takes precedence over config).
  unset CARGO_ENCODED_RUSTFLAGS
  export RUSTFLAGS="--cfg tokio_unstable${RUSTFLAGS:+ $RUSTFLAGS}"
  # nixl-sys locates NIXL via NIXL_PREFIX (default /opt/nvidia/nvda_nixl); our nixl
  # package is in /usr. With this set, nixl-sys compiles its real wrapper.cpp against
  # libnixl. (Those symbols, and the bundled aws-lc/pcre2, link into the cdylib only
  # because options=('!lto') stops the cc crate emitting unlinkable LTO objects.)
  export NIXL_PREFIX=/usr
  # cudarc 0.19.3 only knows CUDA toolkits up to 13.1 and panics on Arch's 13.2.
  # CUDARC_CUDA_VERSION (checked before nvcc detection) pins 13.1 (format
  # majorMINOR0 -> "13010"); CUDA 13.x is forward-compatible so 13.1 bindings work.
  export CUDARC_CUDA_VERSION=13010
  python -m build --wheel --no-isolation
}

check() {
  cd dynamo/lib/bindings/python
  export CARGO_HOME="${srcdir}/cargo"
  unset CARGO_ENCODED_RUSTFLAGS
  export RUSTFLAGS="--cfg tokio_unstable${RUSTFLAGS:+ $RUSTFLAGS}"
  export NIXL_PREFIX=/usr
  export CUDARC_CUDA_VERSION=13010

  # This crate is an upstream sub-workspace.  Run the same complete Rust test
  # surfaces as upstream CI, including doctests and every target.
  cargo test --locked --features 'kv-indexer,slot-tracker,select-service,mm-routing,aic-forward-pass,request-trace-s3' --doc
  # PyO3's extension-module feature correctly leaves Python symbols unresolved
  # in the wheel: the importing interpreter supplies them. The standalone Rust
  # test executable has no such host, and production features retain Python
  # error/drop paths even in otherwise CPU-only Rust tests. Link libpython only
  # into that test executable; do not change features or relink the ABI3 wheel.
  # A narrowly scoped linker adapter also preserves the already compiled Rust
  # dependencies, unlike changing RUSTFLAGS for the whole dependency graph.
  local test_linker="${srcdir}/test-linker"
  python - "$test_linker" <<'PY'
from pathlib import Path
import shutil
import sys
import sysconfig

directory = Path(sys.argv[1])
directory.mkdir(exist_ok=True)
name = "x86_64-linux-gnu-gcc"
real = shutil.which(name)
assert real and not Path(real).is_relative_to(directory)
library = sysconfig.get_config_var("LDLIBRARY")
assert library.startswith("libpython") and ".so" in library
link_flags = ["-L" + sysconfig.get_config_var("LIBDIR"), "-l" + library[3:].split(".so")[0]]
script = directory / name
script.write_text(
    "#!/usr/bin/python\nimport os,sys\nfrom pathlib import Path\n"
    "args=sys.argv[1:]\n"
    "output=args[args.index('-o')+1] if '-o' in args else ''\n"
    "if Path(output).name.startswith('_core-') and '-shared' not in args:\n"
    f"    args += {link_flags!r}\n"
    f"os.execv({real!r}, [{real!r}, *args])\n"
)
script.chmod(0o755)
PY
  # The lifecycle test enters Python::with_gil(). Unlike an imported extension,
  # this standalone executable must also initialize its interpreter. Enable
  # PyO3's embedding initialization only for tests, after building the wheel.
  PATH="$test_linker:$PATH" cargo test --locked --features 'kv-indexer,slot-tracker,select-service,mm-routing,aic-forward-pass,request-trace-s3,pyo3/auto-initialize' --all-targets

  local site_packages
  local test_root="${srcdir}/test-install"
  local pytest_tmp="${srcdir}/pytest-tmp"
  site_packages="$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')"
  rm -rf "$test_root" "$pytest_tmp"
  python -m installer --destdir="$test_root" dist/*.whl

  # Prove that the built wheel, rather than only the Rust test artifact, carries
  # the production KV-indexer feature.  The feature-disabled shim prints a
  # diagnostic instead of exposing this CLI help surface.
  PYTHONPATH="$test_root$site_packages" python - \
    >"${srcdir}/.q" 2>&1 <<'PY'
from dynamo.llm import run_kv_indexer

try:
    run_kv_indexer(["--help"])
except SystemExit as exc:
    assert exc.code == 0
else:
    raise AssertionError("the indexer help path did not terminate through clap")
PY
  grep -Fq 'Standalone KV cache indexer' "${srcdir}/.q"
  ! grep -Fq 'not available in this build' "${srcdir}/.q"

  # The upstream Python binding suite is CPU-labelled and provisions
  # local NATS/etcd itself.  Keep it sequential on the canonical ports, as
  # documented by upstream, so no test is removed for lack of a GPU.
  # Upstream runs this binding suite with components/src on PYTHONPATH because
  # three binding tests exercise their integration with dynamo.common. Both
  # trees are PEP 420 namespace-package portions: keep the installed runtime
  # wheel first, and expose only the companion pure-Python namespace portion.
  # grpc 1.82 initializes Abseil while its Cython extension is imported.  That
  # aborts when another native component has already initialized the same
  # process-global logger.  gRPC provides this switch for embedders; disabling
  # its redundant initialization still exercises the complete gRPC path.  The
  # pytest-forked children inherit pytest 9's basetemp cleanup handlers and can
  # remove a shared basetemp from underneath later tmp_path users.  Isolate the
  # upstream files containing forked tests in their own complete invocations;
  # recreate its parent between invocations, then cover every remaining test
  # exactly once in the final invocation. Disable only global output capture:
  # pytest-forked 1.7.5 opens sys.stdout/stderr without retaining ownership;
  # pytest's capture.resume replaces them and raises unclosed-file warnings.
  # -s avoids that collision; all warning filters and test assertions remain.
  # Finish all groups even after a failure, then fail the complete check.
  local test_failure=0
  # patch.dict(sys.modules) restores the entire module registry, unloading
  # unrelated native modules imported inside the fixture. A subsequent Torch
  # import can corrupt CPython state. Restore only the explicitly mocked keys;
  # retain every assertion, including the missing-NIXL import behavior.
  python - <<'PY'
from pathlib import Path

helper = '''
from contextlib import contextmanager

@contextmanager
def _patch_modules(modules, replacements):
    with pytest.MonkeyPatch.context() as patcher:
        for name, value in replacements.items():
            patcher.setitem(modules, name, value)
        yield
'''
for filename in ("test_nixl_connect_lazy_import.py", "test_nixl_connect_unit.py"):
    path = Path("tests") / filename
    text = path.read_text()
    if "def _patch_modules(" not in text:
        assert text.count("patch.dict(\n") == 1
        text = text.replace("patch.dict(\n", "_patch_modules(\n")
        text = text.replace("from unittest.mock import MagicMock, patch", "from unittest.mock import MagicMock")
        path.write_text(text + helper)
PY
  # Tests intentionally leave loop-break requests running (implicit cancellation
  # is not implemented upstream). Tear those requests down explicitly AFTER
  # their assertions, and wait for generators before closing the event loop.
  python - "$srcdir/dynamo/lib/bindings/python/tests/cancellation/test_cancellation.py" <<'PY'
from pathlib import Path
import sys

path = Path(sys.argv[1])
text = path.read_text()
if "self._aur_inflight" not in text:
    replacements = [
        (
            '        self.context_metadata: dict[str, str] = {}\n',
            '        self.context_metadata: dict[str, str] = {}\n'
            '        self._aur_inflight = []\n',
        ),
        (
            '        async for response in method(request, context):\n'
            '            yield response\n',
            '        done = asyncio.Event()\n'
            '        self._aur_inflight.append((context, done))\n'
            '        try:\n'
            '            async for response in method(request, context):\n'
            '                yield response\n'
            '        finally:\n'
            '            done.set()\n',
        ),
        (
            '    # Cleanup - cancel server task\n',
            '    # Complete outstanding requests before shutting down the server.\n'
            '    for context, done in handler._aur_inflight:\n'
            '        context.stop_generating()\n'
            '    if handler._aur_inflight:\n'
            '        await asyncio.wait_for(\n'
            '            asyncio.gather(*(done.wait() for _, done in handler._aur_inflight)),\n'
            '            timeout=5,\n'
            '        )\n'
            '    # Cleanup - cancel server task\n',
        ),
    ]
    for old, new in replacements:
        assert text.count(old) == 1, old
        text = text.replace(old, new)
    path.write_text(text)
PY
  mkdir -p "$pytest_tmp"
  GRPC_PYTHON_DISABLE_ABSL_INIT_LOG=1 ENABLE_ISOLATED_ETCD_AND_NATS=0 \
  PYTHONPATH="$test_root$site_packages:${srcdir}/dynamo/components/src" \
    python -m pytest -s -o addopts='' --basetemp="$pytest_tmp/kserve-grpc" \
      tests/test_kserve_grpc.py || test_failure=1
  mkdir -p "$pytest_tmp"
  GRPC_PYTHON_DISABLE_ABSL_INIT_LOG=1 ENABLE_ISOLATED_ETCD_AND_NATS=0 \
  PYTHONPATH="$test_root$site_packages:${srcdir}/dynamo/components/src" \
    python -m pytest -s -o addopts='' --basetemp="$pytest_tmp/cancellation" \
      tests/cancellation || test_failure=1
  mkdir -p "$pytest_tmp"
  GRPC_PYTHON_DISABLE_ABSL_INIT_LOG=1 ENABLE_ISOLATED_ETCD_AND_NATS=0 \
  PYTHONPATH="$test_root$site_packages:${srcdir}/dynamo/components/src" \
    python -m pytest -s -o addopts='' --basetemp="$pytest_tmp/deprecated-nats" \
      tests/test_deprecated_enable_nats.py || test_failure=1
  mkdir -p "$pytest_tmp"
  GRPC_PYTHON_DISABLE_ABSL_INIT_LOG=1 ENABLE_ISOLATED_ETCD_AND_NATS=0 \
  PYTHONPATH="$test_root$site_packages:${srcdir}/dynamo/components/src" \
    python -m pytest -s -o addopts='' --basetemp="$pytest_tmp/http-server" \
      tests/test_http_server.py || test_failure=1
  mkdir -p "$pytest_tmp"
  # Replay/AIC integration belongs to the companion components package and
  # imports AISimulate at collection time. That optional Python dependency has
  # no public Arch provider and upstream excludes it on Python >=3.14. Keep
  # the runtime/AIC Rust coverage and all remaining binding tests intact.
  GRPC_PYTHON_DISABLE_ABSL_INIT_LOG=1 ENABLE_ISOLATED_ETCD_AND_NATS=0 \
  PYTHONPATH="$test_root$site_packages:${srcdir}/dynamo/components/src" \
    python -m pytest -s -o addopts='' --basetemp="$pytest_tmp/remainder" \
      --ignore=tests/replay/test_replay_aic_integration.py \
      --ignore=tests/test_kserve_grpc.py \
      --ignore=tests/cancellation \
      --ignore=tests/test_deprecated_enable_nats.py \
      --ignore=tests/test_http_server.py tests || test_failure=1
  return "$test_failure"
}

package() {
  cd dynamo/lib/bindings/python
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 "${srcdir}/dynamo/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
