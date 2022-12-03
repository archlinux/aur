# Maintainer: Malacology <guoyizhang at malacology dot net>
# Contributor: Malacology <guoyizhang at malacology dot net>

pkgname=beast
pkgver=sars__cov__2__origins
pkgrel=1
pkgdesc="Bayesian Evolutionary Analysis Sampling Trees. https://doi.org/10.1186/1471-2148-7-214"
arch=('x86_64')
url="http://beast.community/"
license=('LGPL')
source=("https://github.com/beast-dev/beast-mcmc/archive/refs/tags/${pkgver//__/-}.tar.gz"
	"beast.desktop"
	"beast-beauti.desktop"
	"beast-loganalyser.desktop"
	"beast-logcombiner.desktop"
	"beast-treeannotator.desktop"
	"beast-treestat.desktop"
	"fix_bin.patch")
sha256sums=('fab8750313b66844f4dd8dcacfa55913f30bb877bded87057ba347d38cc9dc75'
            'bd6f29c93a6ff8145de5af3137f976bfd84c4441bb3ee32778af4b0bcbcdb18b'
            '1b84708063fd2ac39b8ff234c75d0fba2fc1737b82c926d9844db2694a21a91c'
            '98b7b7cc4c2b744031b27d12bf737a6cb37a58e2e127539b53d49d4b7ada1524'
            '3f25d0877ee9a4582e4bf7d8e7b964cbb2a5e5b642fc59097f5af18268b554ea'
            'e9ff41cab265727bf781ad97cc014071a1d9b77890a44bc6005489a709ce542e'
            '385c9078b0cac257b94a115ed000f71b9eb8b1d6c7edc1ba3e75a9724e11df05'
            '086b899c6f4bfa43d4af61d497c0265d087e919de5723faa6b3e58ae48fb6813')
depends=('java-runtime=8')
makedepends=('java-environment=8' 'ant' 'cmake' 'beagle-lib')
optdepends=('beagle-lib')
build() {
  cd $srcdir/$pkgname-mcmc-${pkgver//__/-}
  ant dist
  java -jar -Djava.library.path=/usr/lib build/dist/beast.jar -beagle_info
}

package() {
  #install desktop
  cd $srcdir/
for des in $(ls *.desktop)
do
  install -Dm 755 $des $pkgdir/usr/share/applications/$des
done

  # install jar
  cd $srcdir/$pkgname-mcmc-${pkgver//__/-}
  cd build/dist
for jar in $(ls *.jar)
do
  install -Dm 755 $jar $pkgdir/usr/share/$pkgname/$jar
done

  # install bin
  cd $srcdir/$pkgname-mcmc-${pkgver//__/-}
  cd release/Linux/scripts
  patch -N -i $srcdir/fix_bin.patch
for bin in $(ls)
do
  install -Dm 755 $bin $pkgdir/usr/bin/$bin
done

  # install icons
  cd $srcdir/$pkgname-mcmc-${pkgver//__/-}
  cd release/common/icons
for icon in $(ls *.png)
do
  install -Dm 644 $icon $pkgdir/usr/share/pixmaps/$icon
done
}
