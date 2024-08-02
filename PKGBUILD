# Maintainer: Malacology <guoyizhang at malacology dot net>
# Contributor: Malacology <guoyizhang at malacology dot net>

pkgname=open-delta
pkgver=1.03_java8
pkgrel=2
epoch=1
pkgdesc="DEscription Language of TAxonomy"
arch=('x86_64')
url="https://github.com/AtlasOfLivingAustralia/open-delta"
license=('MPL-1.1')
source=("$pkgname-$pkgver::${url}/archive/refs/tags/v${pkgver//_/-}.tar.gz")
sha256sums=('9bb7a966dca4bb63cecc6fb867bcd02ea40100d3bba5da1ffe74aab7bc77202a')
depends=( 'java-runtime=8')
makedepends=('java-environment=8' 'maven' 'gendesk' 'icedtea-web')
build(){
  cd $srcdir/$pkgname-${pkgver//_/-}
  mvn package -Dmaven.test.skip=true
  gendesk --pkgname "$pkgname" --pkgdesc "$pkgdesc" --exec="$pkgname" --icon="/usr/share/$pkgname/icons/Delta_blue.png"
  echo "java -jar /usr/share/$pkgname/delta-editor-${pkgver: 0: 4}-SNAPSHOT.jar" > $pkgname
  chmod +x $pkgname 
}
#installer/resources/Delta_*.png {blue,green,multi,outline,red,installer.ico}
package() {
    install -dm755 "$pkgdir"/usr/{bin,share/{${pkgname}/icons,applications}} 
    chmod -R 755  ${srcdir}/${pkgname}-${pkgver//_/-}/target/installer-jars/*
    mv ${srcdir}/${pkgname}-${pkgver//_/-}/target/installer-jars/* ${pkgdir}/usr/share/${pkgname}
    mv ${srcdir}/${pkgname}-${pkgver//_/-}/installer/resources/Delta_*.png  ${pkgdir}/usr/share/${pkgname}/icons/
    install -m 755 ${srcdir}/${pkgname}-${pkgver//_/-}/$pkgname $pkgdir/usr/bin/$pkgname
    install -m 755 ${srcdir}/${pkgname}-${pkgver//_/-}/$pkgname.desktop ${pkgdir}/usr/share/applications/$pkgname.desktop
}
