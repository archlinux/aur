# Maintainer: 苏向夜 <fu050409@163.com>
# Contributor: 苏向夜 <fu050409@163.com>

pkgname=cyber-legym-git
pkgver=0.2.1
pkgrel=1
pkgdesc="Running a pretty derby with cyber-legym gracefully"
arch=('any')
url="https://github.com/noctisynth/pretty-derby-ui"
license=('agplv3')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
makedepends=('git' 'file' 'openssl' 'appmenu-gtk-module' 'libappindicator-gtk3' 'librsvg' 'base-devel' 'curl' 'wget' 'npm' 'nodejs' 'dpkg')
provides=('cyber-legym')
options=('!strip' '!emptydirs')
source=("git+https://github.com/noctisynth/pretty-derby-ui.git")
sha256sums=('SKIP')

prepare() {
  cd pretty-derby-ui
  git submodule update --init --recursive

  npm install
  npm run tauri build -- --no-bundle
  npm run tauri bundle -- --bundles deb
}
package() {
  cd "$srcdir"/pretty-derby-ui/src-tauri/target/release/bundle/deb
  dpkg-deb -x *.deb here
  cd here

  install -Dm755 usr/bin/pretty-derby-ui "$pkgdir"/usr/bin/cyber-legym

    echo """[Desktop Entry]
Categories=
Comment=No one knows what this means
Exec=WEBKIT_DISABLE_COMPOSITING_MODE=1 cyber-legym
Icon=cyber-legym
Name=Pretty Derby
Terminal=false
Type=Application""" > usr/share/applications/cyber-legym.desktop

    # Install desktop file
    install -Dm644 usr/share/applications/cyber-legym.desktop "$pkgdir"/usr/share/applications/cyber-legym.desktop

    # Install icons
    install -Dm644 usr/share/icons/hicolor/128x128/apps/pretty-derby-ui.png "$pkgdir"/usr/share/icons/hicolor/128x128/apps/cyber-legym.png
    install -Dm644 usr/share/icons/hicolor/256x256@2/apps/pretty-derby-ui.png "$pkgdir"/usr/share/icons/hicolor/256x256@2/apps/cyber-legym.png
    install -Dm644 usr/share/icons/hicolor/32x32/apps/pretty-derby-ui.png "$pkgdir"/usr/share/icons/hicolor/32x32/apps/cyber-legym.png
  # Extract package data
}
