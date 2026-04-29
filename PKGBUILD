# Maintainer: Gemini CLI <gemini-cli@google.com>
pkgname=even-terminal
pkgver=0.6.5
pkgrel=2
pkgdesc="CLI component for Even Realities G2 smart glasses Terminal Mode"
arch=('any')
url="https://www.evenrealities.com/"
license=('custom:proprietary')
depends=('nodejs>=20')
makedepends=('npm')
source=("https://registry.npmjs.org/@evenrealities/$pkgname/-/$pkgname-$pkgver.tgz"
        "even-terminal.service")
sha256sums=('184a57ce5e9469f7ff670774e0f4e6e28ab5093af4dce9ab3484283640b07733'
            '2638fa61f2893a957b58aa0844b315e815bb9126bac2b8ccb0905934f72ceb2d')

package() {
  npm install -g --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"

  # Fix permissions
  find "$pkgdir/usr" -type d -exec chmod 755 {} +
  find "$pkgdir/usr/lib/node_modules" -type f -exec chmod 644 {} +
  
  # Restore executable bit for binaries
  if [ -d "$pkgdir/usr/lib/node_modules/@evenrealities/$pkgname/bin" ]; then
    find "$pkgdir/usr/lib/node_modules/@evenrealities/$pkgname/bin" -type f -exec chmod 755 {} +
  fi

  # npm adds references to the build directory in package.json
  find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
  find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_args/d'
  find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_from/d'
  find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_id/d'
  
  # Clean up npm garbage
  [ -d "$pkgdir/usr/etc" ] && rmdir "$pkgdir/usr/etc"

  # License
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  find "$pkgdir/usr/lib/node_modules/@evenrealities/$pkgname" -maxdepth 1 \( -iname "license*" -o -iname "copying*" \) -exec cp -t "$pkgdir/usr/share/licenses/$pkgname/" {} +

  # Systemd unit
  install -Dm644 even-terminal.service "$pkgdir/usr/lib/systemd/user/even-terminal.service"
}
