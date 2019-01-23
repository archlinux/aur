# Maintainer: suthernfriend <public@janpeterkoenig.com>
# Contributor: RPDiep
# Contributor: Hugo Barrera <hugo@barrera.io>
# Contributor: liberodark

pkgname=tusk
pkgver=0.21.0
pkgrel=1
pkgdesc="Refined Evernote desktop app"
arch=('x86_64')
url="https://github.com/klaussinani/tusk"
license=('MIT')
makedepends=('nodejs' 'npm')
depends=('xdg-utils' 'dbus' 'glib2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/klaussinani/tusk/archive/v${pkgver}.tar.gz"
        $pkgname.desktop
        $pkgname.png)
sha256sums=('c7db7d3ef890dbc39fe13239eb6078f085d99153649c37bec99feed511135b32'
            'b72cfcd35a727cb982f82d9f97f9e4330e81fbc70af47d1bc7f5baa7837a29f3'
            '2e8e1f13a86bd4a8fdbd2a4a69cde6b09e035b31352ad60f5a81d61a7abfe5bf')

package() {
  cd $srcdir/$pkgname-$pkgver
  install -vDm644 ./license.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  npm install
  node ./node_modules/electron-builder/out/cli/cli.js build -l dir --x64
  cd ./dist/linux-unpacked
  install -vDm644 -t "$pkgdir/usr/lib/$pkgname" ./*.pak ./*.dat ./*.bin
  install -vDm644 -t "$pkgdir/usr/lib/$pkgname/locales" ./locales/*
  install -vDm644 -t "$pkgdir/usr/lib/$pkgname/resources" ./resources/*
  install -vDm755 -t "$pkgdir/usr/lib/$pkgname" ./*.so tusk
  install -vdm755 "$pkgdir/usr/bin"
  ln -sf /usr/lib/tusk/tusk "$pkgdir/usr/bin/tusk"
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" ./LICENSE*
  install -vDm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -vDm644 $srcdir/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
}
