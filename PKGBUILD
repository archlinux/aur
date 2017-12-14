# Maintainer: Naoki Kanazawa <nk dot naoki912 at gmail dot com>
pkgname=inbox-app-git
pkgver=58.f96347d
pkgrel=1
pkgdesc="Google Inbox packaged as Electron app"
arch=('any')
url="https://github.com/fgnass/inbox-app"
license=('custom:UNLICENSE')
depends=('alsa-lib' 'gconf' 'gtk2' 'libnotify' 'libxss' 'libxtst' 'nss' 'xdg-utils')
makedepends=('git' 'npm' 'gendesk')
source=('git://github.com/fgnass/inbox-app.git')
md5sums=('SKIP')
conflicts=('inbox-app')
provides=('inbox-app')

_gitname=inbox-app

pkgver() {
    cd $_gitname
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
    gendesk -n --pkgname "$pkgname" --pkgdesc "$pkgdesc"
}

build() {
    cd $_gitname

    npm install
    npm run pack-linux
}

package() {
    cd $_gitname

    install -d $pkgdir/opt
    cp -r dist/Inbox-linux-x64 $pkgdir/opt/$pkgname

    install -dm755 ${pkgdir}/usr/bin
    ln -sf /opt/$pkgname/Inbox $pkgdir/usr/bin/inbox-app

    msg "Copying license..."
    install -D -m 644 UNLICENSE $pkgdir/usr/share/licenses/${pkgname%-git}/UNLICENSE

    msg "Copying desktop file..."
    install -Dm644 "$srcdir/${pkgname%-git}.desktop" "$pkgdir/usr/share/applications/${pkgname%-git}.desktop"

    msg "Copying icons..."
    install -Dm644 "icon.iconset/icon_256x256.png" "$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"
}
