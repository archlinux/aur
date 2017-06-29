# former Maintainer: Bjoern Franke <bjo@nord-west.org>
pkgname=jameica
pkgver=2.6.5
_pkgver=2.6
pkgrel=1
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
sha1sums=('9aa6aed3ffc50c8f01497d0332ff24d21f7189bf'
          '79be8955392bf3dfade9c0118ee4d72f081e07b8'
          '39c008050c7f90f3fde05b849cba80559207bdb5')
sha1sums_i686=('794f42ff28f38a8d133cbc2537b9d7839dae9ad0')
sha1sums_x86_64=('794f42ff28f38a8d133cbc2537b9d7839dae9ad0')
source_x86_64=("${pkgname}-${pkgver}.zip::https://www.willuhn.de/projects/jameica/releases/$_pkgver/jameica/$pkgname-linux64.zip")
source=("jameica-start-script.patch"
        "jameicaserver-start-script.patch"
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
