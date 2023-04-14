# former Maintainer: Bjoern Franke <bjo@nord-west.org>
pkgname=jameica
pkgver=2.10.4
_pkgver=2.10
pkgrel=1
pkgdesc="free runtime environment for java applications"
#arch=('i686' 'x86_64' 'aarch64')
arch=('x86_64' 'aarch64')
url="https://www.willuhn.de/products/jameica/"
license=("GPL2")
depends=('java-runtime>=10' 'gtk3')
optdepends=('java-jce_ustrength: Required for mashup plugin used as new scripting platform for non-HBCI accounts (credit cards etc)')
makedepends=('unzip')
#source_i686=("https://www.willuhn.de/products/jameica/releases/current/jameica/jameica-linux-${pkgver}.zip"
#   "htTps://www.willuhn.de/products/jameica/releases/current/jameica/jameica-linux-${pkgver}.zip.asc")
source_x86_64=("https://www.willuhn.de/products/jameica/releases/current/jameica/jameica-linux64-${pkgver}.zip"
    "https://www.willuhn.de/products/jameica/releases/current/jameica/jameica-linux64-${pkgver}.zip.asc"
    "swt.zip::https://ftp.fau.de/eclipse/eclipse/downloads/drops4/R-4.27-202303020300/swt-4.27-gtk-linux-x86_64.zip")
source_aarch64=("https://willuhn.de/products/jameica/releases/current/jameica/jameica-linuxarm64-${pkgver}.zip"
    "https://willuhn.de/products/jameica/releases/current/jameica/jameica-linuxarm64-${pkgver}.zip.asc"
    "swt.zip::https://ftp.fau.de/eclipse/eclipse/downloads/drops4/R-4.27-202303020300/swt-4.27-gtk-linux-aarch64.zip")
validpgpkeys=("7314FBDE7D38EE5610D291B65A8ED9CFC0DB6C70") # Olaf Willuhn <info@willuhn.de>
source=("jameica-start-script.patch" "jameicaserver-start-script.patch"
        "jameica.desktop")
sha1sums=('a7b8b39822ac22d830aae03f292fda623977e526'
          '0664650342635fa5b0a9413dc8c22a65053ef234'
          '79eb66782c0e37f1538ca29ce87580aa3bb4e444')
sha1sums_x86_64=('bfaee83799f551a4c5403d59821d02d03e46a809'
                 'SKIP'
                 '81c08a9f376c26a5c3cfa6544c07597944508f69')
sha1sums_aarch64=('a0e2a097766d28cb732b74c1203ba1e892cbd8f1'
                  'SKIP'
                  '81c08a9f376c26a5c3cfa6544c07597944508f69')
#sha1sums_i686=('7afbc5bb10e43479e100536559d174fb4259b1c7'
#               'SKIP')

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
    #if [ "$CARCH" =  "x86_64" ]; then
    #    rm -rf "$pkgdir/opt/jameica/lib/swt/linux64"
    #    mkdir "$pkgdir/opt/jameica/lib/swt/linux64"
    #    ln -s /usr/share/java/swt.jar "$pkgdir/opt/jameica/lib/swt/linux64/swt.jar"
    #else
    #    rm -rf "$pkgdir/opt/jameica/lib/swt/linux"
    #    mkdir "$pkgdir/opt/jameica/lib/swt/linux"
    #    ln -s /usr/share/java/swt.jar "$pkgdir/opt/jameica/lib/swt/linux/swt.jar"
    #fi
    find "$pkgdir/opt/jameica" -type f -exec chmod 644 {} +
    install -Dm 644 "$srcdir"/jameica.desktop "$pkgdir"/usr/share/applications/jameica.desktop

    # temporary fix for SWT issues, see https://scripting-forum.derrichter.de/viewtopic.php?f=34&p=8036#p8036
    install -Dm 644 "$srcdir"/swt.jar "$pkgdir"/opt/jameica/lib/swt/linux64/swt.jar
}
