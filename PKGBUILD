# Maintainer: mickele

pkgname=aster-hg
pkgver=3646
pkgrel=1
url="http://www.code-aster.org"
license=('GPL')
pkgdesc="Code-aster (Mercurial version)"
arch=('i686' 'x86_64')
install="${pkgname}.install"
depends=('med' 'metis4' 'python2-numpy' 'qt4' 'mumps>=4.10.0-5')
source=("aster::hg+https://bitbucket.org/code_aster/codeaster-src")
options=(!strip)

_installdir=/usr
_installsuff=NEW12

pkgver() {
  cd "${srcdir}"/aster
  hg identify -n
}

build(){
  cd "${srcdir}"/aster
  INCLUDES="/usr/include/metis-4 /usr/include" PYTHON="/usr/bin/python2" LRELEASE="lrelease-qt4" python2 waf configure --prefix="${pkgdir}${_installdir}" --enable-mumps --metis-libs=metis-4 --install-as=${_installsuff} --embed-aster
  python2 waf build
  python2 waf build_debug
}

package(){
  cd "${srcdir}"/aster
  python2 waf install --install-tests
  python2 waf install_debug
  for _FILE in share/aster/${_installsuff}/profile.sh share/aster/${_installsuff}/config.txt include/aster/${_installsuff}/asterf_config.h include/aster/${_installsuff}/asterc_config.h lib/aster/${_installsuff}/aster_pkginfo.py
  do
    sed -e "s|${pkgdir}||g" -i "${pkgdir}${_installdir}/${_FILE}"
  done
}

md5sums=('SKIP')
