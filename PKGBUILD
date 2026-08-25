# Maintainer: itonia149 <itonia149@users.noreply.github.com>
# Contributor: itonia149 <itonia149@users.noreply.github.com>
pkgname=outlook-for-linux
pkgver=0.1.1
pkgrel=1
pkgdesc="Unofficial Electron wrapper for Microsoft Outlook Web"
arch=('any')
url="https://github.com/itonia149/outlook-for-linux"
license=('MIT')
depends=('electron' 'hicolor-icon-theme')
source=("$pkgname-$pkgver.tar.gz::https://github.com/itonia149/outlook-for-linux/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('68276bff7d729eba052adce9090f0f6698ae0506184e6dea2875e4428e060d39')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Application sources (no node_modules: electron comes from the system dep)
  install -d "$pkgdir/usr/lib/$pkgname"
  cp -r src assets "$pkgdir/usr/lib/$pkgname/"
  install -Dm644 package.json "$pkgdir/usr/lib/$pkgname/package.json"

  # Launcher script running the app with system electron
  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/$pkgname" <<EOF
#!/bin/sh
exec electron /usr/lib/$pkgname "\$@"
EOF
  chmod 755 "$pkgdir/usr/bin/$pkgname"

  # Desktop entry (deliberately no MimeType= handler: not replacing the user's mail client)
  install -Dm644 packaging/$pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  # Icons into hicolor
  for size in 16 32 48 64 128 256 512; do
    install -Dm644 "assets/icons/$pkgname-$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$pkgname.png"
  done
  install -Dm644 assets/$pkgname.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
