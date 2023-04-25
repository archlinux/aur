# Maintainer: Malacology <guoyizhang at malacology dot net>
# Contributor: Malacology <guoyizhang at malacology dot net>

pkgname=open-delta
pkgver=1.0.3_beta
pkgrel=1
epoch=1
pkgdesc="DEscription Language of TAxonomy"
arch=('x86_64')
url="https://github.com/AtlasOfLivingAustralia/open-delta"
license=('unknown')
source=("$pkgname-$pkgver::${url}/archive/refs/tags/${pkgver//_/-}.tar.gz"
	"$pkgname.patch::https://patch-diff.githubusercontent.com/raw/AtlasOfLivingAustralia/open-delta/pull/270.patch")
sha256sums=('794915ca4beb42298ff5d42031b015a6ee2cdb8746a697a24a552abbe5103e0c'
            'c5b3974cb7fe1abd54457ff95558d072aa5e6d646c22c7b73843bdf113149e41')
depends=( 'java-runtime=8')
makedepends=('java-environment=8' 'maven' 'gendesk' 'icedtea-web')
prepare(){
  cd $srcdir/$pkgname-${pkgver//_/-}
  patch -p1 < $srcdir/$pkgname.patch
}
build(){
  cd $srcdir/$pkgname-${pkgver//_/-}
  mvn package -Dmaven.test.skip=true
  gendesk --pkgname "$pkgname" --pkgdesc "$pkgdesc" --exec="$pkgname" --icon="/usr/share/$pkgname/icons/Delta_blue.png"
  echo "java -jar /usr/share/$pkgname/delta-editor-${pkgver: 0: 5}-SNAPSHOT.jar" > $pkgname
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
