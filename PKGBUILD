# Maintainer: Taxin <https://github.com/taxin-404>
pkgname=odysseus-ai
pkgver=0.1.0
pkgrel=2
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
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/taxin-404/odysseus/archive/refs/tags/v$pkgver.tar.gz"
        "odysseus-ai.desktop"
        "odysseus-ai.svg")
sha256sums=('67217c159fc4d30d8e4af94a8ed2201a1774b47a3415277c6721d35e52b4db3c'
            'f21605f96ec6067504d15c788fe009890d07364f14e78da6e071cb8b922e43df'
            '9d909012e4daf1a8bf4bec2bf4912ce546da8ce7828ec2cea6ca55886e94f916')
install="$pkgname.install"

backup=(
    "etc/odysseus-ai/odysseus.env"
)

prepare() {
    cd "$srcdir/odysseus-$pkgver"
    grep -v -E '^(PyMuPDF|pytest|pytest-asyncio|duckduckgo-search)' requirements.txt > requirements.filtered.txt
}

package() {
    cd "$srcdir/odysseus-$pkgver"

    # --- Application files (all dirs needed at runtime) ---
    install -dm755 "$pkgdir/usr/lib/$pkgname"
    cp -r \
        app.py setup.py \
        core routes services src scripts config mcp_servers static \
        requirements.txt requirements.filtered.txt \
        "$pkgdir/usr/lib/$pkgname/"

    # --- Launcher wrapper ---
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/odysseus-ai" <<'EOF'
#!/bin/bash
exec /usr/lib/odysseus-ai/venv/bin/uvicorn app:app \
    --app-dir /usr/lib/odysseus-ai \
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
    install -dm750 "$pkgdir/var/lib/$pkgname"

    # --- Desktop entry ---
    install -Dm644 "$srcdir/odysseus-ai.desktop" \
        "$pkgdir/usr/share/applications/odysseus-ai.desktop"

    # --- Icon ---
    install -Dm644 "$srcdir/odysseus-ai.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/odysseus-ai.svg"

    # --- License ---
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # --- Docs ---
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
