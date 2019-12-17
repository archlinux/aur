# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

pkgname=openchrom
pkgver=1.4.0
_pkgver=GSTL-1.1.0
pkgrel=1
pkgdesc="Visualization and Analysis of mass spectrometric and chromatographic data"
arch=("x86_64")
url="https://lablicate.com/platform/openchrom"
license=('EPL')
depends=('jdk8-openjdk' 'java-runtime' 'gtk2' 'libglvnd'
         'libnet' 'libxtst' 'alsa-lib' 'python')
makedepends=('maven')
conflicts=("$pkgname-git" "$pkgname-bin")
source=("$pkgname-$pkgver.tar.gz::https://github.com/OpenChrom/openchrom/archive/$_pkgver.tar.gz"
        "https://github.com/eclipse/chemclipse/archive/$_pkgver.tar.gz")
sha256sums=('48569ffc115205e3ad23a87018cdb318ebb2feaab538abd1f6463c28e35c342e'
            '8bf9eed1a3eb617112e7d34b994280d633ac8bee4929f4f8e727e13f83fba03d')

prepare() {
    cd $srcdir
    mv $pkgname-$_pkgver $pkgname
    mv chemclipse-$_pkgver chemclipse
}

build() {
    cd $srcdir
    mvn -f $pkgname/$pkgname/releng/net.openchrom.aggregator/pom.xml install
}

package() {
    install -dm755 $pkgdir/{usr/bin,opt/openchrom}
    cd $srcdir/openchrom/openchrom/products/net.openchrom.rcp.compilation.community.product/target/products/net.openchrom.rcp.compilation.community.product.id/linux/gtk/x86_64/
    cp -r * $pkgdir/opt/openchrom
    sed -i "s@$srcdir@@g" $pkgdir/opt/openchrom/p2/org.eclipse.equinox.p2.engine/.settings/*
    chmod -R 755 $pkgdir/opt/openchrom
    ln -sf $pkgdir/opt/openchrom/openchrom $pkgdir/usr/bin
}
