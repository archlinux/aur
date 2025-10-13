# Maintainer: nosduco <nosduco at gmail dot com>
pkgname=streamcontroller
pkgver=1.5.0beta12
pkgrel=1
_pkgver=1.5.0-beta.12
_reponame=StreamController-$_pkgver
_pkgname=${pkgname}
pkgdesc="An elegant Linux app for the Elgato Stream Deck with support for plugins"
arch=('any')
url="https://github.com/StreamController/StreamController"
license=('GPL-3')
depends=('python' 'xdg-desktop-portal' 'xdg-desktop-portal-gtk' 'libportal' 'libportal-gtk4' 'libadwaita' 'gobject-introspection')
makedepends=('python-pip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/StreamController/StreamController/archive/refs/tags/$_pkgver.tar.gz" "streamcontroller.desktop")
sha256sums=('e34d263aa3157c514bc811cdcf17121350f08185e1cde8dded328f8d3f49c3be'
            'b671ce8638922fca5ea05bf12852886d983b9cae33aaf226a57c8bcc51a39760')
provides=('streamcontroller')
conflicts=('streamcontroller-git')

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
  mkdir -p "$pkgdir/usr/lib/$_pkgname"
  cp -r "$srcdir/$_reponame"/* "$pkgdir/usr/lib/$_pkgname/"

  # Install launch script to /usr/bin
  mkdir -p "$pkgdir/usr/bin"
  cat <<EOF > "$pkgdir/usr/bin/$_pkgname"
#!/bin/bash
cd /usr/lib/$_pkgname
source /usr/local/lib/$_pkgname/bin/activate
exec python main.py "\$@"
EOF
  chmod +x "$pkgdir/usr/bin/$_pkgname"

  # Install application entry
  install -Dm644 "$startdir/streamcontroller.desktop" "$pkgdir/usr/share/applications/streamcontroller.desktop"

  # Install icon
  install -Dm644 "$srcdir/$_reponame/flatpak/icon_256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/streamcontroller.png"
}
