# Maintainer: nosduco <nosduco at gmail dot com>
pkgname=streamcontroller
pkgver=1.5.0beta15
pkgrel=1
_pkgver=1.5.0-beta.15
_reponame=StreamController-$_pkgver
_pkgname=${pkgname}
pkgdesc="An elegant Linux app for the Elgato Stream Deck with support for plugins"
arch=('any')
url="https://github.com/StreamController/StreamController"
license=('GPL-3')
depends=('python' 'xdg-desktop-portal' 'xdg-desktop-portal-gtk' 'libportal' 'libportal-gtk4' 'libadwaita' 'gobject-introspection')
makedepends=('python-pip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/StreamController/StreamController/archive/refs/tags/$_pkgver.tar.gz")
sha256sums=('a32c4bb58468ffff48f217f0e3fa82b27871c8d2e758f1139e8b7856293f7e74')
provides=('streamcontroller')
conflicts=('streamcontroller-git')

prepare() {
  sed s'|==|>=|g' -i ${_reponame}/requirements.txt
}

package() {
  # Create virtualenv with dependencies
  mkdir -p "$pkgdir/usr/lib/$_pkgname/venv"
  python -m venv "$pkgdir/usr/lib/$_pkgname/venv"
  source "$pkgdir/usr/lib/$_pkgname/venv/bin/activate"
  cd "$srcdir/$_reponame"
  pip install -r requirements.txt
  deactivate

  # Ensure correct venv is used after install
  cd "$pkgdir/usr/lib/$_pkgname/venv/bin"
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
source /usr/lib/$_pkgname/venv/bin/activate
exec python main.py "\$@"
EOF
  chmod +x "$pkgdir/usr/bin/$_pkgname"

  # Install application entry (use upstream desktop file with corrected Exec and StartupWMClass)
  sed -e 's|Exec=.*|Exec=streamcontroller|' \
      -e 's|^Categories=Utility$|Categories=Utility;|' \
      "$srcdir/$_reponame/flatpak/launch.desktop" > "$srcdir/sc.desktop"
  # Upstream's launch.desktop has no trailing newline; the leading \n keeps
  # StartupWMClass from being appended onto the Categories line
  printf '\nStartupWMClass=com.core447.StreamController\n' >> "$srcdir/sc.desktop"
  install -Dm644 "$srcdir/sc.desktop" "$pkgdir/usr/share/applications/com.core447.StreamController.desktop"

  # Install icon under reverse-domain name matching the app's GApplication ID
  install -Dm644 "$srcdir/$_reponame/flatpak/icon_256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/com.core447.StreamController.png"
}
