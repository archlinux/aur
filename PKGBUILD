pkgname=privatebin
pkgver=1.3.4
pkgrel=1
pkgdesc="a minimalist, open source online pastebin where the server has zero knowledge of pasted data"
url='https://privatebin.info'
arch=("any")
license=("zlib")
depends=("php" "php-gd")
options=("emptydirs")
source=("$pkgname-$pkgver.tar.gz::https://github.com/PrivateBin/PrivateBin/archive/$pkgver.tar.gz"
        "config.patch")
md5sums=('f97640101305bddeb07d68d7a5028c5c'
         '912b477a3d0c7505111bbe17c3901f4a')

prepare(){
    cd PrivateBin-$pkgver/cfg
    patch conf.sample.php ../../config.patch
}

package(){
    cd PrivateBin-$pkgver
    mkdir -p "$pkgdir/usr/share/webapps/$pkgname"
    cp -R * "$pkgdir/usr/share/webapps/$pkgname"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    mkdir -p "$pkgdir/etc/webapps/"
    mv "$pkgdir/usr/share/webapps/$pkgname/cfg" "$pkgdir/etc/webapps/$pkgname/"
    ln -s /etc/webapps/$pkgname "$pkgdir/usr/share/webapps/$pkgname/cfg"
    # data and runtime folders
    for folder in model purgelimit trafficlimits;
    do
        mkdir -p "$pkgdir/var/lib/$pkgname/$folder"
    done
}
