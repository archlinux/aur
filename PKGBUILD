# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=homer
pkgver=4.10
pkgrel=1
pkgdesc="Hypergeometric Optimization of Motif EnRichment"
url="http://homer.salk.edu/"
arch=('i686' 'x86_64')
license=('GPLv3')
optdepends=('ucsc-kent-genome-tools: for the blat tool, required for removing redundant sequences during motif finding'
  'ghostscript: required for making motif logos')
depends=('perl' 'weblogo2' 'wget')
source=("http://homer.salk.edu/homer/data/software/homer.v${pkgver}.zip" "homer.sh")
md5sums=('25af6351d2b114237f35abaffd17b521'
         '81a149ed531dcca7f0096901fd88ddeb')
install=homer.install

prepare(){
  cd ${srcdir}/cpp
  make clean
}

build(){
  #cd ${srcdir}
  #perl configureHomer.pl -install homer

  cd ${srcdir}/cpp
  make # this actually also copies the exes to bin/ then clean can't clean them
  make clean
}

package() {
  # just put everything into opt
  mkdir -p "${pkgdir}/opt/${pkgname}"
  cp -a ${srcdir}/* "${pkgdir}/opt/${pkgname}/."

  # link the main perl script
  mkdir -p ${pkgdir}/usr/bin
  chmod 755 "${pkgdir}/opt/${pkgname}/configureHomer.pl"
  ln -s /opt/${pkgname}/configureHomer.pl ${pkgdir}/usr/bin/.

  # install profile file
  install -m755 -D "${srcdir}/homer.sh" -t "${pkgdir}/etc/profile.d"
  
  # install license file
  install -m644 -D "${srcdir}/COPYING" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:#

