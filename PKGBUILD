# Maintainer: Stunts <f DOT pinamartins AT gmail DOT com>
# Contributor: bmpvieira <mail AT bmpvieira DOT com>
pkgname=structure
pkgver=2.3.4
pkgrel=3
pkgdesc="Program for using multi-locus genotype data to investigate population structure."
arch=('i686' 'x86_64')
url="http://pritch.bsd.uchicago.edu/structure.html"
license=('GPL')
depends=('java-environment')

source=(http://pritchardlab.stanford.edu/structure_software/release_versions/v${pkgver}/structure_kernel_source.tar.gz
        http://pritchardlab.stanford.edu/structure_software/release_versions/v${pkgver}/structure_frontend_source.tar.gz
        http://pritchardlab.stanford.edu/structure_software/release_versions/v${pkgver}/html/ran.c.patch)
md5sums=('4e0591678cdbfe79347d272b5dceeda1'
         'f4b257767562ba732c7a02414fee1865'
         'a7c26d216eacb2a10f9ff0fb7e0c31a6')

build() {
  #Patch for creating random seed in an RW location:
  patch ${srcdir}/structure_kernel_src/ran.c < ran.c.patch
  #build core program
  cd ${srcdir}/structure_kernel_src
  make

  #build frontend
  cd ${srcdir}/structure_frontend_src
  javac -cp class/Structure.jar RunStructure.java
}

package() {
  #create necessary dirs
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p ${pkgdir}/opt/structure/bin

  #copy frontend files
  cp -r ${srcdir}/structure_frontend_src/{class,images,library} ${pkgdir}/opt/structure/
  
  #copy core program file
  cp ${srcdir}/structure_kernel_src/structure ${pkgdir}/opt/structure/bin

  cd "$pkgdir/opt/structure"

  #create launcher script
  echo '#!/bin/sh' > structure
  echo 'cd /opt/structure/' >> structure
  echo 'java -cp /opt/structure/class/Structure.jar RunStructure' >> structure

  chmod +x ./structure
  ln -s "/opt/structure/structure" "$pkgdir/usr/bin/structure" 
}
# vim:set ts=2 sw=2 et:
