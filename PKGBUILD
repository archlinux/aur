# Maintainer: pakrohk <pakrohk@gmail.com>
pkgname=9router-webui-plasma-git
pkgver=1.0.0
pkgrel=1
pkgdesc="9Router - AI model router with WebUI. Built with Bun, optimized for KDE Plasma desktop (systemd user service)"
arch=('x86_64' 'aarch64')
url="https://github.com/decolua/9router"
license=('MIT')
depends=('bun' 'curl' 'rsync' 'libnotify' 'systemd')
makedepends=('git' 'python' 'make' 'gcc')
source=("$pkgname::git+https://github.com/decolua/9router.git")
sha256sums=('SKIP')
options=('!strip')

# ==================== VERSIONING (AUR STANDARD) ====================
pkgver() {
  cd "$srcdir/$pkgname"
  # Generate version from git tags: v0.1.0 -> 0.1.0.r12.g78a26cc
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
# ==================================================================

build() {
  cd "$srcdir/$pkgname"
  bun install
  bun run build
}

package() {
  cd "$srcdir/$pkgname"

  # 1. Install built files to /usr/lib/9router
  install -dm755 "$pkgdir/usr/lib/9router"
  cp -r . "$pkgdir/usr/lib/9router/"

  # 2. Remove unnecessary files
  rm -rf "$pkgdir/usr/lib/9router/"{.git,.env.example,*.log}

  # 3. Install production dependencies with Bun
  cd "$pkgdir/usr/lib/9router"
  bun install --production

  # 4. Main launcher script (systemd user service + Plasma integration)
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/9router" <<'EOF'
#!/bin/bash
# 9Router Launcher - Built with Bun, Optimized for Plasma Desktop

PORT=${PORT:-20128}
APP_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/9router-app"
CONFIG_FILE="$APP_DIR/.env"
SERVICE_NAME="9router.service"
USER_SERVICE_DIR="$HOME/.config/systemd/user"

# Ensure app directory exists
if [ ! -d "$APP_DIR" ]; then
  echo "📦 First run: Setting up 9Router in $APP_DIR ..."
  mkdir -p "$APP_DIR"
  rsync -a --exclude='node_modules' --exclude='.next' /usr/lib/9router/ "$APP_DIR/"
  cd "$APP_DIR"
  bun install --production
  cat > "$APP_DIR/.env" <<EOL
PORT=$PORT
NODE_ENV=production
DATA_DIR=$APP_DIR/data
NEXT_PUBLIC_BASE_URL=http://localhost:$PORT
EOL
fi

mkdir -p "$APP_DIR/data"

if [ -f "$CONFIG_FILE" ]; then
  set -a
  source "$CONFIG_FILE"
  set +a
fi

install_service() {
  mkdir -p "$USER_SERVICE_DIR"
  cat > "$USER_SERVICE_DIR/$SERVICE_NAME" <<EOL
[Unit]
Description=9Router - AI Model Router (WebUI)
After=network.target

[Service]
Type=simple
WorkingDirectory=$APP_DIR
Environment="NODE_ENV=production"
Environment="PORT=$PORT"
Environment="DATA_DIR=$APP_DIR/data"
Environment="NEXT_PUBLIC_BASE_URL=http://localhost:$PORT"
ExecStart=/usr/bin/bun run start
ExecStop=/usr/bin/pkill -f "bun.*$APP_DIR"
Restart=on-failure
RestartSec=10

[Install]
WantedBy=default.target
EOL
  systemctl --user daemon-reload
  echo "✅ Systemd user service installed: $SERVICE_NAME"
}

case "$1" in
  start)
    systemctl --user start "$SERVICE_NAME"
    notify-send -i network-server "9Router" "Server started on port $PORT"
    sleep 2
    xdg-open "http://localhost:$PORT/dashboard"
    ;;
  stop)
    systemctl --user stop "$SERVICE_NAME"
    notify-send -i network-server "9Router" "Server stopped"
    ;;
  restart)
    systemctl --user restart "$SERVICE_NAME"
    notify-send -i network-server "9Router" "Server restarted"
    ;;
  status)
    systemctl --user status "$SERVICE_NAME"
    ;;
  logs)
    journalctl --user -u "$SERVICE_NAME" -f
    ;;
  install)
    install_service
    systemctl --user enable "$SERVICE_NAME"
    echo "🔧 Service enabled to start at login"
    ;;
  *)
    if ! systemctl --user is-active --quiet "$SERVICE_NAME"; then
      echo "🚀 Starting 9Router service..."
      install_service
      systemctl --user start "$SERVICE_NAME"
      sleep 2
      notify-send -i network-server "9Router" "Server is now running on port $PORT"
    fi
    xdg-open "http://localhost:$PORT/dashboard"
    ;;
esac
EOF

  # 5. Plasma desktop entry
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/9router.desktop" <<EOF
[Desktop Entry]
Name=9Router
Comment=AI Model Router & Token Saver (Built with Bun)
Exec=/usr/bin/9router start
Icon=network-server
Terminal=false
Type=Application
Categories=Development;Network;
StartupNotify=true
StartupWMClass=9router
Actions=OpenDashboard;StopServer;ViewLogs

[Desktop Action OpenDashboard]
Name=Open Dashboard
Exec=/usr/bin/9router start
Icon=network-server

[Desktop Action StopServer]
Name=Stop Server
Exec=/usr/bin/9router stop
Icon=process-stop

[Desktop Action ViewLogs]
Name=View Logs
Exec=konsole -e /usr/bin/9router logs
Icon=utilities-log
EOF

  # 6. KRunner shortcut
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/9router-krunner.desktop" <<EOF
[Desktop Entry]
Name=9Router Dashboard
Comment=Open 9Router WebUI directly
Exec=xdg-open http://localhost:20128/dashboard
Icon=network-server
Terminal=false
Type=Application
Categories=Development;
OnlyShowIn=KDE;
EOF

  # 7. Bash completion
  install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/9router" <<'EOF'
_9router() {
  local cmds="start stop restart status logs install"
  COMPREPLY=($(compgen -W "$cmds" -- "${COMP_WORDS[1]}"))
}
complete -F _9router 9router
EOF
}
