# Maintainer: liixini <https://github.com/liixini>
pkgname=skwd-git
pkgver=r23.e485c2e
pkgrel=1
pkgdesc="A skewed take on desktop shells - Quickshell/QML desktop environment"
arch=('any')
url="https://github.com/liixini/skwd"
license=('MIT')
depends=(
  'quickshell-git'
  'qt6-multimedia'
  'qt6-connectivity'
  'python'
  'python-requests'
  'python-pillow'
  'jq'
  'ffmpeg'
  'parallel'
  'ttf-roboto'
  'ttf-roboto-mono'
  'ttf-nerd-fonts-symbols'
  'ttf-material-design-icons-desktop-git'
  'matugen'
  'playerctl'
  'cava'
  'libnotify'
  'awww'
  'mpvpaper'
)
makedepends=('git')
optdepends=(
  'linux-wallpaperengine: Steam Wallpaper Engine support'
  'ollama: local LLM for wallpaper analysis and tagging'
  'grim: screenshot capture for window switcher'
  'niri: recommended Wayland compositor'
)
install=skwd-git.install
provides=('skwd')
conflicts=('skwd')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"

  local _instdir="$pkgdir/usr/share/skwd"
  install -dm755 "$_instdir"

  install -Dm644 shell.qml "$_instdir/shell.qml"
  cp -r qml "$_instdir/qml"

  cp -r ext "$_instdir/ext"

  cp -r images "$_instdir/images"

  cp -r scripts "$_instdir/scripts"
  chmod +x "$_instdir"/scripts/bash/*
  chmod +x "$_instdir"/scripts/python/*

  rm -rf "$_instdir"/scripts/.venv "$_instdir"/scripts/python/__pycache__

  install -dm755 "$_instdir/data"
  install -Dm644 data/config.json.example "$_instdir/data/config.json.example"
  install -Dm644 data/secrets.json.example "$_instdir/data/secrets.json.example"
  install -Dm644 data/apps.json.example "$_instdir/data/apps.json.example"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -dm755 "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/skwd" << 'EOF'
#!/bin/sh
export SKWD_INSTALL=/usr/share/skwd
exec quickshell -p /usr/share/skwd "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/skwd"

  install -dm755 "$pkgdir/etc/profile.d"
  cat > "$pkgdir/etc/profile.d/skwd.sh" << 'EOF'
# SKWD install directory for AUR package
export SKWD_INSTALL=/usr/share/skwd
EOF
  chmod 644 "$pkgdir/etc/profile.d/skwd.sh"
}
