# Maintainer: nosduco <nosduco at gmail dot com>
pkgname=streamcontroller-git
_pkgname=${pkgname%-git}
_reponame=StreamController
pkgver=r1856.0967bb2a
pkgrel=1
pkgdesc="An elegant Linux app for the Elgato Stream Deck with support for plugins"
arch=('any')
url="https://github.com/StreamController/StreamController"
license=('GPL-3')
depends=('python' 'xdg-desktop-portal' 'xdg-desktop-portal-gtk' 'libportal' 'libportal-gtk4' 'libadwaita' 'gobject-introspection')
makedepends=('git' 'python-pip' 'sed')
provides=('streamcontroller')
conflicts=('streamcontroller')
source=("git+https://github.com/StreamController/StreamController.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_reponame"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  # Create virtualenv with dependencies
  mkdir -p "$pkgdir/usr/local/lib/$_pkgname"
  python -m venv "$pkgdir/usr/local/lib/$_pkgname"
  source "$pkgdir/usr/local/lib/$_pkgname/bin/activate"
  cd "$srcdir/$_reponame"
  pip install -r requirements.txt
  deactivate

  # Ensure correct venv is used after install
  cd "$pkgdir/usr/local/lib/$_pkgname/bin"
  sed -i "s|$pkgdir||g" *
  cd "$srcdir/$_reponame"

  # Install source files
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/lib/$_pkgname"
  install -d "$_reponame" "$pkgdir/usr/lib/$_pkgname/"
  cp -r "$_reponame"/* "$pkgdir/usr/lib/$_pkgname/"

  # Install launch script to /usr/bin
  mkdir -p "$pkgdir/usr/bin"
  echo "#!/bin/bash" > "$pkgdir/usr/bin/$_pkgname"
  echo "cd /usr/lib/$_pkgname" >> "$pkgdir/usr/bin/$_pkgname"
  echo "source /usr/local/lib/$_pkgname/bin/activate" >> "$pkgdir/usr/bin/$_pkgname"
  echo "python main.py \$@" >> "$pkgdir/usr/bin/$_pkgname"
  chmod +x "$pkgdir/usr/bin/$_pkgname"

  # Install application entry (use upstream desktop file with corrected Exec and StartupWMClass)
  sed 's|Exec=.*|Exec=streamcontroller|' "$srcdir/$_reponame/flatpak/launch.desktop" > /tmp/sc.desktop
  echo "StartupWMClass=com.core447.StreamController" >> /tmp/sc.desktop
  install -Dm644 /tmp/sc.desktop "$pkgdir/usr/share/applications/com.core447.StreamController.desktop"

  # Install icon under reverse-domain name matching the app's GApplication ID
  install -Dm644 "$srcdir/$_reponame/flatpak/icon_256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/com.core447.StreamController.png"
}

clean() {
  cd "$srcdir"
  rm -rf "$_reponame"
}
