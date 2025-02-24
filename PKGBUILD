# Maintainer: Luis Sarmiento <Luis.Sarmiento-ala-nuclear.lu.se>
# Co-Maintainer: effeffe - Filippo Falezza <filippo dot falezza at outlook dot com>

pkgname=upak
pkgver=10.6.8 # <-- current source doesn't have a version. We keep the last known one
pkgrel=14
pkgdesc="HRIBF Data Acquisition and analysis."
url="ftp://ftp.phy.ornl.gov/pub/upak/README.html"
arch=('x86_64')
license=('unknown')
depends=('libx11' 'tcsh' 'bash')
makedepends=('gcc-fortran>=4.2')
options=(staticlibs emptydirs)
source=(
  "upak-2021.tar.bz2::https://orruba.org/?mdocs-file=1159"
  #"https://ftp.phy.ornl.gov/fauxtp/${pkgname}/${pkgname}-src.tgz"
  "upak.install")
md5sums=(
  '75b58c32a5e339dcba36c2ca3039bff6'
  '28ee91c3b9ad3ac1be306fb8c0eb1f35')

install="${pkgname}.install"

prepare(){
  cd ${srcdir}/${pkgname}
  #replace /usr/hhirf with /opt/hhirf
  find . -type f -exec sed -i 's|/usr/hhirf|/opt/hhirf|g' {} +
  find . -type f -exec sed -i 's|/usr/local/hhirf|/opt/hhirf|g' {} +
}

package(){
  cd ${srcdir}/${pkgname}
  make clean
  make -j1 INSTALLDIR="${pkgdir}/opt/hhirf" all  # <-- this already goes to ${pkgdir} therefore must be package() not build()

  cd ${srcdir}/${pkgname}
  install -m644 Dreadme/README-Apr07 ${pkgdir}/opt/hhirf/doc
  install -m644 Dreadme/readme.{tex,doc} ${pkgdir}/opt/hhirf/doc
  install -m644 Dreadme/dvd.{tex,doc} ${pkgdir}/opt/hhirf/doc

  ## This is for compatibility while we work on patching most files of the program
  #ln -s /opt/hhirf ${pkgdir}/usr/local/hhirf
  #ln -s /opt/hhirf ${pkgdir}/usr/hhirf

  cd $pkgdir/opt/hhirf
  for file in $(ls doc/*.doc);do
    file=$(basename -s .doc $file)
    ./txx doc/$file x
    ./txxps $file
    rm $file.txx
    mv $file.ps doc/
  done
}
