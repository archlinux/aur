# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

pkgname=openchrom
pkgver=1.4.0
pkgrel=2
pkgdesc="Visualization and Analysis of mass spectrometric and chromatographic data"
arch=("x86_64")
url="https://lablicate.com/platform/openchrom"
license=('EPL')
depends=('jdk8-openjdk' 'java-runtime' 'gtk2' 'libglvnd' 'libnet' 'libxtst' 'alsa-lib'
         'python')
makedepends=('maven' 'git')
conflicts=("$pkgname-bin")
source=("git+https://github.com/OpenChrom/openchrom.git"
        "git+https://github.com/eclipse/chemclipse.git")
sha256sums=('SKIP'
            'SKIP')

build() {
  cd "$srcdir"
  mvn -f $pkgname/$pkgname/releng/net.openchrom.aggregator/pom.xml install
}

package() {
  cd "$pkgdir"
  install -dm755 {usr/bin,opt/openchrom}
  cd "$srcdir/openchrom/openchrom/products/net.openchrom.rcp.compilation.community.product/target/products/net.openchrom.rcp.compilation.community.product.id/linux/gtk/$CARCH"
  cp -r * "$pkgdir/opt/openchrom"
  cd "$pkgdir/opt"
  sed -i "s@$srcdir@@g" openchrom/p2/org.eclipse.equinox.p2.engine/.settings/*
  chmod -R 755 openchrom
  ln -sf /opt/openchrom/openchrom ../usr/bin
}
