# Maintainer: Malacology <guoyizhang at malacology dot com>
# Contributor: Malacology <guoyizhang at malacology dot com>

pkgname=jmodeltest
_pkgname=jmodeltest2
pkgver=2.1.10r20160303
pkgrel=7
pkgdesc="Phylogenetic Model Averaging, more models, new heuristics and high-performance computing. https://doi.org/10.1093/molbev/msn083"
arch=('x86_64')
provides=("jmodeltest")
url="https://github.com/ddarriba/jmodeltest2"
license=('GPL3')
source=("$url/archive/refs/tags/v$pkgver.zip" "jmodeltest.desktop")
sha256sums=('62415b31f218c2f194d6a4a3ba4cccbfd0fc6073e5f11bc74680e1d9b2af86c5'
            'b35c9b5041ca7b9e0e96f29a958da356b9e5149d8ee581ff7c5c83adbcd6706f')
depends=('java-runtime=11')
makedepends=('ant')
optdepends=('phyml' 'phyml-mpi')
install="$pkgname.install"
build(){
  cd $_pkgname-$pkgver
  ant
}
package() {
  install -dm 755 $pkgdir/usr/share/{applications,${pkgname}}
  cd $_pkgname-$pkgver/dist
  cp conf/jmodeltest.conf conf/jmodeltest.conf.mpi
  sed -i 's@exe/phyml@exe/phyml-mpi@g' conf/jmodeltest.conf.mpi
for dir in conf lib resources exe
do	
    mv ${srcdir}/jmodeltest2-${pkgver}/dist/$dir "${pkgdir}/usr/share/jmodeltest"
done
  mkdir -p $pkgdir/usr/share/$pkgname/exe/phyml-mpi
  ln -s /usr/bin/phyml $pkgdir/usr/share/$pkgname/exe/phyml/PhyML_3.0_linux64
  ln -s /usr/bin/phyml-mpi  $pkgdir/usr/share/$pkgname/exe/phyml-mpi/PhyML_3.0_linux64
  install -Dm 755 $srcdir/$_pkgname-$pkgver/dist/jModelTest.jar $pkgdir/usr/share/$pkgname/jModelTest.jar
  install -Dm 755 ${srcdir}/jmodeltest.desktop ${pkgdir}/usr/share/applications/jmodeltest.desktop
}
