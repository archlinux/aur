# Maintainer: Chris <christopher.r.mullins g-mail>
# Contributor: cornholio <vigo.the.unholy.carpathian@gmail.com>
pkgname=afni
pkgver=16.1.27
pkgrel=1
pkgdesc="An open-source environment for processing and displaying functional MRI data"
arch=("i686" "x86_64")
url="http://afni.nimh.nih.gov"
license=(custom)
depends=("tcsh" "python" "gcc-libs" "gsl" "libxpm" "glu" "lesstif" "libjpeg-turbo" "libxmu" "libxft")
source=('http://afni.nimh.nih.gov/pub/dist/tgz/afni_src.tgz' 'Makefile.patch')
sha512sums=('9e43bb8184fa94ee872649a7ecb374097fb14155d948170079aeffbbc31966d0702aed9b14456a430cab4249ae585a9242b2c0ef0fddb572c8aadccdf0d1372b'
            '92737f013c50f7b84527415b9f8435d5f334a3b0169fcb2f6abdbcad2c2f09ce7709db89feaf74b624b7fd0fd216546e2e1fb2de14e29e8de6e0afd422216c6b')

prepare() {
  cd "${srcdir}"/afni_src
  cp Makefile.linux_openmp_64 Makefile
  patch -Np0 -i ../Makefile.patch
}

build() {	
  cd ${srcdir}/afni_src

  if [[ "$CARCH" == 'i686' ]]; then
    sed -i 's^-m64^-m32^g' Makefile
  fi

  MAKEFLAGS="" CPPFLAGS="" make
}

package(){
  mkdir -p $pkgdir/opt
  cp -r $srcdir/build $pkgdir/opt/afni
  find $pkgdir/opt/afni -name \*.a -delete
  find $pkgdir/opt/afni -name \*.h -delete

  mkdir -p $pkgdir/usr/share/licenses/afni
  cp $srcdir/afni_src/README.copyright $pkgdir/usr/share/licenses/afni/LICENSE
}
