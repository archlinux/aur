# Contributor: <maxmusterm@gmail.com> 

pkgname=cuda-z
_relver=251
pkgver=0.10
pkgrel=1
pkgdesc="CUDA Information Utility."
url="http://cuda-z.sourceforge.net/"
license=("GPLv2")
arch=("x86_64")
depends=("cuda-toolkit" "qt4")
source=("http://downloads.sourceforge.net/cuda-z/cuda-z-${pkgver}.zip")
sha256sums=('c8033016a79d437f93a9fbce50da24fa931fe4959998e196f4070461e186eff1')

prepare(){
  cd ${srcdir}/${pkgname}-${pkgver}/

  # Support for sm_10 dropped in CUDA 6.5
  sed -i 's/+= sm_10/+=/g' cuda-z.pro

  # Support for sm_11/sm_12/sm_13 dropped in CUDA 7
  sed -i 's/+= sm_11/+=/g' cuda-z.pro
  sed -i 's/+= sm_12/+=/g' cuda-z.pro
  sed -i 's/+= sm_13/+=/g' cuda-z.pro

  sed -i 's/\/usr\/local\/cuda/\/opt\/cuda/g' cuda-z.pro
  sed -i 's/\/usr\/local\/cuda/\/opt\/cuda/g' cuda.pri
  sed -i 's/\/usr\/local\/cuda/\/opt\/cuda/g' ./bld/bin/pkg-linux.sh
  sed -i 's/\/opt\/cuda-toolkit\/lib/\/opt\/cuda\/lib\
    unix:LIBPATH += \/opt\/cuda-toolkit\/lib64/' cuda-z.pro
}

build(){
  cd ${srcdir}/${pkgname}-${pkgver}/

  qmake

  # Avoid bug with revision number
  sed -i "s|'svnversion -c -n '.\$projectroot|'echo ${_relver}'|g" ./bld/bin/make_build_svn.pl

  PATH=$PATH:/opt/cuda/bin make pkg
}

package(){
  cd ${srcdir}
  mkdir -p ${pkgdir}/usr/bin/
  install -m755 ${srcdir}/${pkgname}-${pkgver}/bin/cuda-z ${pkgdir}/usr/bin/
}
