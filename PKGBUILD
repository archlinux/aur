# Maintainer: PumpkinCheshire <me at pumpkincheshire dot top>

pkgname=pilon
pkgver=1.24
pkgrel=1
pkgdesc="Pilon is an automated genome assembly improvement and variant detection tool."
arch=('any')
url="https://github.com/broadinstitute/pilon"
license=('GPL2')
depends=('java-runtime')
makedepends=('sbt' 'sh')
provides=("pilon")
conflicts=("pilon-bin" "pilon-git")
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('f715aa70f29d00a470cdafefcae857627fd9e857466f2cebd1f842714f09b09022871db9ea6c75dc7e7b25fc4b4a5838dad3349740c3e5d330e402bd6c1410c1')

build() {
    cd $srcdir/$pkgname-$pkgver/

    sbt $* assembly

}

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver/target/scala-2.13/$pkgname-assembly-$pkgver.jar" -t "$pkgdir/usr/share/java/$pkgname/"

    mkdir -p $pkgdir/usr/bin/
    echo "#!/bin/sh" >>$pkgdir/usr/bin/pilon
    echo "exec /usr/bin/java -jar '/usr/share/java/$pkgname/$pkgname-assembly-$pkgver.jar' \"\$@\"" >>$pkgdir/usr/bin/pilon

    chmod -R 755 $pkgdir/usr/bin/

    install -Dm644 "${srcdir}/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
