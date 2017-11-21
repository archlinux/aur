# Maintainer: Nika Topolchanskaya <nanodesuu at gmail dot com>
# Contributor: PKGBUILD based on zcoin-git by Timur Kiyivinski <timur at linux dot com>

pkgname=zoin
pkgver=0.8.7.5
pkgrel=1
pkgdesc='The Zoin Cryptocurrency wallet, Qt GUI'
arch=('any')
url='https://github.com/zoincoin/zoin'
provides=('zoin')
conflicts=('zoin')
license=('MIT')
depends=('db4.8' 'boost' 'miniupnpc' 'qt5-base' 'qt5-tools' 'openssl-1.0' 'qrencode')
makedepends=('wget' 'unzip')
source=("https://github.com/zoincoin/zoin/releases/download/v0.8.7.5/zoin-master-src-0875.zip" 
	"quotefix.patch"
	"miniupnpc.patch"
	"db48.patch"
	"checkpoints.patch"
        "${pkgname}.desktop")
md5sums=('5f933ebb8d3c24a5552acd59fa99c05a'
         '71e2036b56f992edee08003ea39491e3'
         '5b05afe70742e8c607171281416961dc'
         '4f0de069be24574687f1d21f4ea720b5'
         '82f69b71a43b2cae83e7936e9135a27b'
         '9e64ccc6310db035e153e7606a1b481b')

build() {
    cd "$pkgname"-master
    patch -p1 < ../quotefix.patch
    patch -p1 < ../miniupnpc.patch
    patch -p1 < ../db48.patch #Specific db4.8 include path
    patch -p1 < ../checkpoints.patch #Blockchain checkpoints upstream update
    chmod +x src/leveldb/build_detect_platform
    qmake-qt5 OPENSSL_INCLUDE_PATH="/usr/include/openssl-1.0" OPENSSL_LIB_PATH="/usr/lib/openssl-1.0" -o Makefile zoin.pro
    make
}

package() {
    install -Dm755 "$srcdir/$pkgname-master/zoin" "$pkgdir/usr/bin/zoin"
    install -Dm644 "$srcdir/$pkgname-master/src/qt/res/icons/zoin.png" "$pkgdir/usr/share/icons/zoin.png"
    install -Dm644 "${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
}
