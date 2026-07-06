# Maintainer: clalos <clalos at users dot noreply dot github dot com>

pkgname=browser-use-cli
_pyname=browser_use
pkgver=0.13.3
pkgrel=1
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
)
provides=(python-browser-use)
source=(
  "https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz"
  "https://files.pythonhosted.org/packages/f5/54/23aae0681500a459fc4498b60754cb8ead8df964d8166e5915edb7e8136c/bubus-1.5.6-py3-none-any.whl"
  "https://files.pythonhosted.org/packages/56/12/386d8c6bf0448c43674e24d6194c3b57d62e5361e90bca3d58108819ad32/cdp_use-1.4.5-py3-none-any.whl"
  "https://files.pythonhosted.org/packages/84/e9/6dd224f9056b09622751821a91aa899b6d99447a761c74c4aabf4afd6e45/browser_use_sdk-3.4.2-py3-none-any.whl"
)
noextract=(
  bubus-1.5.6-py3-none-any.whl
  cdp_use-1.4.5-py3-none-any.whl
  browser_use_sdk-3.4.2-py3-none-any.whl
)
sha256sums=('b88b677b2234d1c7601f6e05c84fb5767723bf4c5ec4ed12ab1b880ed8221811'
            '254ae37cd9299941f5e9d6afb11f8e3ce069f83e5b9476f88c6b2e32912f237d'
            '8f8e2435e3a20e4009d2974144192cf3c132f6c2971338e156198814d9b91ecb'
            '1c6dac6e44f4ac4d552a3249d0282cb743d0d02bbadda093d78e599392c504d3')

build() {
  cd "$_pyname-$pkgver"
  /usr/bin/python -m build --wheel --no-isolation
}

package() {
  cd "$_pyname-$pkgver"
  /usr/bin/python -m installer --destdir="$pkgdir" dist/*.whl

  # Install bundled deps not available in official Arch repos or AUR
  for _whl in bubus-1.5.6-py3-none-any.whl \
              cdp_use-1.4.5-py3-none-any.whl \
              browser_use_sdk-3.4.2-py3-none-any.whl; do
    /usr/bin/python -m installer --destdir="$pkgdir" "$srcdir/$_whl"
  done

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set sw=2 sts=-1 et:
