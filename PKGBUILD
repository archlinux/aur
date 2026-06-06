# Maintainer: Your Name <you@example.com>
pkgname=odysseus-ai-git
pkgver=r915.dev
pkgrel=1
pkgdesc="Self-hosted AI workspace with chat, agents, deep research, calendar, email, and more"
arch=('any')
url="https://github.com/pewdiepie-archdaemon/odysseus"
license=('MIT')
depends=(
    'python>=3.11'
    'python-fastapi'
    'uvicorn'
    'python-multipart'
    'python-dotenv'
    'python-httpx'
    'python-pydantic>=2.0'
    'python-pydantic-settings>=2.0'
    'python-sqlalchemy'
    'python-pypdf'
    'python-beautifulsoup4'
    'python-charset-normalizer'
    'python-numpy'
    'python-chromadb'
    'python-fastembed'
    'python-youtube-transcript-api'
    'python-markdown'
    'python-nh3'
    'python-icalendar'
    'python-dateutil'
    'python-caldav'
    'python-cryptography'
    'python-bcrypt'
    'python-mcp'
    'python-pyotp'
    'python-qrcode'
    'python-croniter'
    'nodejs'
    'npm'
)
optdepends=(
    'tmux: required for Cookbook background model downloads'
    'python-faster-whisper: local speech-to-text support'
    'python-duckduckgo-search: DuckDuckGo search provider'
    'python-pymupdf: PDF page rendering and form filling (AGPL-3.0)'
    'python-markitdown: Office/EPUB document text extraction'
    'chromadb: embedded ChromaDB vector store (alternative to chromadb-client)'
    'ollama: local model serving via Ollama'
)
makedepends=('git')
provides=('odysseus-ai')
conflicts=('odysseus-ai')
backup=('etc/odysseus/odysseus.env')
install=odysseus.install
source=(
    "$pkgname::git+https://github.com/pewdiepie-archdaemon/odysseus.git#branch=dev"
    'odysseus.service'
    'odysseus.env'
    'odysseus.install'
    'odysseus.desktop'
    'odysseus.svg'
)
sha256sums=(
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
)

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --abbrev-ref HEAD)"
}

prepare() {
    cd "$pkgname"
    :
}

build() {
    :
}

package() {
    cd "$pkgname"

    # Install app files
    install -dm755 "$pkgdir/opt/$pkgname"
    cp -r . "$pkgdir/opt/$pkgname/"

    # Remove dev/build artifacts
    rm -rf "$pkgdir/opt/$pkgname/.git"
    rm -rf "$pkgdir/opt/$pkgname/tests"
    rm -rf "$pkgdir/opt/$pkgname/.github"

    # Systemd service
    install -Dm644 "$srcdir/odysseus.service" \
        "$pkgdir/usr/lib/systemd/system/odysseus.service"

    # Default env config
    install -Dm640 "$srcdir/odysseus.env" \
        "$pkgdir/etc/odysseus/odysseus.env"

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Docs
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    # Desktop entry
    install -Dm644 "$srcdir/odysseus.desktop" \
        "$pkgdir/usr/share/applications/odysseus.desktop"

    # Icon (scalable SVG — your own file in the AUR repo)
    install -Dm644 "$srcdir/odysseus.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/odysseus.svg"

    # Wrapper launcher script
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/odysseus" << 'EOF'
#!/bin/bash
cd /opt/odysseus
exec python -m uvicorn app:app \
    --host "${APP_BIND:-127.0.0.1}" \
    --port "${APP_PORT:-7000}" \
    "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/odysseus"

    # Data and log dirs
    install -dm750 "$pkgdir/var/lib/odysseus"
    install -dm750 "$pkgdir/var/log/odysseus"
}
