# Maintainer: clalos <clalos at users dot noreply dot github dot com>

pkgname=browser-use-cli
_pyname=browser_use
pkgver=0.13.8
pkgrel=2
pkgdesc='CLI for browser automation with AI agents'
arch=(any)
url='https://github.com/browser-use/browser-use'
license=(MIT)
depends=(
  python
  python-aiofiles
  python-aiohttp
  python-anyio
  python-click
  python-cloudpickle
  python-distro
  python-dotenv
  python-google-api-core
  python-google-api-python-client
  python-google-auth
  python-google-auth-oauthlib
  python-httpx
  python-markdownify
  python-openai
  python-pillow
  python-psutil
  python-pydantic
  python-pydantic-settings
  python-portalocker
  python-pypdf
  python-pyotp
  python-reportlab
  python-requests
  python-rich
  python-screeninfo
  python-textual
  python-typing_extensions
  python-uuid7
  python-websockets
)
optdepends=(
  'python-anthropic: Anthropic/Claude LLM provider (AUR)'
  'python-docx: read/write .docx files in the agent filesystem (AUR)'
  'python-inquirerpy: interactive template selection for browser-use init (AUR)'
  'python-google-genai: Google Gemini LLM provider'
  'python-groq: Groq LLM provider'
  'python-ollama: Ollama local LLM provider'
  'python-mcp: MCP server mode'
  'python-posthog: telemetry'
)
makedepends=(
  python-build
  python-installer
  python-wheel
  python-hatchling
  python-setuptools
)
provides=(python-browser-use)
# Every .tar.gz entry is a PyPI sdist that is built and installed below. The
# first one is browser-use itself; the rest are runtime dependencies that are
# not packaged in the official repositories or the AUR. Keep their versions in
# sync with the pins in upstream's pyproject.toml.
source=(
  "https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz"
  "https://files.pythonhosted.org/packages/source/b/bubus/bubus-1.5.6.tar.gz"
  "https://files.pythonhosted.org/packages/source/c/cdp_use/cdp_use-1.4.5.tar.gz"
  "https://files.pythonhosted.org/packages/source/b/browser_use_sdk/browser_use_sdk-3.4.2.tar.gz"
  "https://files.pythonhosted.org/packages/source/b/browser_harness/browser_harness-0.1.9.tar.gz"
  "https://files.pythonhosted.org/packages/source/f/fetch_use/fetch_use-0.4.0.tar.gz"
)
sha256sums=('2c868f099a66d8c33c0c346762d9b1c59e7254517bc900d3891e0b84767b977a'
            '1a5456f0a576e86613a7bd66e819891b677778320b6e291094e339b0d9df2e0d'
            '0da3a32df46336a03ff5a22bc6bc442cd7d2f2d50a118fd4856f29d37f6d26a0'
            'be050bc803b31ec4e9f23dfd71d9dc5f1160d7dec0b962327915caf743a10208'
            '4fa7bfa1f973ecf7f054375878868b79ee096ad6f29dea0783397c730327ac1c'
            '9511987d4907ec6dac501e21d66946d10098f66b5d21bc2aba4189cd81ba189a')

build() {
  local _src
  for _src in "${source[@]##*/}"; do
    [[ $_src == *.tar.gz ]] || continue
    cd "$srcdir/${_src%.tar.gz}"
    python -m build --wheel --no-isolation
  done
}

package() {
  local _src
  for _src in "${source[@]##*/}"; do
    [[ $_src == *.tar.gz ]] || continue
    python -m installer --destdir="$pkgdir" "$srcdir/${_src%.tar.gz}"/dist/*.whl
  done

  install -Dm644 "$_pyname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set sw=2 sts=-1 et:
