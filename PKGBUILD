# Maintainer: Michele Mocciola <mickele>
pkgname=aster
pkgver=11.7.0
pkgrel=1
pkgdesc="Code-Aster"
url="http://www.code-aster.org/"
license="GPL"
depends=('python2' 'astk>=1.13.4' 'metis4' 'med>=3.0.7' 'mumps>=4.10.0-7')
makedepends=()
install="${pkgname}.install"
arch=('i686' 'x86_64')
source=('http://www.code-aster.org/FICHIERS/aster-full-src-11.7.0-1.noarch.tar.gz')
options=(!strip)

_sourcedir=
_installdir=/usr
_installsuff=STA11.7

prepare(){
  cd "${srcdir}"
  tar xzf "${srcdir}/aster-full-src-${pkgver}/SRC/aster-${pkgver}.tgz"
}

build() {
  cd "${srcdir}"

  cd "${srcdir}/aster-${pkgver}"
  INCLUDES="/usr/include/metis-4 /usr/include" PYTHON="/usr/bin/python2" LRELEASE="lrelease-qt4" python2 waf configure --prefix="${pkgdir}${_installdir}" --enable-mumps --metis-libs=metis-4 --scotch-libs='esmumps scotch bz2 scotcherr' --install-as=${_installsuff} --embed-aster
  python2 waf build
  python2 waf build_debug
}

package() {
  cd "${srcdir}/aster-${pkgver}"
  python2 waf install --install-tests
  python2 waf install_debug
  for _FILE in share/aster/${_installsuff}/profile.sh share/aster/${_installsuff}/config.txt include/aster/${_installsuff}/asterf_config.h include/aster/${_installsuff}/asterc_config.h lib/aster/${_installsuff}/aster_pkginfo.py
  do
    sed -e "s|${pkgdir}||g" -i "${pkgdir}${_installdir}/${_FILE}"
  done
}
md5sums=('469a89d443d8a7ea6d95a2e5671628a8')
