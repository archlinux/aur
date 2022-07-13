# Maintainer: Deckweiss <Deckweiss75@gmail.com>

pkgname=drawj2d
pkgver=1.3.1
pkgrel=1
pkgdesc="Drawj2d creates technical line drawings using a descriptive language. It writes pdf, svg, eps, emf and dxf vector graphics or png images. It runs on all platforms that run Java. It is inspired by Asymptote but with a tcl-like syntax and 2D only."
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://sourceforge.net/projects/$pkgname"
license=('GPLv2')
depends=('java-runtime>=8')
makedepends=(
    'ant'
    'jdk11-openjdk'
)
conflicts=('drawj2d')
provides=('drawj2d')
source=("$pkgname-$pkgver.tar.gz::https://master.dl.sourceforge.net/project/$pkgname/$pkgver/Drawj2d-$pkgver.src.tar.gz")
sha256sums=('a566e0b10a6ec9e26e895ded01ec02bf8271b7136b76422b4046578164aa1824')

prepare() {
    cd "$srcdir"
    rm -rf build
    rm -rf dist
    rm -f *.tar.gz
    rm -f *.zip
}

build() {
    cd "$srcdir/Drawj2d"
    JAVACMD=/usr/lib/jvm/java-11-openjdk/bin/java ant -f build.xml

    cd "$srcdir/Drawj2d/dist"

    touch drawj2d-arch
    echo "#! /bin/bash" >> drawj2d-arch
    echo "exec /usr/bin/java -jar '/usr/share/java/drawj2d/drawj2d.jar' \"\$@\"" >> drawj2d-arch
    chmod +x drawj2d-arch
}

package() {
    cd "$srcdir/Drawj2d/dist"

    ## Move jar to /usr/share/java/drawj2d/ ##
    install -dm0755 "$pkgdir"/usr/share/java/$pkgname
    cp drawj2d.jar "$pkgdir"/usr/share/java/$pkgname/

    install -dm0755 "$pkgdir"/usr/bin
    cp drawj2d-arch "$pkgdir"/usr/bin/drawj2d
}
