# Maintainer: Youcef <your.email@example.com>
pkgname=hermes-agent-git
pkgver=r0.0.0
pkgrel=1
pkgdesc="Locally-run AI agent with tool use, web browsing, and automation"
arch=('x86_64')
url="https://github.com/NousResearch/hermes-agent"
license=('MIT')
groups=()
depends=('python' 'ripgrep' 'ffmpeg')
makedepends=('git' 'nodejs')
optdepends=(
    'python-telegram-bot: Telegram gateway support'
    'python-discord-py: Discord gateway support'
    'python-croniter: Cron expression parsing'
    'python-modal-client: Modal cloud execution backend'
    'python-elevenlabs: ElevenLabs premium voices'
    'python-pyaudio: CLI microphone input + audio playback'
    'python-honcho: AI-native memory'
    'python-mcp: Model Context Protocol support'
    'python-homeassistant: Home Assistant integration'
    'python-acp: ACP editor integration support'
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
}

package() {
    cd hermes-agent
    
    # Install Python package to /usr
    python -m pip install --root="$pkgdir" --prefix=/usr --no-deps --ignore-installed ".[all]"
    
    # Install optional submodule if present
    if [ -d "tinker-atropos" ]; then
        python -m pip install --root="$pkgdir" --prefix=/usr --no-deps --ignore-installed "./tinker-atropos"
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