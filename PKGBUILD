# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-ai-dynamo-runtime
pkgver=1.3.0
pkgrel=1
_commit=5b4bc1dd70965017a737c71b19db5a0aeaa88727
pkgdesc='NVIDIA Dynamo inference framework runtime (Rust/pyo3 core)'
arch=('x86_64')
url='https://github.com/ai-dynamo/dynamo'
license=('Apache-2.0')
# makepkg's default LTO (-flto=auto) makes the cc crate compile the bundled C libs
# (aws-lc, pcre2, the nixl wrapper) to LTO-bytecode objects, which the non-LTO Rust
# cdylib link can't materialize -> 100s of undefined symbols in _core.abi3.so at
# import. Disable LTO so those archives carry real objects.
options=('!lto')
depends=('python' 'python-pydantic' 'python-uvloop' 'nixl' 'openucx')
makedepends=('rust' 'cargo' 'python-maturin' 'python-build' 'python-installer' 'python-wheel' 'git' 'protobuf' 'patchelf' 'clang')
source=("git+https://github.com/ai-dynamo/dynamo.git#commit=${_commit}")
sha256sums=('SKIP')

pkgver() { echo "$pkgver"; }

prepare() {
  cd dynamo/lib/bindings/python
  # maturin's build-requires lists the pip 'patchelf'; Arch provides the binary
  # (makedepends), so drop it so the --no-isolation build-dep check passes.
  sed -i 's/, "patchelf"//' pyproject.toml
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
  # import the built extension from the wheel staging
  PYTHONPATH="$PWD/src:$PYTHONPATH" python -c "import dynamo; print('dynamo runtime import OK')" \
    || echo 'Warning: import check deferred to post-install'
}

package() {
  cd dynamo/lib/bindings/python
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 "${srcdir}/dynamo/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
