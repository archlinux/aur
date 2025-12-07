# Maintainer: Saeed Vaziry <mr.saeedvaziry@gmail.com>
pkgname=tweakphp
pkgver=0.13.0
pkgrel=1
pkgdesc="A desktop application with a code editor to tweak your PHP code"
arch=('x86_64' 'aarch64')
url="https://github.com/tweakphp/tweakphp"
license=('MIT')
depends=('electron35' 'zlib')
makedepends=('npm' 'nodejs>=22' 'python')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tweakphp/tweakphp/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  
  # Install npm dependencies
  npm install --cache "${srcdir}/npm-cache"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  
  # Set environment variable
  export VITE_LSP_WEBSOCKET_PORT=54331
  
  # Build the application
  npm run build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  
  # Install application files
  install -dm755 "$pkgdir/usr/lib/$pkgname"
  
  # Copy built files
  cp -r dist "$pkgdir/usr/lib/$pkgname/"
  cp -r node_modules "$pkgdir/usr/lib/$pkgname/"
  cp -r build "$pkgdir/usr/lib/$pkgname/"
  cp -r public "$pkgdir/usr/lib/$pkgname/"
  cp -r migrations "$pkgdir/usr/lib/$pkgname/"
  cp package.json "$pkgdir/usr/lib/$pkgname/"
  
  # Install icon
  install -Dm644 build/icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  
  # Create desktop entry
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" <<EOF
[Desktop Entry]
Name=TweakPHP
Comment=Tweak your PHP code easily
Exec=tweakphp %U
Terminal=false
Type=Application
Icon=tweakphp
Categories=Development;IDE;
MimeType=text/x-php;
EOF
  
  # Create launcher script
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<EOF
#!/bin/sh
exec electron35 /usr/lib/$pkgname/dist/main.js "\$@"
EOF

  # Install license
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
