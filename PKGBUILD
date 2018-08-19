# Maintainer: robertfoster

pkgname=openbazaar
pkgver=2.2.4
pkgrel=1
pkgdesc="Front-end Electron application for talking with the OpenBazaar daemon"
arch=(i686 x86_64)
url="https://github.com/OpenBazaar/openbazaar-desktop"
license=('MIT')
depends=(electron)
makedepends=(npm)
source=("https://github.com/OpenBazaar/openbazaar-desktop/archive/v$pkgver.tar.gz"
    "$pkgname.js"
    "$pkgname.desktop"
)
install=$pkgname.install
options=('!strip')

build(){
    cd $srcdir/$pkgname-desktop-$pkgver
    npm install --silent
    npm run build
    npm prune --production
}

package(){
    cd $srcdir
    appdir="usr/lib/$pkgname"

    install -d $pkgdir/${appdir%%/$pkgname}
    cp -rf $pkgname-desktop-$pkgver $pkgdir/$appdir
    install -Dm755 $pkgname.js $pkgdir/usr/bin/$pkgname
    install -Dm644 $pkgname-desktop-$pkgver/imgs/icon.png $pkgdir/usr/share/pixmaps/${pkgname}2.png
    install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop

    cd $pkgdir/$appdir
    rm -rf .git*
    rm -rf .travis
    cp -rf prod/* js/
    find "${pkgdir}"/${appdir} \
        -name "bin" -prune -exec rm -r '{}' \; \
        -or -name "example" -prune -exec rm -r '{}' \; \
        -or -name "examples" -prune -exec rm -r '{}' \; \
        -or -name "test" -prune -exec rm -r '{}' \; \
        -or -executable -type f -exec rm -r '{}' \;
}

md5sums=('8e38ce7fe55081fd6f97c9293eb8ae11'
    '122a3e23d7ecfef0a82e756cb97c3e98'
'2e7c7804b970baa7f9274dae47618a52')
