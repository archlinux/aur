# Maintainer: robertfoster

pkgname=openbazaar
pkgver=2.3.7
pkgrel=1
pkgdesc="Front-end Electron application for talking with the OpenBazaar daemon"
arch=(i686 x86_64)
url="https://github.com/OpenBazaar/openbazaar-desktop"
license=('MIT')
depends=('electron6')
makedepends=('npm')
source=("https://github.com/OpenBazaar/openbazaar-desktop/archive/v$pkgver.tar.gz"
    "$pkgname.js"
    "$pkgname.desktop"
)
install=$pkgname.install
options=('!strip')

prepare() {
    cd $srcdir/$pkgname-desktop-$pkgver
    npm install --silent
}
build() {
    cd $srcdir/$pkgname-desktop-$pkgver
    
    npm install --silent
    npm run build
    npm prune --production
}

package() {
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
    -or -name "test" -prune -exec rm -r '{}' \;
    
    pathtoreplace=`echo ${srcdir}/ | sed 's:/:\\\/:g'`
    find "$pkgdir/$appdir/node_modules/" -name "*.json" -exec \
    sed -i "s/$pathtoreplace//g" {} +
}

md5sums=('a12f6cf69caa427f1e24b3991362730c'
         '9cbd95a65cb9d7a81cb39ec02127ac8d'
         '2e7c7804b970baa7f9274dae47618a52')
