pkgname=lumina
pkgver=0.1.2
pkgrel=1
pkgdesc="Lumina — select a screen region and ask AI (OpenAI, Gemini, DeepSeek, Ollama)"
arch=('x86_64')
url="https://github.com/razenfh/lumina"
license=('MIT')

depends=(
  'gtk3'
  'webkit2gtk-4.1'
  'libsoup3'
)

makedepends=(
  'git'
  'rust'
  'cargo'
  'cargo-tauri'
  'nodejs'
  'npm'
)

optdepends=(
  'spectacle: region capture on KDE (Linux)'
  'ollama: local models provider'
)

source=("git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$srcdir/lumina"

  npm ci
  npm run build

  # CRITICAL: force release mode
  TAURI_DEV=0 cargo-tauri build --no-bundle
}

package() {
  cd "$srcdir/lumina"

  install -Dm755 \
    "src-tauri/target/release/lumina" \
    "$pkgdir/usr/bin/lumina"

  install -Dm644 /dev/stdin \
    "$pkgdir/usr/share/applications/lumina.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Lumina
Exec=lumina
Icon=lumina
Categories=Utility;
Terminal=false
EOF

  if [[ -f "src-tauri/icons/128x128.png" ]]; then
    install -Dm644 \
      "src-tauri/icons/128x128.png" \
      "$pkgdir/usr/share/icons/hicolor/128x128/apps/lumina.png"
  fi
}

