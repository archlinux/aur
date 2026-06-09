# Maintainer: Taxin <https://github.com/taxin-404>
pkgname=odysseus-ai
pkgver=2026.06.09.7690860
pkgrel=1
pkgdesc="A self-hosted AI workspace with chat, agents, deep research, calendar, notes and more"
arch=('any')
url="https://github.com/pewdiepie-archdaemon/odysseus"
license=('MIT')
depends=(
    'python>=3.11'
    'tmux'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/pewdiepie-archdaemon/odysseus/archive/refs/heads/main.tar.gz"
        "odysseus-ai.desktop"
        "odysseus-ai.svg")
sha256sums=('a0a1a3fcc644cb3a5fbf9184e98d2f24001d6ccfcccef7951d671abf08ec0c2e'
            'f21605f96ec6067504d15c788fe009890d07364f14e78da6e071cb8b922e43df'
            '9d909012e4daf1a8bf4bec2bf4912ce546da8ce7828ec2cea6ca55886e94f916')
install="$pkgname.install"

backup=(
    "etc/odysseus-ai/odysseus.env"
)

prepare() {
    cd "$srcdir/odysseus-main"
    grep -v -E '^(pytest|pytest-asyncio)' requirements.txt > requirements.filtered.txt
}

package() {
    cd "$srcdir/odysseus-main"

    install -dm755 "$pkgdir/usr/lib/$pkgname"
    cp -r \
        app.py setup.py \
        companion core routes services src scripts config mcp_servers static licenses \
        requirements.txt requirements.filtered.txt \
        "$pkgdir/usr/lib/$pkgname/"

    install -dm777 "$pkgdir/usr/lib/$pkgname/services/cache/search"
    install -dm777 "$pkgdir/usr/lib/$pkgname/services/cache/content"

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
