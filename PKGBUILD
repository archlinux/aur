# Maintainer: Piliii <naifmohsenaziz@gmail.com>
pkgname=librenotes-bin
pkgver=1.2.1
pkgrel=1
pkgdesc="Private, self-hosted, end-to-end encrypted note-taking app"
arch=('x86_64')
url="https://github.com/Piliii/LibreNotes"
license=('AGPL-3.0-only')
depends=('gtk3')
optdepends=('xdg-utils: open links from notes')
provides=('librenotes')
conflicts=('librenotes')

source_x86_64=("${pkgname}-${pkgver}-linux-x86_64.tar.gz::https://github.com/Piliii/LibreNotes/releases/download/v${pkgver}/LibreNotes-${pkgver}-linux-x86_64.tar.gz")
sha256sums_x86_64=('62ae50cc02d71027d0d0b96cfbfe02bde319d4e3088e8712dcb788b177b87675')

package() {
  # Flutter bundle — keep internal layout intact; binary uses $ORIGIN/lib and data/
  install -dm755 "$pkgdir/opt/librenotes"
  cp -r librenotes/. "$pkgdir/opt/librenotes/"

  # Launcher wrapper so 'librenotes' works from PATH
  install -dm755 "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/librenotes" <<'EOF'
#!/bin/bash
cd /opt/librenotes
exec ./librenotes "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/librenotes"

  # Desktop entry, icon, AppStream metadata
  install -Dm644 librenotes/dev.librenotes.app.desktop \
    "$pkgdir/usr/share/applications/dev.librenotes.app.desktop"
  install -Dm644 librenotes/dev.librenotes.app.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/dev.librenotes.app.png"
  install -Dm644 librenotes/dev.librenotes.app.appdata.xml \
    "$pkgdir/usr/share/metainfo/dev.librenotes.app.appdata.xml"
}
