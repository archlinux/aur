# Maintainer: Javad Rajabzadeh <ja7ad@live.com>

pkgname=hydra-download-manager-bin
_pkgname=hydra
pkgver=0.4.0
pkgrel=1
pkgdesc="Multi-connection download accelerator and manager (GUI, CLI, browser integration) (precompiled binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/ja7ad/hydra"
license=('GPL-3.0-or-later')
depends=(
  'alsa-lib'
  'gcc-libs'
  'glibc'
  'hicolor-icon-theme'
  'libx11'
  'libxrandr'
  'libxcb'
  'libxkbcommon'
)
optdepends=(
  'gnome-shell-extension-appindicator: StatusNotifierItem system tray icon in GNOME Shell'
  'xdg-utils: Open completed files and download directories'
)
provides=('hydra' 'hydra-download-manager')
conflicts=('hydra' 'hydra-download-manager' 'hydra-git')
options=('!strip' '!debug')
source_x86_64=("$url/releases/download/v$pkgver/hydra-$pkgver-linux-amd64.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/hydra-$pkgver-linux-arm64.tar.gz")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
  local _arch
  case "$CARCH" in
    x86_64) _arch="amd64" ;;
    aarch64) _arch="arm64" ;;
  esac
  cd "$srcdir/hydra-$pkgver-linux-$_arch"

  # 1. Executables (CLI, GUI, Host, Updater)
  install -Dm755 hydra "$pkgdir/usr/bin/hydra"
  install -Dm755 hydra-gui "$pkgdir/usr/bin/hydra-gui"
  install -Dm755 hydra-host "$pkgdir/usr/bin/hydra-host"
  if [ -f hydra-updater ]; then
    install -Dm755 hydra-updater "$pkgdir/usr/bin/hydra-updater"
  fi

  # Short second name for the CLI: this package already conflicts with the
  # THC `hydra`, and three letters types better for a command run as often
  # as a download.
  ln -sf hydra "$pkgdir/usr/bin/hya"

  # 2. Desktop Launcher & Autostart
  install -d "$pkgdir/usr/share/applications"
  cat > "$pkgdir/usr/share/applications/hydra.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Hydra Download Manager
GenericName=Download Manager
Comment=Multi-connection download accelerator
Exec=hydra-gui
Icon=hydra
Terminal=false
Categories=Network;FileTransfer;
StartupWMClass=hydra
EOF

  install -d "$pkgdir/etc/xdg/autostart"
  cat > "$pkgdir/etc/xdg/autostart/hydra.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Hydra Download Manager
Comment=Multi-connection download accelerator
Exec=hydra-gui --minimized
Icon=hydra
Terminal=false
Categories=Network;FileTransfer;
X-GNOME-Autostart-enabled=true
EOF

  # 3. Application Icon
  if [ -f logo.png ]; then
    install -Dm644 logo.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/hydra.png"
  fi

  # 4. Native Messaging Host Manifests
  for d in etc/opt/chrome etc/chromium etc/opt/edge; do
    install -d "$pkgdir/$d/native-messaging-hosts"
    cat > "$pkgdir/$d/native-messaging-hosts/com.hydra.host.json" <<'EOF'
{
  "name": "com.hydra.host",
  "description": "Hydra Download Manager native host",
  "path": "/usr/bin/hydra-host",
  "type": "stdio",
  "allowed_origins": ["chrome-extension://jpnonmbbkjdpeebdhkjoliklfhkdcomj/"]
}
EOF
  done

  install -d "$pkgdir/usr/lib/mozilla/native-messaging-hosts"
  cat > "$pkgdir/usr/lib/mozilla/native-messaging-hosts/com.hydra.host.json" <<'EOF'
{
  "name": "com.hydra.host",
  "description": "Hydra Download Manager native host",
  "path": "/usr/bin/hydra-host",
  "type": "stdio",
  "allowed_extensions": ["hydra@ja7ad.github.io"]
}
EOF

  # 5. Shell Completions
  install -d "$pkgdir/usr/share/bash-completion/completions"
  install -d "$pkgdir/usr/share/zsh/site-functions"
  install -d "$pkgdir/usr/share/fish/vendor_completions.d"
  ./hydra completions bash > "$pkgdir/usr/share/bash-completion/completions/hydra"
  ./hydra completions zsh > "$pkgdir/usr/share/zsh/site-functions/_hydra"
  ./hydra completions fish > "$pkgdir/usr/share/fish/vendor_completions.d/hydra.fish"
  # The `hya` alias needs its own scripts: a completion script names the
  # command it completes, so the hydra one never fires for it.
  ./hydra completions bash --bin-name hya > "$pkgdir/usr/share/bash-completion/completions/hya"
  ./hydra completions zsh --bin-name hya > "$pkgdir/usr/share/zsh/site-functions/_hya"
  ./hydra completions fish --bin-name hya > "$pkgdir/usr/share/fish/vendor_completions.d/hya.fish"

  # 6. Man Pages
  if [ -d man ]; then
    for page in man/*.1; do
      install -Dm644 "$page" "$pkgdir/usr/share/man/man1/$(basename "$page")"
    done
  fi
}
