# Maintainer: Youcef <your.email@example.com>
pkgname=hermes-agent-git
pkgver=r2991.344239c2
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
    'python-pyyaml'
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
makedepends=('git' 'nodejs' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-pytest')
optdepends=(
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
    'python-pytest: Test utilities'
)
provides=('hermes-agent')
conflicts=('hermes-agent')
options=('!strip')
install=hermes-agent-git.install
source=("git+https://github.com/NousResearch/hermes-agent.git#branch=main")
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
    cd hermes-agent
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd hermes-agent
    git submodule update --init --recursive
}

build() {
    cd hermes-agent

    # Install Node.js dependencies
    [ -f "package.json" ] && npm install

    # Build Python wheel
    python -m build --wheel --no-isolation
}

#check() {
#    local pytest_options=(
#        -vv
#    )
#    cd hermes-agent
#    python -m venv --system-site-packages test-env
#    test-env/bin/python -m installer dist/*.whl
#    test-env/bin/python -m pytest "${pytest_options[@]}" tests
#}

package() {
    cd hermes-agent

    # Install Python package
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Install optional submodule if present
    if [ -d "tinker-atropos" ]; then
        cd tinker-atropos
        python -m build --wheel --no-isolation
        python -m installer --destdir="$pkgdir" dist/*.whl
        cd ..
        
        # Remove conflicting top-level 'utils' package from tinker-atropos
        # It shadows hermes-agent's utils.py module which contains atomic_json_write
        rm -rf "$pkgdir"/usr/lib/python*/site-packages/utils
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