# Maintainer: berkkucukk <berkkucukk@proton.me>
pkgname=sentinai
pkgver=1.0.0
pkgrel=2
pkgdesc="AI-powered cybersecurity assistant with OSINT and password wordlist generation"
arch=('any')
url="https://github.com/berk-kucuk/SentinAI"
license=('MIT')
depends=(
    'python'
    'python-pyqt6'
    'geckodriver'
)
makedepends=(
    'python-virtualenv'
)
optdepends=(
    'firefox: web automation for OSINT profile verification'
)
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/berk-kucuk/SentinAI/archive/refs/tags/v$pkgver.tar.gz"
    "sentinai.sh"
    "sentinai.desktop"
)
sha256sums=(
    '2ca7f45d14544efa494ad59bfd5b4f94481bd44f3e50cfe8652a667dc2a26b7f'
    '5db12655597c6b6530387948447ef5eae1fe43fece1e36219b97d7b8a25aeaeb'
    'baf22b376e106d3ed9ec5ef50d9515ffa1d32caf8088b0e8b97ec5cb95ded4ef'
)

build() {
    # Isolated venv — system-site-packages only for PyQt6
    python -m venv --system-site-packages "$srcdir/venv"
    "$srcdir/venv/bin/pip" install \
        --quiet \
        --no-warn-conflicts \
        google-genai \
        python-dotenv \
        beautifulsoup4 \
        googlesearch-python \
        selenium \
        social-analyzer
}

package() {
    cd "$srcdir/SentinAI-$pkgver"

    # Application directories
    install -dm755  "$pkgdir/opt/sentinai"
    install -dm755  "$pkgdir/opt/sentinai/icons"
    install -dm1777 "$pkgdir/opt/sentinai/osints"
    install -dm1777 "$pkgdir/opt/sentinai/wordlists"

    # Venv — fix hardcoded build paths in scripts
    cp -r "$srcdir/venv" "$pkgdir/opt/sentinai/.venv"
    find "$pkgdir/opt/sentinai/.venv/bin" -maxdepth 1 -type f | while IFS= read -r f; do
        head -c2 "$f" | grep -q '#!' && \
            sed -i "1s|$srcdir/venv|/opt/sentinai/.venv|" "$f"
    done

    # Python source files
    local _pyfiles=(app.py chatbot.py custom_widgets.py osintai.py passgenai.py utils.py)
    for f in "${_pyfiles[@]}"; do
        install -Dm644 "$f" "$pkgdir/opt/sentinai/$f"
    done

    # Resources
    install -Dm644 icons/icon.png  "$pkgdir/opt/sentinai/icons/icon.png"
    install -Dm644 LICENSE         "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Generate .env.example (not tracked in git)
    cat > "$pkgdir/opt/sentinai/.env.example" << 'EOF'
# SentinAI — Environment Configuration
# Required: Gemini API key from https://aistudio.google.com/apikey
GOOGLE_API_KEY=your_gemini_api_key_here

# Optional: AI model selection (default: gemini-2.0-flash)
# Options: gemini-2.0-flash | gemini-2.0-flash-exp | gemini-1.5-pro | gemini-1.5-flash
GEMINI_MODEL=gemini-2.0-flash
EOF

    # System icon
    install -Dm644 icons/icon.png  "$pkgdir/usr/share/pixmaps/sentinai.png"

    # Desktop entry
    install -Dm644 "$srcdir/sentinai.desktop" \
        "$pkgdir/usr/share/applications/sentinai.desktop"

    # Launcher
    install -Dm755 "$srcdir/sentinai.sh" "$pkgdir/usr/bin/sentinai"
}
