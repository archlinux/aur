# Maintainer: Youcef <youcef.nafa@gmail.com>
pkgname=hermes-agent
pkgver=0.8.0
_tagver=2026.4.8
pkgrel=1
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
)
source=("https://github.com/NousResearch/hermes-agent/archive/refs/tags/v${_tagver}.tar.gz")
sha256sums=('4c048cbb451afe6a0e8dbba81863c5cd67cbca354acbed6680ca547338eab558')
validpgpkeys=()

build() {
  cd "${pkgname}-${_tagver}"

  # Install Node.js dependencies
  [ -f "package.json" ] && npm install

  # Build Python wheel
  python -m build --wheel --no-isolation
}

#check() {
#    local pytest_options=(
#        -vv
#    )
#    cd "${pkgname}-${_tagver}"
#    python -m venv --system-site-packages test-env
#    test-env/bin/python -m installer dist/*.whl
#    test-env/bin/python -m pytest "${pytest_options[@]}" tests
#}

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
}
