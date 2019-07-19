# Maintainer : Colin Berry <colinb969@gmail.com>
pkgname=flashpoint-git
pkgver=fd01bbe
pkgrel=1
pkgdesc="Launcher for BlueMaxima's Flashpoint"
arch=('x86_64')
url="http://bluemaxima.org/flashpoint/"
license=('MIT')
depends=('nss>=3.0'
         'gtk3')
makedepends=('npm')
source=("${pkgname}"::"git+https://github.com/FlashpointProject/launcher.git"
        "https://raw.githubusercontent.com/colin969/launcher/desktop/linux/flashpoint.desktop")
md5sums=('SKIP' 'SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	echo "$(git rev-parse --short HEAD)"
}

build(){
    cd "${srcdir}/${pkgname}"
    npm install
    npm run release
}

package(){
    # Application
    mkdir -p $pkgdir/opt/ \
             $pkgdir/var/opt/flashpoint \
             $pkgdir/usr/share/pixmaps/
    
    cp -R $srcdir/$pkgname/dist/* "$pkgdir/opt/flashpoint"
    cp $srcdir/$pkgname/icons/icon.png "$pkgdir/usr/share/pixmaps/flashpoint.png"

    # Preferences/Config are stored alongside app?
    touch $pkgdir/var/opt/flashpoint/preferences.json
    ln -s $pkgdir/var/opt/flashpoint/preferences.json $pkgdir/opt/flashpoint/preferences.json
    touch $pkgdir/var/opt/flashpoint/config.json
    ln -s $pkgdir/var/opt/flashpoint/config.json $pkgdir/opt/flashpoint/config.json

    # Desktop Entry
    install -Dm644 $srcdir/flashpoint.desktop "$pkgdir/usr/share/applications/flashpoint.desktop"

    # License
    install -Dm644 $srcdir/$pkgname/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}