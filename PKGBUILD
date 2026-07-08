# Maintainer: wyf9661 <wyf9661@hotmail.com>
# Contributor: Nous Research <ops@nousresearch.com>

_pkgname=hermes-agent
pkgname=python-${_pkgname}
tag=2026.7.7.2
pkgver=0.18.2
pkgrel=2
pkgdesc="The self-improving AI agent — creates skills from experience, improves them during use, and runs anywhere"
arch=('any')
url="https://github.com/NousResearch/${_pkgname}"
license=('MIT')
depends=('python>=3.11' 'python-dotenv' 'python-prompt_toolkit' 'python-openai' 'python-fire'
          'python-ruamel-yaml' 'python-rich' 'python-pyjwt' 'python-tenacity' 'python-yaml'
          'python-httpx' 'python-requests' 'python-jinja' 'python-pydantic' 'python-psutil'
          'python-markdown' 'python-pathspec' 'python-ptyprocess'
          'python-certifi' 'python-packaging' 'python-urllib3' 'python-websockets'
          'python-pillow' 'python-multipart' 'python-cryptography'
          'python-fastapi' 'python-starlette' 'uvicorn')
optdepends=('python-telegram-bot: Telegram messaging support'
            'python-discord: Discord messaging support (PyPI: discord.py)'
            'python-aiohttp: Async HTTP for messaging/web, QQ bot & Wechat messaging needs this'
            'python-mcp: Model Context Protocol support'
            'python-anthropic: Anthropic Claude API support'
            'python-faster-whisper: Local voice transcription'
            'python-sounddevice: Audio I/O for voice'
            'python-numpy: Numerical computing for voice/other'
            'python-simple-term-menu: Interactive CLI menu'
            'python-slack-sdk: Slack integration'
            'python-qrcode: QR code generation for auth'
            'python-croniter: Cron scheduling support (upstream-required, AUR)'
            'python-exa-py: Exa web search backend'
            'python-firecrawl-py: Firecrawl web search backend'
            'python-fal-client: Fal image generation backend'
            'python-edge-tts: Edge TTS TTS backend'
            'python-brotlicffi: Brotli compression for aiohttp'
            'python-mautrix: Matrix messaging support'
            'python-aiosqlite: SQLite async for Matrix'
            'python-asyncpg: PostgreSQL async for Matrix'
            'python-aiohttp-socks: SOCKS proxy for Matrix'
            'python-defusedxml: XML hardening for WeCom')
makedepends=('python-installer' 'python-wheel' 'python-build' 'python-setuptools' 'nodejs' 'npm')
# Binary is a self-contained Bun executable with embedded JS/resources - stripping breaks it
options=('!strip' '!debug')
source=(
    "${url}/archive/refs/tags/v${tag}.tar.gz"
)
sha256sums=(
    'f5d1022eed3763a768cf7b0f0844831f0170a35f54eb8d18223f2e93f503025e'
)

prepare() {
  cd "${srcdir}/hermes-agent-${tag}"
  # Arch Linux currently ships newer setuptools than upstream's build cap.
  # The package builds with the distro setuptools, so relax the upper bound.
  sed -i 's/setuptools>=77.0,<83/setuptools>=77.0/' pyproject.toml
}

package() {
  cd "${srcdir}/hermes-agent-${tag}"
  python -m build --quiet --wheel --no-isolation
  python -m installer --destdir="${pkgdir}" dist/*.whl

  # Pre-build TUI frontend in $srcdir, then place dist/entry.js under hermes_cli/tui_dist/
  cd "${srcdir}/hermes-agent-${tag}/ui-tui"
  npm ci --silent --no-fund --no-audit --progress=false
  npm run build

  _pyver=$(python -c 'import sys; print(f"python{sys.version_info.major}.{sys.version_info.minor}")')
  install -Dm644 dist/entry.js "${pkgdir}/usr/lib/${_pyver}/site-packages/hermes_cli/tui_dist/entry.js"
}
