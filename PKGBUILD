# Contributor: Sauliusl <luksaulius at gmail>
pkgname=phantompeakqualtools
pkgver=1.1
pkgrel=2
pkgdesc="Computes quick but highly informative enrichment and quality measures for ChIP-seq/DNase-seq/FAIRE-seq/MNase-seq data. It can also be used to obtain robust estimates of the predominant fragment length or characteristic tag shift values in these assays."
arch=('i686' 'x86_64')
url="https://code.google.com/p/phantompeakqualtools/"
license=('MIT')
depends=('r' 'r-cran-catools' 'r-snow' 'samtools' 'boost' 'boost-libs')
source=("https://phantompeakqualtools.googlecode.com/files/ccQualityControl.v.${pkgver}.tar.gz")
md5sums=('66cfe40711edb914cd0fd69778a54e37')

package() {

 cd $srcdir/phantompeakqualtools
 install -d $pkgdir/usr/lib/R/library

 tar -xzf spp_1.10.1.tar.gz
 # Below is requried for this to work with gcc6
 sed -i "s/PKG_CXXFLAGS=/PKG_CXXFLAGS=-std=gnu++98 /g" spp/src/Makevars.in

 R CMD INSTALL -l $pkgdir/usr/lib/R/library spp

 install -d $pkgdir/usr/share/${pkgname}/
 install -Dm0644 run_spp.R $pkgdir/usr/share/${pkgname}/
 install -Dm0644 run_spp_nodups.R $pkgdir/usr/share/${pkgname}/

 echo "#!/bin/bash" > run_spp.sh
 echo 'Rscript /usr/share/phantompeakqualtools/run_spp.R "$@"' >> run_spp.sh

 echo "#!/bin/bash" > run_spp_nodups.sh
 echo 'Rscript /usr/share/phantompeakqualtools/run_spp_nodups.R "$@"' >> run_spp_nodups.sh

 install -d $pkgdir/usr/bin/
 install -Dm0755 run_spp.sh $pkgdir/usr/bin/run_spp
 install -Dm0755 run_spp_nodups.sh $pkgdir/usr/bin/run_spp_nodups


}
