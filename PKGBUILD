# Maintainer: Youcef <youcef.nafa@gmail.com>
pkgname=hermes-agent
pkgver=0.11.0
_tagver=2026.4.23
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
    'nss'
    'atk'
    'at-spi2-core'
    'cups'
    'libdrm'
    'libxkbcommon'
    'mesa'
    'pango'
    'cairo'
    'alsa-lib'
)
makedepends=('nodejs' 'npm' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-pytest')
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
sha256sums=('1ee1be80a2112b7edc581770cee8858e725ba110cc423979cd7102492504bc6b')
validpgpkeys=()
install=hermes-agent.install

build() {
  cd "${pkgname}-${_tagver}"

  # vite-plugin-tailwindcss uses the ignore package which walks up the tree to read .gitignore files. Unless it finds .git directory, it keeps going up until it finds ArchLinux Package's own .gitignore, Which ignores the whole src directory.This causes the resulting css of the dashboard to be almost empty. Creating an empty .git directory solves the problem.
  [ ! -d .git ] && mkdir .git

  # Install Node.js dependencies
  [ -f "package.json" ] && npm install

  # Build frontend
  [ -d "web" ] && cd web && rm -f package-lock.json && npm install && npm run build && cd ..
  
  # Install whatsapp-bridge dependencies
  if [ -f "scripts/whatsapp-bridge/package.json" ]; then
    (cd scripts/whatsapp-bridge && npm install --legacy-peer-deps --omit=dev) || echo "Warning: whatsapp-bridge npm install failed (optional)"
  fi
  
  # Build Python wheel
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${_tagver}"

  # Install Python package
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Create wrapper script to set NODE_PATH for browser tools
  cp "$pkgdir/usr/bin/hermes" "$pkgdir/usr/bin/hermes-real"
  echo '#!/bin/bash' > "$pkgdir/usr/bin/hermes"
  echo 'export NODE_PATH="/usr/share/hermes-agent/node_modules${NODE_PATH:+:$NODE_PATH}"' >> "$pkgdir/usr/bin/hermes" 
  echo 'export PATH="/usr/share/hermes-agent/node_modules/.bin:$PATH"' >> "$pkgdir/usr/bin/hermes" 
  echo 'exec /usr/bin/hermes-real "$@"' >> "$pkgdir/usr/bin/hermes" 

  chmod 755 "$pkgdir/usr/bin/hermes"
 
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


 # Install whatsapp-bridge
 if [ -d "scripts/whatsapp-bridge" ]; then
 cp -r scripts/whatsapp-bridge "$pkgdir/usr/share/hermes-agent/"
 fi
  # Install skills directory
  if [ -d "skills" ]; then
    cp -r skills "$pkgdir/usr/share/hermes-agent/"
  fi
}
