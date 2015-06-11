# Maintainer: Artem Vorotnikov <artem@vorotnikov.me>

_name=cuda-z
pkgname=cuda-z-svn
pkgver=245
pkgrel=1
pkgdesc="CUDA Information Utility."
url="http://cuda-z.sourceforge.net/"
license="GPL3"
arch=("x86_64")
makedepends=("svn")
depends=("cuda" "qt5-base")
source=("svn://svn.code.sf.net/p/cuda-z/code/trunk")
sha512sums=('SKIP')

_svntrunk="http://$_name.svn.sourceforge.net/svnroot/$_name/trunk"
_svnmod=$_name

pkgver(){
  _svninfo="$(svn info "${_svntrunk}")"
  echo "${_svninfo}" | grep -E '^Last Changed Rev' | awk -F':' '{print $2}' | tr -d '[:space:]'
}

build(){
  cd ${srcdir}/trunk/

  sed -i 's/+= sm_10/+=/g' cuda-z.pro
  sed -i 's/+= sm_11/+=/g' cuda-z.pro
  sed -i 's/+= sm_13/+=/g' cuda-z.pro

  sed -i 's/\/usr\/local\/cuda/\/opt\/cuda/g' cuda-z.pro
  sed -i 's/\/usr\/local\/cuda/\/opt\/cuda/g' cuda.pri
  sed -i 's/\/usr\/local\/cuda/\/opt\/cuda/g' ./bld/bin/pkg-linux.sh
  sed -i 's/\/opt\/cuda-toolkit\/lib/\/opt\/cuda\/lib\
    unix:LIBPATH += \/opt\/cuda\/lib64/' cuda-z.pro

  qmake && make || return 1
}

package(){
  cd ${srcdir}
  mkdir -p ${pkgdir}/usr/bin/
  install -m755 ${srcdir}/trunk/bin/cuda-z ${pkgdir}/usr/bin/
}
