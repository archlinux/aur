# Maintainer: John Ettedgui <git@johne.rojalabs.com>
# Upstream: https://github.com/mnemosyne-oss/mnemosyne

pkgname=python-mnemosyne-memory
_pkgname=mnemosyne
pkgver=3.15.1
pkgrel=1
pkgdesc='Zero-cloud AI memory layer, SQLite-backed, single dependency'
arch=('any')
url='https://github.com/mnemosyne-oss/mnemosyne'
license=('MIT')
depends=(
  'python'
  'python-yaml'
)
# The AUR mnemosyne flashcard application ships the same /usr/bin/mnemosyne
# console script and the same top-level site-packages/mnemosyne/ directory.
conflicts=('mnemosyne')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
  'python-numpy'
  'python-cryptography'
)
optdepends=(
  'python-mcp: MCP server support (mnemosyne mcp)'
  'python-cryptography: encrypted sync payloads (mnemosyne sync --encrypt)'
  'python-huggingface-hub: model downloads for local LLM consolidation (llm extra; runtimes ctransformers/llama-cpp-python are unpackaged)'
  'python-fastembed: local embedding models (embeddings extra, AUR)'
  'python-sqlite-vec: vector search acceleration (embeddings extra, AUR)'
  'python-numpy: binary vector search and SHMR reasoning (optional at runtime)'
  'uvicorn: web server for mnemosyne-browser'
  'python-fastapi: web framework for mnemosyne-browser'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/mnemosyne-oss/mnemosyne/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('87b837ac254a5bae40aba7039f4acbfd54d0dd38d9d3bf0714836fab667f787d')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  rm -rf build dist *.egg-info
  python -m build --wheel --no-isolation
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  # The suite honors these locations; unset them so a builder's environment
  # cannot redirect test writes into a shared directory.
  unset HERMES_HOME MNEMOSYNE_DATA_DIR
  # Keep HOME inside the build tree: the suite writes under ~/.hermes and
  # the builder's real home may not be writable.
  mkdir -p "$srcdir/.test-home"
  # The in-tree Hermes integration is exercised by part of the suite.
  export PYTHONPATH="$srcdir/$_pkgname-$pkgver/integrations/hermes/src${PYTHONPATH:+:$PYTHONPATH}"
  # Run the MCP tests only when python-mcp is available; otherwise skip
  # the file that hard-requires it.
  if python -c 'import mcp' >/dev/null 2>&1; then
    _mcp_ignore=()
  else
    _mcp_ignore=(--ignore=tests/test_mcp_server.py)
  fi
  # Mirrors the upstream CI lexical-only job, so the suite does not
  # download embedding models from the network.
  HOME="$srcdir/.test-home" MNEMOSYNE_NO_EMBEDDINGS=1 \
    python -m pytest tests/ --tb=short -q "${_mcp_ignore[@]}"
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  local purelib
  purelib="$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')"
  # Upstream setuptools config ships examples/ and integrations/ (including
  # Hermes tests and a nested, non-importable copy) into site-packages;
  # neither is needed by the installed CLI.
  rm -rf "$pkgdir$purelib/examples" "$pkgdir$purelib/integrations"
  # The wheel omits the Hermes provider manifest that mnemosyne-install
  # symlinks into ~/.hermes/plugins/mnemosyne.
  install -Dm644 hermes_memory_provider/plugin.yaml \
    "$pkgdir$purelib/hermes_memory_provider/plugin.yaml"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  # RELEASING.md intentionally omitted (maintainer doc).
  install -Dm644 README.md CHANGELOG.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
