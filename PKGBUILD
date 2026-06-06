# Maintainer: Taxin <https://github.com/taxin-404>
pkgname=odysseus-ai-git
pkgrel=1
pkgver=2026.06.02
pkgdesc="A self-hosted AI workspace with chat, agents, deep research, calendar, notes and more"
arch=('any')
url="https://pewdiepie-archdaemon.github.io/odysseus/"
license=('MIT')
depends=(
    'python>=3.11'
    'tmux'
)
optdepends=(
    'python-pymupdf: PDF form-filling support (AGPL-3.0)'
    'chromadb: local vector memory server'
    'searxng: local web search provider'
)
makedepends=('git')
provides=('odysseus-ai')
conflicts=('odysseus-ai')
source=("$pkgname::git+https://github.com/pewdiepie-archdaemon/odysseus.git")
sha256sums=('SKIP')
install="$pkgname.install"

backup=(
    "etc/odysseus-ai/odysseus.env"
)

pkgver() {
    cd "$srcdir/$pkgname"
    git log -1 --format="%cd" --date=format:"%Y.%m.%d"
}

prepare() {
    cd "$srcdir/$pkgname"
    grep -v -E '^(PyMuPDF|pytest|pytest-asyncio|duckduckgo-search|#|$)' requirements.txt > requirements.filtered.txt
}

package() {
    cd "$srcdir/$pkgname"

    # --- Application files ---
    install -dm755 "$pkgdir/usr/lib/odysseus-ai"
    cp -r \
        app.py setup.py \
        core routes services src scripts config mcp_servers static licenses \
        requirements.txt requirements.filtered.txt \
        "$pkgdir/usr/lib/odysseus-ai/"

    # --- Cache dirs ---
    install -dm755 "$pkgdir/usr/lib/odysseus-ai/services/cache/search"
    install -dm755 "$pkgdir/usr/lib/odysseus-ai/services/cache/content"

    # --- Launcher wrapper ---
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/odysseus-ai" <<'EOF'
#!/bin/bash
APPDIR=/usr/lib/odysseus-ai
exec "$APPDIR/venv/bin/uvicorn" app:app \
    --app-dir "$APPDIR" \
    --host "${ODYSSEUS_HOST:-127.0.0.1}" \
    --port "${ODYSSEUS_PORT:-7000}" \
    "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/odysseus-ai"

    # --- Default env config ---
    install -dm755 "$pkgdir/etc/odysseus-ai"
    install -Dm644 .env.example "$pkgdir/etc/odysseus-ai/odysseus.env"

    # --- Systemd user service ---
    install -dm755 "$pkgdir/usr/lib/systemd/user"
    cat > "$pkgdir/usr/lib/systemd/user/odysseus-ai.service" <<'EOF'
[Unit]
Description=Odysseus AI Workspace
After=network.target

[Service]
Type=simple
WorkingDirectory=/usr/lib/odysseus-ai
ExecStart=/usr/bin/odysseus-ai
Restart=on-failure
RestartSec=3
EnvironmentFile=-%h/.config/odysseus-ai/odysseus.env

[Install]
WantedBy=default.target
EOF

    # --- System service ---
    install -dm755 "$pkgdir/usr/lib/systemd/system"
    cat > "$pkgdir/usr/lib/systemd/system/odysseus-ai.service" <<'EOF'
[Unit]
Description=Odysseus AI Workspace (system)
After=network.target

[Service]
Type=simple
User=odysseus-ai
Group=odysseus-ai
WorkingDirectory=/var/lib/odysseus-ai
ExecStart=/usr/bin/odysseus-ai
Restart=on-failure
RestartSec=3
EnvironmentFile=-/etc/odysseus-ai/odysseus.env

[Install]
WantedBy=multi-user.target
EOF

    # --- Data dirs ---
    install -dm750 "$pkgdir/var/lib/odysseus-ai"

    # --- Desktop entry ---
    install -Dm644 "$srcdir/odysseus-ai-git.desktop" \
        "$pkgdir/usr/share/applications/odysseus-ai.desktop"

    # --- Icon ---
    install -Dm644 "$srcdir/odysseus-ai-git.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/odysseus-ai.svg"

    # --- License ---
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # --- Docs ---
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
