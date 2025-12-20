pkgname=chatgtk_client-git
pkgver=0.2.163.ge6ed7b5
pkgrel=1
pkgdesc="GTK3 client for OpenAI, Gemini, Grok and Claude APIs with voice and tools"
arch=('any')
url="https://github.com/rabfulton/ChatGTK"
license=('MIT')
depends=(
  'python'
  'python-openai'
  'python-gobject'
  'python-sounddevice'
  'python-soundfile'
  'python-numpy'
  'python-websockets'
  'python-requests'
  'gtk3'
  'gtksourceview4'
)
makedepends=('git')
optdepends=(
  'texlive-latexrecommended: LaTeX support for math rendering'
  'beets: Music library management for the music control tool'
  'playerctl: MPRIS control for music playback'
)
provides=('chatgtk_client')
conflicts=('chatgtk_client')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/ChatGTK"
  # Use descriptive version based on git history; fall back to short commit hash
  if git describe --tags --long >/dev/null 2>&1; then
    git describe --tags --long | sed 's/^v//' | tr '-' '.'
  else
    printf '0.0.0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

build() {
  cd "$srcdir/ChatGTK"
  # No build step required; pure Python/GTK application.
  :
}

package() {
  cd "$srcdir/ChatGTK"

  # Install Python sources and assets into /usr/lib/${pkgname%-git}
  local appname=${pkgname%-git}
  local appdir="$pkgdir/usr/lib/$appname"

  install -d "$appdir"
  install -m644 src/"ChatGTK.py" "$appdir/ChatGTK.py"
  install -m644 src/"config.py" "$appdir/config.py"
  install -m644 src/"ai_providers.py" "$appdir/ai_providers.py"
  install -m644 src/"controller.py" "$appdir/controller.py"
  install -m644 src/"conversation.py" "$appdir/conversation.py"
  install -m644 src/"dialogs.py" "$appdir/dialogs.py"
  install -m644 src/"gtk_utils.py" "$appdir/gtk_utils.py"
  install -m644 src/"latex_utils.py" "$appdir/latex_utils.py"
  install -m644 src/"markup_utils.py" "$appdir/markup_utils.py"
  install -m644 src/"message_renderer.py" "$appdir/message_renderer.py"
  install -m644 src/"tools.py" "$appdir/tools.py"
  install -m644 src/"utils.py" "$appdir/utils.py"
  install -m644 src/"__init__.py" "$appdir/__init__.py"

  # model_cards package
  install -d "$appdir/model_cards"
  install -m644 src/model_cards/"__init__.py" "$appdir/model_cards/__init__.py"
  install -m644 src/model_cards/"schema.py" "$appdir/model_cards/schema.py"
  install -m644 src/model_cards/"catalog.py" "$appdir/model_cards/catalog.py"
  install -m644 src/model_cards/"loader.py" "$appdir/model_cards/loader.py"
  install -m644 src/model_cards/"overrides.py" "$appdir/model_cards/overrides.py"

  # repositories package
  install -d "$appdir/repositories"
  install -m644 src/repositories/*.py "$appdir/repositories/"

  # services package
  install -d "$appdir/services"
  install -m644 src/services/*.py "$appdir/services/"

  # events package
  install -d "$appdir/events"
  install -m644 src/events/*.py "$appdir/events/"

  # settings package
  install -d "$appdir/settings"
  install -m644 src/settings/*.py "$appdir/settings/"

  # ui package
  install -d "$appdir/ui"
  install -m644 src/ui/*.py "$appdir/ui/"

  # Icons and audio preview assets
  install -m644 src/"icon.png" "$appdir/icon.png"
  install -d "$appdir/preview"
  install -m644 src/preview/*.wav "$appdir/preview/"

  # Launcher script in /usr/bin
  install -d "$pkgdir/usr/bin"
  cat >"$pkgdir/usr/bin/$appname" <<EOF
#!/usr/bin/env bash
exec python -u /usr/lib/$appname/ChatGTK.py "\$@"
EOF
  chmod 755 "$pkgdir/usr/bin/$appname"

  # Desktop entry for menus
  install -d "$pkgdir/usr/share/applications"
  cat >"$pkgdir/usr/share/applications/chatgtk.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=ChatGTK
Comment=GTK client for OpenAI, Gemini, Grok and Claude APIs
Exec=chatgtk_client
Icon=chatgtk
Categories=Network;Chat;Utility;
Terminal=false
StartupNotify=true
Keywords=chat;ai;gpt;openai;gemini;grok;claude;
EOF

  # Icon in hicolor theme
  install -d "$pkgdir/usr/share/icons/hicolor/64x64/apps"
  install -m644 src/"icon.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/chatgtk.png"

  # Install license file for MIT license compliance
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


