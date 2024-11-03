# Maintainer: nosduco <nosduco at gmail dot com>
pkgname=streamcontroller
_pkgname=${pkgname%-git}
_reponame=StreamController
pkgver=r1620.2b5e328
pkgrel=1
pkgdesc="An elegant Linux app for the Elgato Stream Deck with support for plugins"
arch=('any')
url="https://github.com/StreamController/StreamController"
license=('GPL-3')
depends=('python' 'xdg-desktop-portal' 'xdg-desktop-portal-gtk' 'libportal' 'libportal-gtk4' 'libadwaita')
makedepends=('git' 'python-pip')
source=("git+https://github.com/StreamController/StreamController.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_reponame"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_reponame"

    # Install dependencies isolated
    pip install --target="$srcdir/deps" --no-warn-script-location -r requirements.txt
}

package() {
    cd "$srcdir"

    # Copy/install repository files and dependencies
    mkdir -p "$pkgdir/usr/lib/$pkgname"
    install -d "$_reponame" "$pkgdir/usr/lib/$pkgname/"
    cp -r "$_reponame"/* "$pkgdir/usr/lib/$pkgname/"
    cp -r "deps"/* "$pkgdir/usr/lib/$pkgname"

    # Install launch script to /usr/bin
    mkdir -p "$pkgdir/usr/bin"
    echo "#!/bin/bash" > "$pkgdir/usr/bin/$pkgname"
    echo "cd /usr/lib/$pkgname" >> "$pkgdir/usr/bin/$pkgname"
    echo "python3 main.py \$@" >> "$pkgdir/usr/bin/$pkgname"
    chmod +x "$pkgdir/usr/bin/$pkgname"

    # Install application entry
    install -Dm644 "$startdir/streamcontroller.desktop" "$pkgdir/usr/share/applications/streamcontroller.desktop"

    # Install icon
    install -Dm644 "$srcdir/$_reponame/flatpak/icon_256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/streamcontroller.png"
}

clean() {
  cd "$srcdir"
  rm -rf "$_reponame" "deps"
}
