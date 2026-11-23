# Maintainer: clalos <clalos at users dot noreply dot github dot com>

pkgname=browser-use-cli
_pyname=browser_use
pkgver=1.0.8
pkgrel=1
_pydantic_ai_ver=2.66.0
pkgdesc='CLI for browser automation with AI agents'
arch=(any)
url='https://github.com/browser-use/browser-use'
license=(MIT)
depends=(
  python
  python-anthropic
  python-anyio
  python-dotenv
  python-genai-prices
  python-google-genai
  python-griffelib
  python-httpx
  python-httpx2
  python-idna
  python-logfire-api
  python-mcp
  python-openai
  python-opentelemetry-api
  python-pillow
  python-pydantic
  python-tiktoken
  python-typing-inspection
  python-typing_extensions
  python-uuid7
  python-websockets
)
optdepends=(
  'python-boto3: Amazon Bedrock models (bedrock:<model id>)'
  'python-groq: Groq models (groq:<model>) (AUR)'
  'python-mistralai: Mistral models (mistral:<model>) (AUR)'
)
makedepends=(
  python-build
  python-installer
  python-wheel
  python-hatchling
  python-setuptools
  python-uv-dynamic-versioning
)
provides=(python-browser-use)
# Every .tar.gz entry is a PyPI sdist that is built and installed below. The
# first one is browser-use itself; the rest are runtime dependencies that are
# not packaged in the official repositories or the AUR. Keep their versions in
# sync with the pins in upstream's pyproject.toml (pydantic-ai-slim pins
# pydantic-graph to its own version, hence the shared variable).
source=(
  "https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz"
  "https://files.pythonhosted.org/packages/source/b/browser_harness/browser_harness-0.1.13.tar.gz"
  "https://files.pythonhosted.org/packages/source/c/cdp_use/cdp_use-1.4.5.tar.gz"
  "https://files.pythonhosted.org/packages/source/f/fetch_use/fetch_use-0.4.0.tar.gz"
  "https://files.pythonhosted.org/packages/source/p/pydantic_ai_slim/pydantic_ai_slim-$_pydantic_ai_ver.tar.gz"
  "https://files.pythonhosted.org/packages/source/p/pydantic_graph/pydantic_graph-$_pydantic_ai_ver.tar.gz"
)
sha256sums=('a3843cc083fb5764a4f10dc838ff1841cbe9076dd26e49aa3276ac016ff4d319'
            '284dc547a042c309feafd9a9f4a74b2a8651b7963ea3ac6cb2f2d64889f6a8f3'
            '0da3a32df46336a03ff5a22bc6bc442cd7d2f2d50a118fd4856f29d37f6d26a0'
            '9511987d4907ec6dac501e21d66946d10098f66b5d21bc2aba4189cd81ba189a'
            '78968fa75086ddae9039bdaa3939e9510f15a40d5f1f58fb3ded04386f9292f2'
            'af31fd3ad5f3446556a270b14e1a43b12996f4bb52a0511f58f739dbacadb3f9')

# extra/python-openai is older than the openai>=3.31.0 that pydantic-ai-slim asks
# for. Its Response has no prompt_cache_diagnostics (the attribute is missing, or
# a plain dict when the server sends it), so treat the field as absent unless the
# SDK parsed it. Drop this once python-openai in extra reaches 3.31.
prepare() {
  cd "$srcdir/pydantic_ai_slim-$_pydantic_ai_ver"
  sed -i \
    -e "s/if response\.prompt_cache_diagnostics is not None:/if hasattr(getattr(response, 'prompt_cache_diagnostics', None), 'model_dump'):/" \
    -e "s/if (diagnostics := response\.prompt_cache_diagnostics) is not None:/if hasattr(diagnostics := getattr(response, 'prompt_cache_diagnostics', None), 'model_dump'):/" \
    pydantic_ai/models/openai.py
  grep -qF "if hasattr(getattr(response, 'prompt_cache_diagnostics', None), 'model_dump'):" pydantic_ai/models/openai.py
  grep -qF "if hasattr(diagnostics := getattr(response, 'prompt_cache_diagnostics', None), 'model_dump'):" pydantic_ai/models/openai.py
}

# Upstream pins exact versions of its build backends (hatchling, setuptools)
# that rarely match the ones in the repositories. The pinned versions bring
# nothing the packaged ones lack, so skip the check rather than fail on it.
# The pydantic-ai-slim sdist needs the uv-dynamic-versioning hatch plugin
# present, but its version comes from the sdist's PKG-INFO, not from git.
build() {
  local _src
  for _src in "${source[@]##*/}"; do
    [[ $_src == *.tar.gz ]] || continue
    cd "$srcdir/${_src%.tar.gz}"
    python -m build --wheel --skip-dependency-check --no-isolation
  done
}

package() {
  local _src
  for _src in "${source[@]##*/}"; do
    [[ $_src == *.tar.gz ]] || continue
    python -m installer --destdir="$pkgdir" "$srcdir/${_src%.tar.gz}"/dist/*.whl
  done
  # pydantic-ai's own CLI: needs its cli extra and is not part of browser-use
  rm "$pkgdir/usr/bin/pai"

  install -Dm644 "$_pyname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set sw=2 sts=-1 et:
