# Maintainer: Luis Sarmiento <Luis.Sarmiento-ala-nuclear.lu.se>
# Co-Maintainer: effeffe - Filippo Falezza <filippo dot falezza at outlook dot com>

pkgname=upak
pkgver=10.6.8 # <-- current source doesn't have a version. We keep the last known one
pkgrel=11
pkgdesc="HRIBF Data Acquisition and analysis."
url="ftp://ftp.phy.ornl.gov/pub/upak/README.html"
arch=('x86_64')
license=('unknown')
depends=('libx11' 'tcsh' 'bash')
makedepends=('gcc-fortran>=4.2')
options=(staticlibs emptydirs)
source=(
  "https://ftp.phy.ornl.gov/fauxtp/${pkgname}/${pkgname}-src.tgz"
  "upak.install")
md5sums=(
  'e41040fe104b97be91697b94a78bcdee'
  '8f74428b994ee5000ece375945b65171')

install="${pkgname}.install"

package(){
  cd ${srcdir}
  make clean
  make -j1 INSTALLDIR="${pkgdir}/usr/local/hhirf" all  # <-- this already goes to ${pkgdir} therefore must be package() not build()

  cd ${srcdir}
  install -m644 Dreadme/README-Apr07     $pkgdir/usr/local/hhirf/doc
  install -m644 Dreadme/readme.{tex,doc} $pkgdir/usr/local/hhirf/doc
  install -m644 Dreadme/dvd.{tex,doc}    $pkgdir/usr/local/hhirf/doc
  ln -s $pkgdir/usr/local/hhirf $pkgdir/usr/hhirf

  cd $pkgdir/usr/local/hhirf
  for file in $(ls doc/*.doc);do
    file=$(basename -s .doc $file)
    ./txx doc/$file x
    ./txxps $file
    rm $file.txx
    mv $file.ps doc/
  done

}
