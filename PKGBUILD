# Maintainer: Smoolak <smoolak@gmail.com>
# Contributor: ThePirate42 <aur at thepirate42 dot org>

pkgname=datamodel-code-generator
pkgver=0.88.0
pkgrel=1
pkgdesc='Generate Python models from JSON Schema, OpenAPI, JSON, and YAML'
arch=('any')
url='https://github.com/datamodel-code-generator/datamodel-code-generator'
license=('MIT')
provides=("python-datamodel-code-generator=$pkgver")
conflicts=('python-datamodel-code-generator')
depends=('python' 'python-argcomplete' 'python-black' 'python-genson'
         'python-inflect' 'python-isort' 'python-jinja' 'python-pydantic>=2.12'
         'python-pydantic-core' 'python-yaml' 'python-typing_extensions>=4.16')
# GenSON declares these wheel tools in PKGBUILD but omits them from .SRCINFO.
# Declare them here too so the public helper can provision its build inputs.
makedepends=('git' 'python-build' 'python-installer' 'python-wheel'
             'python-hatchling' 'python-hatch-vcs')
checkdepends=('python-pytest' 'python-pytest-mock' 'python-time-machine'
              'python-inline-snapshot' 'python-msgspec' 'python-packaging'
              'python-httpx' 'python-jsonschema')
optdepends=(
  'python-graphql-core: GraphQL input'
  'python-httpx: remote schema retrieval'
  'python-grpcio-tools: Protocol Buffers input'
  'ruff: Ruff output formatter'
  'python-watchfiles: watch mode'
  'python-msgspec: use generated msgspec models'
  'python-openapi-spec-validator: optional OpenAPI validation'
  'python-prance: optional OpenAPI validation'
)
_commit=1ebbfc2264f9cd28545f5e4a3adc121ce71cd7e3
source=("source::git+${url}.git#commit=$_commit")
sha256sums=('SKIP')

build() {
  cd source
  export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd source
  python -m installer --destdir="$srcdir/check-install" dist/*.whl
  local site_packages
  site_packages="$(python -c 'import site; print(site.getsitepackages()[0])')"
  # Run upstream reference/type handling and representative schema generation
  # against the wheel. Network services and exhaustive output-backend matrices
  # are outside this offline packaging check.
  DATAMODEL_STAGED_ROOT="$srcdir/check-install" \
    PYTHONNOUSERSITE=1 PYTHONPATH="$srcdir/check-install$site_packages:$PWD" python -P - <<'PYTEST'
import os
from pathlib import Path
import sys

import datamodel_code_generator
import pytest

staged = Path(os.environ["DATAMODEL_STAGED_ROOT"]).resolve()
assert Path(datamodel_code_generator.__file__).resolve().is_relative_to(staged)
result = pytest.main([
    "-v", "--import-mode=importlib",
    "tests/test_reference.py", "tests/test_types.py", "tests/test_util.py",
    "tests/parser/test_jsonschema.py::test_parser_template_data_reuse",
    "tests/parser/test_jsonschema.py::test_parser_template_data_root_cycle",
    "tests/parser/test_jsonschema.py::test_schema_validator_root_alias_uses_output_model_capability",
])
for name, module in tuple(sys.modules.items()):
    if name == "datamodel_code_generator" or name.startswith("datamodel_code_generator."):
        origin = getattr(module, "__file__", None)
        if origin:
            assert Path(origin).resolve().is_relative_to(staged), (name, origin)
raise SystemExit(result)
PYTEST
}

package() {
  cd source
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
