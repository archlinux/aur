# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=easyflatpak
pkgver=4.5.3
pkgrel=1
pkgdesc='Manage your flatpaks with a simple GUI'
arch=(any)
url='https://github.com/imikado/dupotEasyFlatpak'
license=(LGPL-2.1-only)
depends=(
  bash
  flatpak
  gdk-pixbuf2
  glib2
  gtk4
  hicolor-icon-theme
  libadwaita
  pango
  python
  python-gobject
)
makedepends=(git)
source=("git+https://github.com/imikado/dupotEasyFlatpak.git#tag=$pkgver")
b2sums=(25b0d5824219b1503970036e8beab527a31b58c362bdf389065c9d9ff6d838ce74fc81b9e1519108a190481d67cee613c9e3281af322c5ffa42f1e040da91ba6)

prepare() {
  cd dupotEasyFlatpak
  cat > dupot_easy_flatpak.sh <<'EOF'
#!/bin/sh
cd /usr/share/dupot_easy_flatpak/src
exec python3 main.py
EOF
}

package() {
  cd dupotEasyFlatpak
  mkdir -p "$pkgdir/usr/share/dupot_easy_flatpak"
  cp -R src/ "$pkgdir/usr/share/dupot_easy_flatpak/"
  install -Dm755 dupot_easy_flatpak.sh "$pkgdir/usr/bin/dupot_easy_flatpak"

  for res in 16 24 32 48 64 512; do
    install -Dm644 export/flatpak/${res}x${res}.png "$pkgdir/usr/share/icons/hicolor/${res}x${res}/apps/org.dupot.easyflatpak.png"
  done

  install -Dm644 -t "$pkgdir/usr/share/applications/" export/flatpak/org.dupot.easyflatpak.desktop
  install -Dm644 -t "$pkgdir/usr/share/metainfo/" export/flatpak/org.dupot.easyflatpak.appdata.xml
  install -Dm644 -t "$pkgdir/usr/share/mime/packages/" export/flatpak/org.dupot.easyflatpak.xml

  python -m compileall -d /usr/share "$pkgdir/usr/share"
  python -O -m compileall -d /usr/share "$pkgdir/usr/share"
}
