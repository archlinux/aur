# Maintainer: wyf9661 <wyf9661@hotmail.com>
# Contributor: Nous Research <ops@nousresearch.com>

_pkgname=hermes-agent
pkgname=python-${_pkgname}
tag=2026.6.5
pkgver=0.16.0
pkgrel=1
pkgdesc="The self-improving AI agent — creates skills from experience, improves them during use, and runs anywhere"
arch=('any')
url="https://github.com/NousResearch/${_pkgname}"
license=('MIT')
depends=('python>=3.11' 'python-dotenv' 'python-prompt_toolkit' 'python-openai' 'python-fire'
          'python-ruamel-yaml' 'python-rich' 'python-pyjwt' 'python-tenacity' 'python-yaml'
          'python-httpx' 'python-requests' 'python-jinja' 'python-pydantic' 'python-psutil'
          'python-markdown' 'python-pathspec' 'python-ptyprocess')
optdepends=('python-telegram-bot: Telegram messaging support'
            'python-discord: Discord messaging support'
            'python-aiohttp: Async HTTP for messaging/web, QQ bot & Wechat messaging needs this'
            'python-fastapi: Web API server support'
            'python-mcp: Model Context Protocol support'
            'python-anthropic: Anthropic Claude API support'
            'python-faster-whisper: Local voice transcription'
            'python-sounddevice: Audio I/O for voice'
            'python-numpy: Numerical computing for voice/other'
            'python-simple-term-menu: Interactive CLI menu'
            'python-slack-sdk: Slack integration'
            'python-qrcode: QR code generation for auth'
            'python-croniter: Cron scheduling support')
makedepends=('python-installer' 'python-wheel' 'python-build' 'python-setuptools' 'nodejs' 'npm')
# Binary is a self-contained Bun executable with embedded JS/resources - stripping breaks it
options=('!strip' '!debug')
source=(
    "${url}/archive/refs/tags/v${tag}.tar.gz"
)
sha256sums=(
    '09ae9eef4ea88d3a6689b2071e7c927a4a2ee10e737c0974afd5a19402c090ee'
)

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
