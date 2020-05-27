# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>

_pkgname=gmail-app
pkgname=$_pkgname-git
pkgver=4.c746b87
pkgrel=1
pkgdesc="Google GMail packaged as Electron app"
arch=('any')
url="https://github.com/fgnass/gmail-app"
license=('custom:UNLICENSE')
depends=('alsa-lib' 'gconf' 'gtk2' 'libnotify' 'libxss' 'libxtst' 'nss' 'xdg-utils')
makedepends=('git' 'npm' 'gendesk')
source=('git+https://github.com/fgnass/gmail-app.git'
	'package.json')
sha256sums=('SKIP'
            '1a0128814b61bee125247409e6393ec17e56ca62707b730f72290c89c2886107')
conflicts=('inbox-app')
provides=('inbox-app')

pkgver() {
    cd $_pkgname
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
    gendesk -n --pkgname "$pkgname" --pkgdesc "$pkgdesc"
}

build() {
  cd $srcdir/$_pkgname
  cp $srcdir/package.json .
  npm install
  npm run pack-linux
}

package() {
  cd $srcdir/$_pkgname

  install -d $pkgdir/opt
  cp -r dist/Gmail-linux-x64 $pkgdir/opt/$pkgname

  install -dm755 ${pkgdir}/usr/bin
  ln -sf /opt/$pkgname/gmail $pkgdir/usr/bin/gmail-app

  msg "Copying license..."
  install -D -m 644 UNLICENSE $pkgdir/usr/share/licenses/${pkgname%-git}/UNLICENSE

  msg "Copying desktop file..."
  install -Dm644 "$srcdir/${pkgname%-git}.desktop" "$pkgdir/usr/share/applications/${pkgname%-git}.desktop"

  msg "Copying icons..."
  install -Dm644 "icon.iconset/icon_256x256.png" "$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"
}
