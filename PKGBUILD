# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Clint Valentine <valentine.clint@gmail.com>

pkgname=artemis
_pkgname=Artemis
pkgver=18.2.0
pkgrel=6
pkgdesc='A genome viewer and annotation tool that visualizes biological sequence features'
arch=('x86_64')
url=https://www.sanger.ac.uk/science/tools/"${pkgname}"
license=('GPL2')
depends=('java-runtime')
makedepends=('java-environment' 'maven')
source=($pkgname-$pkgver.tar.gz::https://github.com/sanger-pathogens/Artemis/archive/refs/tags/v${pkgver}.tar.gz
	act.desktop
	artemis.desktop
	bamview.desktop
	dnaplotter.desktop)
sha256sums=('842c055f5cce021adbaea4f076b2ea80335ab1e44fbaa34b2ab608df6314a18e'
            'a7dda77f6518c98af6df88ba5d725f1b89d86aca125240f63a9c6e08afeb2a24'
            'dea9a1cc47b110c4f6ebe17c1b698866082997ffd9e6008d89847ddf745a0789'
            '3ca519b00ffac02d635a62884996ad5b8c4580d8ffe8fcd427ee4edee1562f00'
            'ef584b45f9c92da15511779f20a1a1449915315066662e4c142ea4cd92dd717c')
#prepare() {
#scripts=('act' 'art' 'bamview' 'dnaplotter')
#  cd $srcdir/$_pkgname-$pkgver
#  patch -N -i $srcdir/fix_bin.patch
#}
build() {
  cd $srcdir/$_pkgname-$pkgver
  mvn validate
  mvn package
}
package() {
bina=('act' 'art' 'bamview' 'dnaplotter')
scripts=('act' 'artemis' 'bamview' 'dnaplotter')

  # desktop
  cd $srcdir/
  for des in ${scripts[@]}
do
  install -Dm 755 $des.desktop $pkgdir/usr/share/applications/$des.desktop
done

  # bin
  cd $srcdir/$_pkgname-$pkgver
  for bin in ${bina[@]}
do
  install -Dm 775 $bin $pkgdir/usr/share/$pkgname/$bin
done

  # jar
  cd $srcdir/$_pkgname-$pkgver/target/jars
  for jar in $(ls *.jar)
do
  install -Dm 755 $jar $pkgdir/usr/share/$pkgname/target/jars/$jar
done

  # icons
  cd $srcdir/$_pkgname-$pkgver/target/classes/images
  for icn in ${scripts[@]}
do
  mv ${icn}_icon.png ${icn}.png
  install -Dm 644 ${icn}.png $pkgdir/usr/share/pixmaps/${icn}.png
done

  # link bin
  cd $srcdir/$_pkgname-$pkgver
  mkdir -p $pkgdir/usr/bin
  for bin in ${bina[@]}
do
  ln -s /usr/share/$pkgname/$bin $pkgdir/usr/bin/$bin
done

}
