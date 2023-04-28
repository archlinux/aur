# Maintainer: Malacology <guoyizhang at malacology dot net>
# Contributor: Malacology <guoyizhang at malacology dot net>
basename=beast
pkgname=('beast' 'beastgen' 'coalgen' 'phylogeography' )
pkgver=1.10.4
pkgrel=0
arch=('x86_64')
url="http://beast.community/"
license=('LGPL')
source=("https://github.com/beast-dev/beast-mcmc/archive/refs/tags/v${pkgver//__/-}.tar.gz"
	"$basename.patch::https://patch-diff.githubusercontent.com/raw/beast-dev/beast-mcmc/pull/1149.patch")
sha256sums=('6e28e2df680364867e088acd181877a5d6a1d664f70abc6eccc2ce3a34f3c54a'
            '2f65ebb8c45feed0b2969276c7caae147b83f4f1dd4fc5e1d705aada2c4163e1')
depends=('java-runtime=8')
makedepends=('java-environment=8' 'ant' 'cmake' 'beagle-lib' 'gendesk')

prepare(){
  cd $srcdir/$basename-mcmc-${pkgver//__/-}
  patch -p1 < $srcdir/$basename.patch
}

build() {
  cd $srcdir/$basename-mcmc-${pkgver//__/-}
  ant linux
  java -jar -Djava.library.path=/usr/lib build/dist/beast.jar -beagle_info
  cp -r build/dist dist_beast
  ant -buildfile build_beastgen.xml package
  cp -r dist dist_beastgen
  ant -buildfile build_bss.xml linux
  cp -r dist dist_pibuss
  ant -buildfile build_coalsim.xml dist
  cp -r dist dist_coalgen
  ant -buildfile build_phylogeography.xml package
  cp -r dist dist_phylogeography
  ant -buildfile build_tempest.xml dist
  cp -r dist dist_tempest
}

package_beast() {
  pkgdesc="Bayesian Evolutionary Analysis Sampling Trees. https://doi.org/10.1186/1471-2148-7-214"
  optdepends=('beagle-lib')

  # install jar
  cd $srcdir/$basename-mcmc-${pkgver//__/-}
  cd dist_beast
for jar in $(ls *.jar)
do
  install -Dm 755 $jar $pkgdir/usr/share/$pkgname/$jar
done

  # install bin, desktop
  cd $srcdir/$basename-mcmc-${pkgver//__/-}
  cd release/Linux/scripts
  sed -i "s@/usr/local/lib@/usr/lib@g" *
  sed -i "s@\$BEAST/lib@/usr/share/beast@g" *
for bin in $(ls)
do
  install -Dm 755 $bin $pkgdir/usr/bin/$pkgname-$bin
  gendesk --pkgname "$bin" --pkgdesc "$pkgdesc" --exec="$pkgname-$bin" --icon="/usr/share/pixmaps/$bin.png"
  install -Dm 755 $bin.desktop $pkgdir/usr/share/applications/$basename-$bin.desktop
done

  # install icons
  cd $srcdir/$basename-mcmc-${pkgver//__/-}
  cd release/common/icons
for icon in $(ls *.png)
do
  install -Dm 644 $icon $pkgdir/usr/share/pixmaps/${icon,,}
done

  # ln icons
for png in loganalyser logcombiner treeannotator
do
  ln -s /usr/share/pixmaps/utility.png $pkgdir/usr/share/pixmaps/$png.png
done 
}

package_beastgen(){
  pkgdesc="Bayesian Evolutionary Analysis Sampling Trees. https://doi.org/10.1186/1471-2148-7-214"
  optdepends=('beagle-lib')
  
  # install jar
  cd $srcdir/$basename-mcmc-${pkgver//__/-}
  cd dist_beastgen
  install -Dm 755 $pkgname.jar $pkgdir/usr/share/$pkgname/$pkgname.jar

  # install bin
  cd $srcdir/$basename-mcmc-${pkgver//__/-}
  cd release_beastgen/common/bin/
  sed -i "s@\$BEASTGEN/lib@/usr/share/beastgen@g" beastgen
  install -Dm 755 $pkgname $pkgdir/usr/bin/$pkgname
}

#package_pibuss(){
#  pkgdesc="a BEAST/BEAGLE utility for sequence simulation, which provides an easy to use interface that allows flexible and extensible phylogenetic data fabrication. https://doi.org/10.1186/1471-2105-15-133"
#  optdepends=('beagle-lib')
#  # install jar
#  cd $srcdir/$basename-mcmc-${pkgver//__/-}
#  cd dist_pibuss
#  install -Dm 755 buss.jar $pkgdir/usr/share/$pkgname/buss.jar
#
#  # install bin
#  cd $srcdir/$basename-mcmc-${pkgver//__/-}
#  cd release_pibuss/Linux/scripts/
#  sed -i "s@/usr/local/lib@/usr/lib@g" pibuss
#  sed -i "s@\$PIBUSS/lib@/usr/share/pibuss@g" pibuss
#  install -Dm 755 $pkgname $pkgdir/usr/bin/$pkgname
#
#  # install icons
#  cd $srcdir/$basename-mcmc-${pkgver//__/-}
#  cd release_pibuss/Linux/icons
#  install -Dm 644 $pkgname.png  $pkgdir/usr/share/pixmaps/$pkgname.png
#
#  # install pibuss.desktop
#  gendesk --pkgname "$pkgname" --pkgdesc "$pkgdesc" --exec="$pkgname" --icon="/usr/share/pixmaps/$pkgname.png"
#  install -Dm 755 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
#}

package_coalgen(){
  pkgdesc="BEAST Coalescent Tree Simulator https://doi.org/10.1186/1471-2148-7-214"
  optdepends=('beagle-lib')
  
  # install jar
  cd $srcdir/$basename-mcmc-${pkgver//__/-}
  cd dist_coalgen
  install -Dm 755 $pkgname.jar $pkgdir/usr/share/$pkgname/$pkgname.jar

  # install bin
  echo "COALGEN_LIB=/usr/share/coalgen" >> $pkgname
  echo "java -Xms64m -Xmx1024m -Djava.library.path=\"\$COALGEN_LIB:/usr/lib\" -jar \$COALGEN_LIB/coalgen.jar \$*" >> $pkgname
  chmod +x $pkgname
  install -Dm 755 $pkgname $pkgdir/usr/bin/$pkgname

  # icon
  cd $srcdir/$basename-mcmc-${pkgver//__/-}
  install -Dm 644 src/dr/app/coalgen/images/CoalGen.png $pkgdir/usr/share/pixmaps/$pkgname.png

  # desktop
  gendesk --pkgname "$pkgname" --pkgdesc "$pkgdesc" --exec="$pkgname" --icon="/usr/share/pixmaps/$pkgname.png"
  install -Dm 755 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}


package_phylogeography(){
  pkgdesc="BEAST PhyloGeography https://doi.org/10.1186/1471-2148-7-214"
  optdepends=('beagle-lib')

  # install jar
  cd $srcdir/$basename-mcmc-${pkgver//__/-}
  cd dist_$pkgname
  install -Dm 755 $pkgname.jar $pkgdir/usr/share/$pkgname/$pkgname.jar

  # install bin
  cd $srcdir/$basename-mcmc-${pkgver//__/-}
  cd release_phylogeography/common/bin/
for bin in continuous_tree_to_kml discrete_rate_prior_generator discrete_tree_to_kml rate_indicator_bf timeslicer
do
  sed -i "s@\$PHYLOGEOGRAPHY/lib@/usr/share/phylogeography@g" $bin
  install -Dm 755 $bin $pkgdir/usr/bin/$bin
done

}

#package_tempest(){
#  pkgdesc="a tool for investigating the temporal signal and 'clocklikeness' of molecular phylogenies. https://doi.org/10.1093/ve/vew007"
#
#  # install jar
#  cd $srcdir/$basename-mcmc-${pkgver//__/-}
#  cd dist_$pkgname
#  install -Dm 755 $pkgname.jar $pkgdir/usr/share/$pkgname/$pkgname.jar
#
#  # install bin
#  echo "TEMPEST_LIB=/usr/share/tempest" >> $pkgname
#  echo "java -Xms64m -Xmx1024m -Djava.library.path=\"\$TEMPEST_LIB:/usr/lib\" -jar \$TEMPEST_LIB/tempest.jar \$*" >> $pkgname
#  chmod +x $pkgname
#  install -Dm 755 $pkgname $pkgdir/usr/bin/$pkgname
#
#  # install ico
#  cd $srcdir/$basename-mcmc-${pkgver//__/-}
#  cd release_$pkgname/Windows/icons
#  install -Dm 644 TempEst.ico  $pkgdir/usr/share/pixmaps/$pkgname.ico
#
#  # desktop
#  gendesk --pkgname "$pkgname" --pkgdesc "$pkgdesc" --exec="$pkgname" --icon="/usr/share/pixmaps/$pkgname.ico"
#  install -Dm 755 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
#}
