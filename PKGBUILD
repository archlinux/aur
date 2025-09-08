# Maintainer: killown
pkgname=waypanel-git
pkgver=0.1.0.r0.g0000000
pkgrel=1
pkgdesc="A lightweight, modular status panel for Wayfire written in Python with GTK4"
arch=('any')
url="https://github.com/killown/waypanel"
license=('MIT')

depends=(
  'python'
  'gtk4'
  'libadwaita'
  'playerctl'
  'gobject-introspection'
  'wayland-protocols'
  'gtk4-layer-shell'
  'bluez-tools'
  'wl-clipboard'
)

makedepends=('git')

optdepends=(
  'swaylock: For lock screen integration'
  'pamixer: Volume control'
  'wl-clipboard: Clipboard plugin support'
  'dunst: Notification area support'
)

source=("git+https://github.com/killown/waypanel.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/waypanel"
  # Format: latest tag + commit count + short hash
  git describe --tags --long 2>/dev/null | sed 's/^v//;s/-/./g' ||
    echo "0.1.0.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/waypanel"
}

package() {
  cd "$srcdir/waypanel"

  # Install app files
  install -Dm755 "waypanel/main.py" "$pkgdir/usr/lib/waypanel/main.py"
  cp -r "waypanel/src" "$pkgdir/usr/lib/waypanel/"
  cp -r "waypanel/config" "$pkgdir/usr/lib/waypanel/"

  # Install wrapper script
  install -Dm755 "waypanel.sh" "$pkgdir/usr/bin/waypanel"

  # Install requirements.txt
  install -Dm644 "requirements.txt" "$pkgdir/usr/lib/waypanel/requirements.txt"
}
