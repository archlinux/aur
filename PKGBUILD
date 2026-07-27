# Maintainer: Faris Aghna <frsaghna@gmail.com>

pkgname=markdowned
pkgver=1.0.0
pkgrel=1
pkgdesc="Premium, distraction-free Markdown editor and viewer"
arch=('any')
url="https://github.com/frsaghna/markdowned"
license=('GPL-3.0-or-later')
depends=('electron39')
makedepends=('npm' 'esbuild' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('507e73fdd06b69bb9f6c6a44b5fcf5b43395df7e2f79120221a8c6145c21f27f')

prepare() {
  cd "$pkgname-$pkgver"
  npm install --no-audit --no-fund
}

build() {
  cd "$pkgname-$pkgver"
  npm run build
  npm prune --production
}

package() {
  cd "$pkgname-$pkgver"

  # Install application files
  install -d "$pkgdir/usr/lib/$pkgname"
  cp -r index.html main.js preload.js renderer.js styles.css package.json node_modules "$pkgdir/usr/lib/$pkgname/"

  # Install wrapper launcher script
  install -d "$pkgdir/usr/bin"
  cat << EOF > "$pkgdir/usr/bin/$pkgname"
#!/bin/sh
if command -v electron39 >/dev/null 2>&1; then
  exec electron39 /usr/lib/$pkgname "\$@"
else
  exec electron /usr/lib/$pkgname "\$@"
fi
EOF
  chmod 755 "$pkgdir/usr/bin/$pkgname"

  # Install desktop entry
  install -Dm644 markdowned.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"

  # Install application icon
  install -Dm644 assets/markdowned.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
