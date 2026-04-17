# Maintainer: Youcef <youcef.nafa@gmail.com>
pkgname=hermes-agent
pkgver=0.10.0
_tagver=2026.4.16
pkgrel=2
pkgdesc="Locally-run AI agent with tool use, web browsing, and automation"
arch=('x86_64')
url="https://github.com/NousResearch/hermes-agent"
license=('MIT')
groups=()
depends=(
    'python'
    'python-openai'
    'python-dotenv'
    'python-fire'
    'python-httpx'
    'python-rich'
    'python-tenacity'
    'python-yaml'
    'python-requests'
    'python-jinja'
    'python-pydantic'
    'python-prompt_toolkit'
    'python-pyjwt'
    'python-anthropic'
    'python-exa-py'
    'python-firecrawl-py'
    'python-fal-client'
    'python-edge-tts'
    'ripgrep'
    'ffmpeg'
)
makedepends=('nodejs' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-pytest')
optdepends=(
  'python-litellm: multi-provider LLM support'
  'python-telegram-bot: Telegram gateway support'
  #'python-discord-py: Discord gateway support' python-discord-git?
  'python-croniter: Cron expression parsing'
  #'python-modal-client: Modal cloud execution backend'
  'python-elevenlabs: ElevenLabs premium voices'
  'python-pyaudio: CLI microphone input + audio playback'
  #'python-honcho: AI-native memory'
  'python-mcp: Model Context Protocol support'
  #'python-homeassistant: Home Assistant integration' -cli?
  #'python-acp: ACP editor integration support'
  'python-slack-sdk: Slack messaging'
  'python-faster-whisper'
  'python-sounddevice'
)
source=("https://github.com/NousResearch/hermes-agent/archive/refs/tags/v${_tagver}.tar.gz")
sha256sums=('ef999b93b487532c50f8ed42c3ac0141a52d128052ba0a0d0e90c6edc02e97fe')
validpgpkeys=()
install=hermes-agent.install

build() {
  cd "${pkgname}-${_tagver}"

  # Install Node.js dependencies
  [ -f "package.json" ] && npm install
  # Build frontend
  [ -d "web" ] && cd web && npm install && npm run build && cd ..
  # Install whatsapp-bridge dependencies
  [ -f "scripts/whatsapp-bridge/package.json" ] && cd scripts/whatsapp-bridge && npm install --silent 2>/dev/null && cd ../..
  # Build Python wheel
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${_tagver}"

  # Install Python package
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install optional submodule if present
  if [ -f "tinker-atropos/pyproject.toml" ]; then
      cd tinker-atropos
      python -m build --wheel --no-isolation
      python -m installer --destdir="$pkgdir" dist/*.whl
      cd ..
  fi

  # Install Node.js dependencies
  if [ -d "node_modules" ]; then
      install -d "$pkgdir/usr/share/hermes-agent"
      cp -r node_modules "$pkgdir/usr/share/hermes-agent/"
  fi

  # Install configuration examples
  install -d "$pkgdir/usr/share/hermes-agent"
  [ -f "cli-config.yaml.example" ] && install -Dm644 cli-config.yaml.example "$pkgdir/usr/share/hermes-agent/cli-config.yaml.example"
  [ -f ".env.example" ] && install -Dm644 .env.example "$pkgdir/usr/share/hermes-agent/.env.example"

  # Install skills directory
  if [ -d "skills" ]; then
    cp -r skills "$pkgdir/usr/share/hermes-agent/"
  fi
}
