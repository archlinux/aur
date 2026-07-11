# Maintainer: Frank Villaro-Dixon <f@vi-di.fr>
# Old-Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=kdrive-bin
pkgver=3.8.5.2
pkgrel=2
pkgdesc='Infomaniak Drive desktop synchronization client (pre-compiled version)'
url='https://drive.infomaniak.com'
arch=(x86_64)
license=(GPL2)
source=(https://download.storage.infomaniak.com/drive/desktopclient/kDrive-$pkgver-amd64.AppImage
        kDrive.desktop
        kDrive.png)
sha256sums=('f1e73b77e1c8f3d19208a47c7af801b55cb6a84cddaf33e5f7bb4fbef4736402'
            '32ad48544a175176453e97c99870fc98f9a847c8e7c2c2bf32f2e7410d6b577d'
            'b142e3a06de916f47e8666bddc74dfe37249616fd578ab9ae63b17a945d46813')
depends=(org.freedesktop.secrets # for session persistence
         fuse2)
conflicts=(kdrive)
provides=(kdrive)
options=(!strip)

package() {
  # App must NOT be named exactly "kDrive":
  # (https://github.com/Infomaniak/desktop-kDrive/issues/2129)
  install -Dm755 kDrive-$pkgver-amd64.AppImage "$pkgdir"/usr/bin/kdrive

  # Compat shim for old autostart entries and terminal users who like `kDrive` ;-)
  install -dm755 "$pkgdir"/usr/bin
  cat > "$pkgdir"/usr/bin/kDrive <<'EOF'
#!/bin/sh
exec /usr/bin/kdrive "$@"
EOF
  chmod 755 "$pkgdir"/usr/bin/kDrive

  # Desktop shortcut
  desktop-file-install --dir "$pkgdir"/usr/share/applications kDrive.desktop
  install -Dm644 kDrive.png "$pkgdir"/usr/share/icons/hicolor/512x512/apps/kDrive.png
}
