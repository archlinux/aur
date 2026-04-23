# Maintainer: Mohamad Obeid <mobeid nine nine nine nine at gmail dot com>
pkgname=mixtapes-git
pkgver=2026.23.04.0
pkgrel=1
pkgdesc="A modern, Linux-first YouTube Music player"
arch=('any')
url="https://github.com/m-obeid/Mixtapes"
license=('GPL3')
depends=('python' 'python-gobject' 'gtk4' 'libadwaita' 'webkitgtk-6.0' 'nodejs' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly' 'yt-dlp' 'yt-dlp-ejs' 'python-requests' 'python-ytmusicapi' 'python-mprisify' 'python-mutagen')
makedepends=('git')
provides=("mixtapes")
conflicts=("mixtapes")
source=("${pkgname}::git+https://github.com/m-obeid/Mixtapes.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  grep -oP '(?<=<release version=")[^"]+' com.pocoguy.Muse.metainfo.xml | head -1 | tr '-' '.'
}

build() {
  cd "$pkgname"
  glib-compile-resources --sourcedir=. src/muse.gresource.xml --target=src/muse.gresource
}

package() {
  cd "$pkgname"
  
  # Install application files
  install -d "$pkgdir/usr/lib/mixtapes"
  cp -r src "$pkgdir/usr/lib/mixtapes/"
  cp -r assets "$pkgdir/usr/lib/mixtapes/"
  
  # Install desktop file, metainfo and icons
  install -Dm644 com.pocoguy.Muse.desktop "$pkgdir/usr/share/applications/com.pocoguy.Muse.desktop"
  install -Dm644 com.pocoguy.Muse.metainfo.xml "$pkgdir/usr/share/metainfo/com.pocoguy.Muse.metainfo.xml"
  install -Dm644 assets/icons/hicolor/scalable/actions/compass2-symbolic.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.pocoguy.Muse.svg"

  # Launcher
  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/muse" << 'EOF'
#!/bin/sh
exec python /usr/lib/mixtapes/src/main.py "$@"
EOF
  chmod +x "$pkgdir/usr/bin/muse"
  
  # Also provide 'mixtapes' as an alias
  ln -s muse "$pkgdir/usr/bin/mixtapes"
}
