# Maintainer: <francois@francoisvankempen.com>
options=('!debug')
pkgname=drawboard-pdf
pkgver=1.0.1
pkgrel=1
pkgdesc="Electron wrapper for Drawboard PDF software"
arch=('x86_64')
url=""
license=('MIT')  # Change if needed
depends=('electron' 'gtk3' 'nss' 'alsa-lib' 'ffmpeg')
makedepends=('nodejs' 'npm')
source=("https://github.com/bjorkbjork/DrawboardPDF-Linux/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz") # Replace with your release source if hosting
sha256sums=('d842fb19d1f148c91aa5971c91462f10757f25f93b7e855db195c9adf4256091')

build() {
  cd "$srcdir"
  npm ci
}

package() {
  cd "$srcdir/src" 
  install -dm755 "$pkgdir/usr/lib/$pkgname"

  cp -r src/* "$pkgdir/usr/lib/$pkgname" 2>/dev/null || cp -r . "$pkgdir/usr/lib/$pkgname"
  rm -rf "$pkgdir/usr/lib/$pkgname/node_modules" \
           "$pkgdir/usr/lib/$pkgname/dist" \
           "$pkgdir/usr/lib/$pkgname/src" \
           "$pkgdir/usr/lib/$pkgname/pkg"

   install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" << 'EOF'
#!/bin/bash
exec electron /usr/lib/drawboard-pdf "$@"
EOF

  install -Dm644 assets/icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"

  install -Dm644 "../$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}

