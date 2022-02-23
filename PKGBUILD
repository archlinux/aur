# Maintainer: grant mclendon (grant.mclendon@gmail.com)
pkgname='linear-nativefier'
pkgbase='linear-nativefier'
pkgver=1.0
pkgrel=1
pkgdesc="linear wrapped as a desktop application through Nativefier"
arch=('x86_64')
url=https://linear.app
license=('MIT')
makedepends=(npm nodejs-nativefier nodejs)
source=('linearicon.png'
        'linear.desktop')
sha256sums=('794a8e54589c5e97e87740ad7a8db8d2ad167c8bfaa032c8ee774ab3098683a2'
            'a42995f14c1d028624f66e5274e8a428a73176fd36666ba5554a9445f6ba17a6')

appname=linear-desktop
        
build() {
    nativefier "https://linear.app/" \
    --icon linearicon.png \
    --maximize \
    --show-menu-bar \
    --single-instance \
    --name $appname
}

package() {
    install -d "$pkgdir"/opt "$pkgdir"/usr/{bin,share/pixmaps}
    install -Dm644 linear.desktop "$pkgdir"/usr/share/applications/$appname.desktop
    
    cp -rL $appname-linux-* "$pkgdir"/opt/$pkgname
    ln -sf /opt/$pkgname/$appname "$pkgdir"/usr/bin/$appname
    ln -sf /opt/$pkgname/resources/app/icon.png "$pkgdir"/usr/share/pixmaps/$appname.png    
    chmod 666 "$pkgdir"/opt/$pkgname/resources/app/nativefier.json
    sed -i 's/!options.saveAs/options.saveAs/g' "$pkgdir"/opt/$pkgname/resources/app/lib/main.js
}
