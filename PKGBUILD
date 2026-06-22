# Maintainer: pakrohk <pakrohk@gmail.com>
pkgname=freellmapi-desktop-git
pkgver=0.4.1.r9.g4ab1300
pkgrel=3
pkgdesc="FreeLLMAPI local server with Electron viewer (runs in user directory)"
arch=('x86_64' 'aarch64')
url="https://github.com/tashfeenahmed/freellmapi"
license=('MIT')
depends=('electron' 'nodejs' 'npm' 'curl' 'rsync')
makedepends=('git' 'python' 'make' 'gcc')
source=("$pkgname::git+https://github.com/tashfeenahmed/freellmapi.git")
sha256sums=('SKIP')
options=('!strip')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"

  # Build the full project (server + client)
  npm install
  npm run build
}

package() {
  cd "$srcdir/$pkgname"

  # 1. Install built files to /usr/lib/freellmapi (as a template)
  install -dm755 "$pkgdir/usr/lib/freellmapi"
  cp -r . "$pkgdir/usr/lib/freellmapi/"

  # 2. Remove unnecessary files to reduce size
  rm -rf "$pkgdir/usr/lib/freellmapi/"{.git,node_modules,.env.example,*.log}

  # 3. Install production dependencies inside the template
  cd "$pkgdir/usr/lib/freellmapi"
  npm install --production

  # 4. Create the main launcher script (copies app to user dir on first run)
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/freellmapi" <<'EOF'
#!/bin/bash

# Configuration
PORT=${PORT:-3001}
APP_SOURCE="/usr/lib/freellmapi"
APP_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/freellmapi-app"
ENV_FILE="$APP_DIR/.env"
DATA_DIR="$APP_DIR/server/data"

# If app doesn't exist in user dir, copy it
if [ ! -d "$APP_DIR" ]; then
  echo "📦 First run: Copying FreeLLMAPI to $APP_DIR ..."
  mkdir -p "$APP_DIR"
  rsync -a --exclude='node_modules' "$APP_SOURCE/" "$APP_DIR/"
  cd "$APP_DIR"
  npm install --production
else
  cd "$APP_DIR"
fi

# Create data directory if it doesn't exist
mkdir -p "$DATA_DIR"

# Generate encryption key if not set
if [ -z "$ENCRYPTION_KEY" ]; then
  ENCRYPTION_KEY="$(node -e 'console.log(require("crypto").randomBytes(32).toString("hex"))')"
fi

# Kill any existing server instances
pkill -f "node.*$APP_DIR/server/dist/index.js" 2>/dev/null || true

# Ensure .env exists with required variables
if [ ! -f "$ENV_FILE" ]; then
  echo "ENCRYPTION_KEY=$ENCRYPTION_KEY" > "$ENV_FILE"
  echo "PORT=$PORT" >> "$ENV_FILE"
  echo "NODE_ENV=production" >> "$ENV_FILE"
fi

# Start the server in background
export NODE_ENV=production
export PORT="$PORT"
export ENCRYPTION_KEY="$ENCRYPTION_KEY"

nohup node server/dist/index.js > /tmp/freellmapi-server.log 2>&1 &
SERVER_PID=$!

# Wait for server to be ready
echo "⏳ Starting FreeLLMAPI server on port $PORT..."
timeout=30
while ! curl -s "http://localhost:$PORT" > /dev/null 2>&1; do
  sleep 0.5
  timeout=$((timeout - 1))
  if [ $timeout -le 0 ]; then
    echo "❌ Server failed to start. Check /tmp/freellmapi-server.log"
    kill $SERVER_PID 2>/dev/null
    exit 1
  fi
done

echo "✅ Server ready! Opening Electron viewer..."
echo "📡 Server URL: http://localhost:$PORT"
echo "📄 Logs: /tmp/freellmapi-server.log"
echo "📁 App directory: $APP_DIR"
echo "📁 Data directory: $DATA_DIR"

# Launch Electron viewer from the user's copy
/usr/bin/electron "$APP_DIR/viewer.js" "$PORT"

# Cleanup after Electron closes
kill $SERVER_PID 2>/dev/null
EOF

  # 5. Create the Electron viewer script (stored in template)
  install -Dm644 /dev/stdin "$pkgdir/usr/lib/freellmapi/viewer.js" <<'EOF'
const { app, BrowserWindow, shell } = require('electron');
const path = require('path');

let mainWindow = null;
const port = process.argv[2] || 3001;

function createWindow() {
  mainWindow = new BrowserWindow({
    width: 1200,
    height: 800,
    show: false,
    webPreferences: {
      nodeIntegration: false,
      contextIsolation: true,
    },
    icon: path.join(__dirname, 'assets', 'appicon_1024.png'),
    backgroundColor: '#1e1e2e',
  });

  mainWindow.loadURL(`http://localhost:${port}`);

  mainWindow.once('ready-to-show', () => {
    mainWindow.show();
  });

  mainWindow.webContents.setWindowOpenHandler(({ url }) => {
    shell.openExternal(url);
    return { action: 'deny' };
  });

  mainWindow.on('closed', () => {
    mainWindow = null;
  });
}

app.whenReady().then(createWindow);

app.on('window-all-closed', () => {
  app.quit();
});

app.on('activate', () => {
  if (mainWindow === null) {
    createWindow();
  }
});
EOF

  # 6. Find and install icon
  icon_file=$(find "$srcdir/$pkgname" -type f -name "*.png" -o -name "*.svg" | grep -i -E "icon|logo|appicon" | head -n1)
  if [[ -n "$icon_file" ]]; then
    install -Dm644 "$icon_file" "$pkgdir/usr/share/icons/hicolor/512x512/apps/freellmapi.png"
    icon_path="/usr/share/icons/hicolor/512x512/apps/freellmapi.png"
  else
    icon_path="freellmapi"
  fi

  # 7. Create .desktop file
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/freellmapi.desktop" <<EOF
[Desktop Entry]
Name=FreeLLMAPI
Comment=Local OpenAI-compatible LLM router
Exec=env XDG_CURRENT_DESKTOP=Unity /usr/bin/freellmapi
Icon=${icon_path}
Terminal=false
Type=Application
Categories=Development;Utility;
StartupWMClass=freellmapi
EOF
}
