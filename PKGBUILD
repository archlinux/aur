# Maintainer: NotFrost <notfrost@github>
# Contributor: opencode

pkgname=frozen-rpc
pkgver=1.0.0.beta.3
pkgrel=4
pkgdesc="Cross-platform Discord Rich Presence injector with OAuth2 and Gateway support"
arch=('x86_64')
url="https://github.com/FrostX2/frozen-rpc"
license=('MIT')
depends=('electron' 'electron>=28')
makedepends=('git' 'npm')
optdepends=('discord: required Discord client for local IPC mode')
options=('!strip' '!debug')
source=("$pkgname::git+$url.git#branch=main")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname"
  npm ci --omit=dev --ignore-scripts
}

package() {
  cd "$srcdir/$pkgname"

  install -dm755 "$pkgdir/usr/lib/$pkgname"
  cp -r . "$pkgdir/usr/lib/$pkgname/"
  rm -rf "$pkgdir/usr/lib/$pkgname/.git"
  rm -rf "$pkgdir/usr/lib/$pkgname/node_modules/.cache"

  install -dm755 "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/$pkgname" << 'EOF'
#!/bin/sh
exec /usr/bin/electron /usr/lib/frozen-rpc "$@"
EOF
  chmod +x "$pkgdir/usr/bin/$pkgname"

  install -Dm644 "$pkgdir/usr/lib/$pkgname/assets/icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"

  install -Dm644 "$pkgdir/usr/lib/$pkgname/shell/frozen-rpc.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  sed -i 's|Icon=.*|Icon=frozen-rpc|' "$pkgdir/usr/share/applications/$pkgname.desktop"
}
