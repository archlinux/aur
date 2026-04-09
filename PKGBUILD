# Maintainer: jaso

pkgname=kute-bin
pkgver=1.51
pkgrel=2
pkgdesc="A minimal music player for Wayland"
arch=('x86_64')
url="https://github.com/H33aven/kute"
license=('ISC')
depends=('electron' 'nodejs')
makedepends=('npm' 'imagemagick')
source=(
  "kute-$pkgver.tar.gz::https://github.com/H33aven/kute/archive/v$pkgver.tar.gz"
  "kute.desktop"
  "kute.png::https://raw.githubusercontent.com/H33aven/kute/main/kute.png"
)
sha256sums=('68725825c4661f1d9feb998755ddf09f6528bfceb40f8c950185d041509e287b'
            'e57da3bf9ff1ed0602ca3f048321128e619a2fd5f9cc45f7344a8aec90d376c9'
            'cff8a12ac9522adf676ac96f3586d9d85f007abb061281a66ea958a0e1347378')

build() {
  cd "$srcdir/kute-$pkgver"
  npm install --production --no-audit --no-fund
}

package() {
  install -dm755 "$pkgdir/usr/lib/$pkgname"
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/share/applications"
  install -dm755 "$pkgdir/usr/share/pixmaps"

  cp -r "$srcdir/kute-$pkgver"/* "$pkgdir/usr/lib/$pkgname/"

  rm -rf "$pkgdir/usr/lib/$pkgname/node_modules/electron"
  rm -rf "$pkgdir/usr/lib/$pkgname/kute-releases"
  find "$pkgdir/usr/lib/$pkgname" -name "*.md" -delete
  find "$pkgdir/usr/lib/$pkgname" -name "*.log" -delete

  cat > "$pkgdir/usr/bin/$pkgname" << EOF
#!/bin/sh
exec /usr/bin/electron /usr/lib/$pkgname "\$@"
EOF
  chmod 755 "$pkgdir/usr/bin/$pkgname"

  install -Dm644 "$srcdir/kute.desktop" "$pkgdir/usr/share/applications/kute.desktop"
  install -Dm644 "$srcdir/kute.png" "$pkgdir/usr/share/pixmaps/kute.png"
}
