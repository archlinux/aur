# Maintainer: Smoolak <smoolak@gmail.com>
pkgname=python-aiconfigurator
pkgver=0.12.0
pkgrel=1
_commit=7bdd746cedc46f4d555ccbd3d0d2194c4015219f
pkgdesc='Offline inference configuration planner and configuration generator'
arch=('any')
url='https://github.com/ai-dynamo/aiconfigurator'
license=('Apache-2.0')
depends=('python>=3.11' 'python-aiconfigurator-core=0.12.0' 'python-jinja>=3.1.0'
  'python-packaging>=20.0' 'python-matplotlib>=3.9.4'
  'python-numpy>=2.1' 'python-numpy<3' 'python-pandas>=2.2.3'
  'python-plotext>=5.3.2' 'python-plotext<6' 'python-plotly>=6.0.1' 'python-prettytable>=3.16.0'
  'python-pydantic>=2.5' 'python-pyarrow>=15.0.0' 'python-yaml>=6.0'
  'python-tqdm>=4.0.0' 'python-bokeh' 'python-nvidia-ml-py' 'python-munch>=4.0.0')
makedepends=('git' 'git-lfs' 'python-build' 'python-installer'
  'python-setuptools>=69' 'python-wheel')
checkdepends=('python-pytest>=9.0.3' 'python-pytest-mock>=3.14.0'
  'python-pytest-timeout>=2.3.1' 'python-jsonschema>=4.23')
optdepends=('python-fastapi>=0.115.12: HTTP service'
  'python-orjson>=3.10.16: HTTP service serialization'
  'uvicorn>=0.34.2: HTTP service runner')
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
}

build() {
  cd aiconfigurator
  python -m build --wheel --no-isolation
}

check() {
  cd aiconfigurator
  local root="$srcdir/test-install" site
  site="$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')"
  python -m installer --destdir="$root" dist/*.whl
  export PYTHONPATH="$root$site" PATH="$root/usr/bin:$PATH"
  export HF_HUB_OFFLINE=1 TRANSFORMERS_OFFLINE=1 MPLBACKEND=agg
  # Representative offline CPU coverage: CLI parsing, Dynamo configuration
  # adapters, and deployment-config generation. GPU collectors, private model
  # fixtures and exhaustive hardware support matrices are outside this scope.
  python -m pytest -o addopts='' --timeout=300 \
    tests/unit/cli/test_argument_parsing.py \
    tests/unit/cli/test_root_command.py \
    tests/unit/cli/test_generate_combinations.py \
    tests/unit/sdk/config_adapter/test_schema.py \
    tests/unit/sdk/config_adapter/test_dynamo.py \
    tests/unit/generator/test_translate.py \
    tests/unit/generator/test_template_selection.py
}

package() {
  cd aiconfigurator
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
