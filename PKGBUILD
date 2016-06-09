# former Maintainer: Bjoern Franke <bjo@nord-west.org>
pkgname=jameica
pkgver=2.6.4
_pkgver=2.6
pkgrel=3
pkgdesc="free runtime environment for java applications"
arch=('i686' 'x86_64')
url="https://www.willuhn.de/products/jameica/"
license=("GPL2")
depends=('java-runtime>=8' 'java-environment' 'swt')
optdepends=('java-jce_ustrength: Required for mashup plugin used as new scripting platform for non-HBCI accounts (credit cards etc)')
makedepends=('unzip')
install="jameica.install"
# See https://willuhn.de/products/jameica/download.php for checksums
source_i686=("${pkgname}-${pkgver}.zip::https://www.willuhn.de/projects/jameica/releases/$_pkgver/jameica/$pkgname-linux.zip")
sha1sums_i686=('f659abd95ac062846f14c067fea5061bd5c4cd54')
source_x86_64=("${pkgname}-${pkgver}.zip::https://www.willuhn.de/projects/jameica/releases/$_pkgver/jameica/$pkgname-linux64.zip")
sha1sums_x86_64=('7d3d6104b75d41b0baebdf7cbbdf3fca64012e13')
source=("jameica-start-script.patch"
        "jameicaserver-start-script.patch"
        "jameica.install")
sha1sums=('a6a696d465929f373d6c0d469463aa28b0f4c11f'
        '05ca5cf474523db10789eea9cb483cdf12d8549b'
        '2076491611ac0bc99863fa3e5b0909ff961b7999')

prepare() {
    patch jameica/jameica.sh jameica-start-script.patch
    patch jameica/jameicaserver.sh jameicaserver-start-script.patch
    #cd "$srcdir/jameica"
    #sed -i '6c cd /opt/jameica' jameica.sh jameicaserver.sh
    #sed -i '10 s/lib\/swt\/linux/\/usr\/lib/' jameica.sh jameicaserver.sh
    #sed -i '10 s/$@/& \&> \/dev\/null \&/' jameica.sh jameicaserver.sh
    #sed -i '/^dir/d' jameica.sh jameicaserver.sh
    #sed -i '/^link/d' jameica.sh jameicaserver.sh
    #sed -i '/^cd "$dir"/d' jameica.sh jameicaserver.sh
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
