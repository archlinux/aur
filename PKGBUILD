# former Maintainer: Bjoern Franke <bjo@nord-west.org>
pkgname=jameica
pkgver=2.8.6
_pkgver=2.8
pkgrel=4
pkgdesc="free runtime environment for java applications"
arch=('i686' 'x86_64')
url="https://www.willuhn.de/products/jameica/"
license=("GPL2")
depends=('java-runtime>=10' 'java-environment' 'swt' 'gtk3')
optdepends=('java-jce_ustrength: Required for mashup plugin used as new scripting platform for non-HBCI accounts (credit cards etc)')
makedepends=('unzip')
install="jameica.install"
source_i686=("https://www.willuhn.de/products/jameica/releases/current/jameica/jameica-linux-${pkgver}.zip"
"https://www.willuhn.de/products/jameica/releases/current/jameica/jameica-linux-${pkgver}.zip.asc")
validpgpkeys=("7314FBDE7D38EE5610D291B65A8ED9CFC0DB6C70") # Olaf Willuhn <info@willuhn.de>
sha1sums=('7c1cf5a2584b18bc3682475faeb1a045e3cd7328'
          '0664650342635fa5b0a9413dc8c22a65053ef234'
          '39c008050c7f90f3fde05b849cba80559207bdb5')
sha1sums_i686=('f93f97417ba475c9b5e60047cc9bfb53bc190afc'
               'SKIP')
sha1sums_x86_64=('8f17fa742b236f26420bbf1819bf12a3e679527c'
                 'SKIP')
source_x86_64=("https://www.willuhn.de/products/jameica/releases/current/jameica/jameica-linux64-${pkgver}.zip"
"https://www.willuhn.de/products/jameica/releases/current/jameica/jameica-linux64-${pkgver}.zip.asc")
source=("jameica-start-script.patch" "jameicaserver-start-script.patch"
        "jameica.install")

prepare() {
    patch jameica/jameica.sh jameica-start-script.patch
    patch jameica/jameicaserver.sh jameicaserver-start-script.patch
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
