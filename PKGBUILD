# Maintainer: killown
pkgname=waypanel-git
pkgver=0.9.8.1.165.g31c7f3a
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
  'uv'
)

makedepends=('git')

optdepends=(
  'swaylock: For lock screen integration'
  'pamixer: Volume control'
  'wl-clipboard: Clipboard plugin support'
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

  # Install application files and modules
  install -d "$pkgdir/usr/lib/waypanel"
  cp -r ./* "$pkgdir/usr/lib/waypanel/"
  rm -rf "$pkgdir/usr/lib/waypanel/.git"

  # Install default configuration files
  install -d "$pkgdir/usr/share/waypanel"
  cp -r "config" "$pkgdir/usr/share/waypanel/"

  # Install wrapper script
  install -Dm755 /dev/null "$pkgdir/usr/bin/waypanel"
  {
    echo '#!/bin/sh'
    echo 'python /usr/lib/waypanel/run.py'
  } >"$pkgdir/usr/bin/waypanel"
}
