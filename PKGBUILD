# Maintainer: Malacology <guoyizhang at malacology dot net>
# Contributor: Malacology <guoyizhang at malacology dot net>

pkgname=beast
pkgver=sars__cov__2__origins
pkgrel=2
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
            'fa9841f5005be6d743ad278b037de0eb329c642de62e4996cc1df31272ffa185'
            'e3897ee92348b3e48010af739fcbf7fbb38bcc2c18e1ceb30cd147b3c7067b2d'
            'dcf674ebe5f1b7b13e746441f7a28a9b0fa86c03f3bef27833c532f323cb6644'
            '75842d174f246c38dc4600357ef8b41f67e5f12cbd7dba779d224f99b531cb1d'
            '6e63a619a6fb3101606a85dbc352d579e343d167cf79be67ccf31ed1544d5fd2'
            '3a21774077658117f36bd289901ec1d560a66bbe435ba4ddbc1980c558fa7362'
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
