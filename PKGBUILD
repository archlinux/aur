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
sha256sums=('295a23898f8c88fb2e2f4899e0d226ca913688b815b6430c850ae8c7de7a2a19'
            'c499ee11c388d32c6810af7add342aaf85ed0fd4b207f0868bca7b94554d5cc5')

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
