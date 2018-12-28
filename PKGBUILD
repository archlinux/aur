# Maintainer: robertfoster

pkgname=openbazaar
pkgver=2.2.5
pkgrel=2
pkgdesc="Front-end Electron application for talking with the OpenBazaar daemon"
arch=(i686 x86_64)
url="https://github.com/OpenBazaar/openbazaar-desktop"
license=('MIT')
depends=('electron2')
makedepends=('npm')
source=("https://github.com/OpenBazaar/openbazaar-desktop/archive/v$pkgver.tar.gz"
    "$pkgname.js"
    "$pkgname.desktop"
    ef26cd0e8014e09b3671500f92c8f1b0d0ebe340.patch
    0bf7d134dc13540b277c10fbd1efb8013aae603e.patch
)
install=$pkgname.install
options=('!strip')

build(){
    cd $srcdir/$pkgname-desktop-$pkgver

    # Some electron fixes
    patch -Np1 -i ../ef26cd0e8014e09b3671500f92c8f1b0d0ebe340.patch
    patch -Np1 -i ../0bf7d134dc13540b277c10fbd1efb8013aae603e.patch

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
        -or -name "test" -prune -exec rm -r '{}' \;
}

md5sums=('572a60b5a7b89e87b039e4bea67db990'
    'a6f53663934868281cc8aa88c894ed3c'
    '2e7c7804b970baa7f9274dae47618a52'
    'cc30e1a4742c4e671275842e8b450916'
'72266e0d0f3e3137cbea70f0dade7bfc')
