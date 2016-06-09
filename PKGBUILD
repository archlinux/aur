# former Maintainer: Bjoern Franke <bjo@nord-west.org>
pkgname=jameica
pkgver=2.6.4
_pkgver=2.6
pkgrel=2
pkgdesc="free runtime environment for java applications"
arch=('i686' 'x86_64')
url="https://www.willuhn.de/products/jameica/"
license=("GPL2")
depends=('java-runtime>=1.5' 'java-environment' 'swt')
makedepends=('unzip')
# See https://willuhn.de/products/jameica/download.php for checksums
if [ "$CARCH" = "i686" ]; then
    source=("${pkgname}-${pkgver}::https://www.willuhn.de/projects/jameica/releases/$_pkgver/jameica/$pkgname-linux.zip")
    sha1sums=('f659abd95ac062846f14c067fea5061bd5c4cd54')
elif [ "$CARCH" = "x86_64" ]; then
    source=("${pkgname}-${pkgver}::https://www.willuhn.de/projects/jameica/releases/$_pkgver/jameica/$pkgname-linux64.zip")
    sha1sums=('7d3d6104b75d41b0baebdf7cbbdf3fca64012e13')
fi

prepare() {
    cd "$srcdir/jameica"
    sed -i '6c cd /opt/jameica' jameica.sh jameicaserver.sh
    sed -i '10 s/lib\/swt\/linux/\/usr\/lib/' jameica.sh jameicaserver.sh
    sed -i '10 s/$@/& \&> \/dev\/null \&/' jameica.sh jameicaserver.sh
    sed -i '/^dir/d' jameica.sh jameicaserver.sh
    sed -i '/^link/d' jameica.sh jameicaserver.sh
    sed -i '/^cd "$dir"/d' jameica.sh jameicaserver.sh
}

package() {
    cd "$srcdir/jameica"
    mkdir -p "$pkgdir/opt"
    install -Dm755 jameica.sh "$pkgdir"/usr/bin/jameica
    install -Dm755 jameicaserver.sh "$pkgdir"/usr/bin/jameicaserver
    cd ..
    cp -r jameica "$pkgdir/opt/"
    rm "$pkgdir"/opt/jameica/jameica{,server}.sh
    rm "$pkgdir/opt/jameica/rcjameica"
    if [ "$CARCH" =  "x86_64" ]; then
        rm -rf "$pkgdir/opt/jameica/lib/swt/linux64"
        mkdir "$pkgdir/opt/jameica/lib/swt/linux64"
        ln -s /usr/share/java/swt.jar "$pkgdir/opt/jameica/lib/swt/linux64/swt.jar"
    else
        rm -rf "$pkgdir/opt/jameica/lib/swt/linux"
        mkdir "$pkgdir/opt/jameica/lib/swt/linux"
        ln -s /usr/share/java/swt.jar "$pkgdir/opt/jameica/lib/swt/linux/swt.jar"
    fi
    find "$pkgdir/opt/jameica" -type f -exec chmod 644 {} +
}
