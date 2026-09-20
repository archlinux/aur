# Maintainer: Smoolak <smoolak@gmail.com>
pkgname=python-aiconfigurator-core
pkgver=0.12.0
pkgrel=1
_commit=7bdd746cedc46f4d555ccbd3d0d2194c4015219f
pkgdesc='Standalone AIConfigurator modeling data and native Rust estimators'
arch=('x86_64')
url='https://github.com/ai-dynamo/aiconfigurator'
license=('Apache-2.0')
# The cc-built bundled zstd archive must contain native objects, not GCC LTO
# bytecode that Rust's linker cannot resolve (observed missing ZSTD_* symbols).
options=('!lto')
depends=('glibc' 'gcc-libs' 'python>=3.11' 'python-packaging>=20.0'
  'python-numpy>=2.1' 'python-numpy<3' 'python-pandas>=2.2.3'
  'python-pyarrow>=15.0.0' 'python-yaml>=6.0' 'python-scipy>=1.13.1')
makedepends=('cargo' 'git' 'git-lfs' 'python-build' 'python-installer'
  'python-maturin>=1.12' 'python-maturin<2' 'python-setuptools>=69' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-mock' 'python-pytest-timeout'
  'python-jinja>=3.1.0' 'python-matplotlib>=3.9.4' 'python-plotext>=5.3.2' 'python-plotext<6'
  'python-plotly>=6.0.1' 'python-prettytable>=3.16.0' 'python-pydantic>=2.5'
  'python-tqdm>=4.0.0' 'python-bokeh' 'python-nvidia-ml-py' 'python-munch>=4.0.0')
source=("git+https://github.com/ai-dynamo/aiconfigurator.git#commit=$_commit")
sha256sums=('SKIP')

prepare() {
  cd aiconfigurator
  git lfs install --local
  git config lfs.url https://github.com/ai-dynamo/aiconfigurator.git/info/lfs
  git lfs pull
  # Allow Arch's Python 3.14; the upstream tests exercise the Python/native
  # interface and the installed package is checked separately.
  sed -i 's/requires-python = ">=3.11,<3.14"/requires-python = ">=3.11"/' \
    pyproject.toml aic-core/pyproject.toml
  # Keep the cross-package metadata contract aligned with the distribution's
  # Python support range; retain its comparisons and the behavioral tests.
  sed -i 's/SUPPORTED_PYTHON = ">=3.11,<3.14"/SUPPORTED_PYTHON = ">=3.11"/' \
    tests/cross_package/test_core_version_contract.py
}

build() {
  cd aiconfigurator/aic-core
  export CARGO_HOME="$srcdir/cargo"
  # Preserve portable CPU targeting while optimizing the cross-crate native
  # estimator. GCC's mixed-language LTO remains disabled above; this is LLVM
  # LTO entirely within the Rust release build, not incompatible C bitcode.
  export CARGO_PROFILE_RELEASE_LTO=fat
  export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
  python -m build --wheel --no-isolation
}

check() {
  cd aiconfigurator
  export CARGO_HOME="$srcdir/cargo"
  local root="$srcdir/test-install" site
  site="$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')"
  python -m installer --destdir="$root" aic-core/dist/*.whl
  # Same-source upper SDK is a fixture for the upstream cross-package/native
  # contracts. It is not shipped with the standalone core package.
  python -m build --wheel --no-isolation
  python -m installer --destdir="$root" dist/*.whl
  export PYTHONPATH="$root$site"
  export HF_HUB_OFFLINE=1 TRANSFORMERS_OFFLINE=1 MPLBACKEND=agg
  cargo test --locked --workspace --no-default-features
  AIC_REQUIRE_EMBEDDED_ROUND_TRIP=1 cargo test --locked --workspace --all-features
  python -m pytest -o addopts='' --confcutdir=tests/cross_package tests/cross_package
  python -m pytest -o addopts='' aic-core/rust/aiconfigurator-core/parity_tests
}

package() {
  cd aiconfigurator
  python -m installer --destdir="$pkgdir" aic-core/dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
