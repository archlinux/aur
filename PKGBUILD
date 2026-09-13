# Maintainer: Smoolak <smoolak@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-prance
_name=prance
pkgver=26.07.19.0
pkgrel=1
_openapi_commit=902e5058da8b618e5773cf86def29dd08cd18540
pkgdesc="Resolving parser for Swagger/OpenAPI 2.0 and 3.x specifications"
arch=('any')
url="https://github.com/RonnyPfannschmidt/prance"
license=('MITNFA')
depends=(
  'python>=3.10'
  'python-chardet>=5.2'
  'python-packaging>=25.0'
  'python-requests>=2.32.5'
  'python-ruamel-yaml>=0.18.16'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools>80'
  'python-setuptools-scm>9'
  'python-wheel'
)
checkdepends=(
  'python-click>=8.3.0'
  'python-openapi-spec-validator>=0.7.1'
  'python-pyicu>=2.14'
  'python-pytest>=9.0.1'
  'python-pytest-cov>=7.0.0'
  'python-swagger-spec-validator>=3.0.4'
)
optdepends=(
  'python-click>=8.3.0: command-line interface'
  'python-flex>=6.14.1: Flex validation backend'
  'python-openapi-spec-validator>=0.7.1: OpenAPI 3 validation backend'
  'python-orjson>=3.9: faster JSON parsing'
  'python-pyicu>=2.14: ICU encoding detection'
  'python-swagger-spec-validator>=3.0.4: Swagger/OpenAPI 2 validation backend'
)
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  "OpenAPI-Specification-$_openapi_commit.tar.gz::https://github.com/OAI/OpenAPI-Specification/archive/$_openapi_commit.tar.gz"
)
sha256sums=(
  'ccd939d07ef5a0198ea67b684bebc71aa70ddea135583d25fc4d21d0a5436bfe'
  '4833f976d039f125266c80fa7611c0254a78053204d3fdba47c823c6ec89c400'
)

prepare() {
  cd "$_name-$pkgver"
  rm -rf tests/OpenAPI-Specification
  ln -s "$srcdir/OpenAPI-Specification-$_openapi_commit" \
    tests/OpenAPI-Specification
}

build() {
  cd "$_name-$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" \
    python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"

  rm -rf "$srcdir/test-root" "$srcdir/test-run"
  python -m installer --destdir="$srcdir/test-root" dist/*.whl
  local _site=("$srcdir"/test-root/usr/lib/python*/site-packages)
  local _project="$srcdir/$_name-$pkgver"
  mkdir -p "$srcdir/test-run"
  cp -a tests "$srcdir/test-run/"
  cd "$srcdir/test-run"

  PATH="$srcdir/test-root/usr/bin:$PATH" PYTHONPATH="${_site[0]}" \
    python -m pytest -c "$_project/pyproject.toml" \
      --import-mode=importlib -m 'not requires_network' tests

  PATH="$srcdir/test-root/usr/bin:$PATH" PYTHONPATH="${_site[0]}" \
    python - <<'PY'
import json
from pathlib import Path
from tempfile import TemporaryDirectory

import prance
from prance import ResolvingParser

assert "/test-root/usr/" in prance.__file__
with TemporaryDirectory(prefix="prance-check-") as directory:
    root = Path(directory)
    (root / "schemas.yaml").write_text(
        "components:\n"
        "  schemas:\n"
        "    Greeting:\n"
        "      type: object\n"
        "      required: [message]\n"
        "      properties:\n"
        "        message: {type: string}\n",
        encoding="utf-8",
    )
    (root / "api.yaml").write_text(
        "openapi: 3.0.3\n"
        "info: {title: Offline API, version: 1.0.0}\n"
        "paths:\n"
        "  /hello:\n"
        "    get:\n"
        "      responses:\n"
        "        '200':\n"
        "          description: greeting\n"
        "          content:\n"
        "            application/json:\n"
        "              schema:\n"
        "                $ref: schemas.yaml#/components/schemas/Greeting\n",
        encoding="utf-8",
    )
    parser = ResolvingParser(
        str(root / "api.yaml"), backend="openapi-spec-validator"
    )
    schema = parser.specification["paths"]["/hello"]["get"]["responses"][
        "200"
    ]["content"]["application/json"]["schema"]
    assert schema["required"] == ["message"]
    assert schema["properties"]["message"]["type"] == "string"
    (root / "resolved.json").write_text(
        json.dumps(parser.specification), encoding="utf-8"
    )
print("installed Prance local-reference resolution workflow: PASS")
PY

  PATH="$srcdir/test-root/usr/bin:$PATH" PYTHONPATH="${_site[0]}" \
    prance validate --backend swagger-spec-validator tests/specs/petstore.yaml
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
